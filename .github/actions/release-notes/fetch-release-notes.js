#!/usr/bin/env node

const fs = require('node:fs');
const path = require('node:path');

const DEFAULT_RELEASE_NOTES_JQL = 'project = CCM AND "Release Notes" IS NOT EMPTY AND fixVersion IS NOT EMPTY AND updated >= -365d';
const DEFAULT_RELEASE_NOTES_CACHE_FILE = 'docs/_data/release-notes.json';
const DEFAULT_RELEASE_NOTES_MAX_RESULTS = 50;
const DEFAULT_RELEASE_NOTES_PROJECT_KEY = 'CCM';

async function main() {
  const repoRoot = process.cwd();
  const outputFile = process.env.RELEASE_NOTES_CACHE_FILE || DEFAULT_RELEASE_NOTES_CACHE_FILE;
  const jiraBaseUrl = resolveJiraBaseUrl();

  if (!jiraBaseUrl) {
    throw new Error('Set JIRA_BASE_URL or JIRA_URL before running the release notes sync.');
  }

  const releaseNotesJql = process.env.RELEASE_NOTES_JQL || DEFAULT_RELEASE_NOTES_JQL;
  const maxResults = Number.parseInt(process.env.RELEASE_NOTES_MAX_RESULTS || String(DEFAULT_RELEASE_NOTES_MAX_RESULTS), 10);
  const releaseNotesProjectKey = process.env.RELEASE_NOTES_PROJECT_KEY || DEFAULT_RELEASE_NOTES_PROJECT_KEY;
  const startedAt = new Date();

  if (!Number.isInteger(maxResults) || maxResults <= 0) {
    throw new Error('RELEASE_NOTES_MAX_RESULTS must be a positive integer.');
  }

  if (!process.env.JIRA_TOKEN && !process.env.JIRA_AUTH_HEADER) {
    throw new Error('Set JIRA_TOKEN or JIRA_AUTH_HEADER before running the release notes sync.');
  }

  fs.mkdirSync(path.dirname(path.resolve(repoRoot, outputFile)), { recursive: true });

  console.log(`Fetching release notes from ${jiraBaseUrl}`);

  // Look up the custom field ID once so the search request can read release notes text.
  const fields = await requestFields(jiraBaseUrl);
  const releaseNotesFieldId = resolveReleaseNotesFieldId(fields);
  const projectVersions = await requestProjectVersions(jiraBaseUrl, releaseNotesProjectKey);
  const releaseDatesByName = buildReleaseDateMap(projectVersions);

  console.log(`Resolved Release Notes field: ${releaseNotesFieldId}`);

  const issuesByKey = new Map();
  let startAt = 0;
  let pageNumber = 1;
  let total = 0;

  while (true) {
    // Fetch one page of JIRA issues at a time until we have them all.
    const payload = await requestSearch({
      jiraBaseUrl,
      releaseNotesFieldId,
      jql: releaseNotesJql,
      startAt,
      maxResults,
    });

    total = Number(payload.total || 0);
    const pageIssues = Array.isArray(payload.issues) ? payload.issues : [];
    console.log(`Fetched page ${pageNumber} with ${pageIssues.length} issue(s)`);

    for (const rawIssue of pageIssues) {
      const issue = normalizeIssue(rawIssue, releaseNotesFieldId);
      if (issue) {
        issuesByKey.set(issue.key, issue);
      }
    }

    if (pageIssues.length === 0 || issuesByKey.size >= total) {
      break;
    }

    startAt += maxResults;
    pageNumber += 1;
  }

  const output = {
    releases: groupIssuesByFixVersion(Array.from(issuesByKey.values()), releaseDatesByName),
  };

  fs.writeFileSync(path.resolve(repoRoot, outputFile), `${JSON.stringify(output, null, 2)}\n`, 'utf8');
  console.log(`Updated release notes cache at ${outputFile}`);
}

async function requestFields(jiraBaseUrl) {
  return fetchJson(`${jiraBaseUrl}/field`);
}

async function requestProjectVersions(jiraBaseUrl, projectKey) {
  const encodedProjectKey = encodeURIComponent(projectKey);
  return fetchJson(`${jiraBaseUrl}/project/${encodedProjectKey}/versions`);
}

async function requestSearch({
  jiraBaseUrl,
  releaseNotesFieldId,
  jql,
  startAt,
  maxResults,
}) {
  const url = new URL(`${jiraBaseUrl}/search`);
  url.searchParams.set('jql', jql);
  url.searchParams.set('fields', `summary,fixVersions,issuetype,updated,${releaseNotesFieldId}`);
  url.searchParams.set('startAt', String(startAt));
  url.searchParams.set('maxResults', String(maxResults));

  return fetchJson(url.toString());
}

async function fetchJson(url) {
  const response = await fetch(url, {
    method: 'GET',
    headers: buildHeaders(),
  });

  if (!response.ok) {
    throw new Error(`JIRA request failed with status ${response.status} ${response.statusText}`);
  }

  return response.json();
}

function buildHeaders() {
  const headers = {
    Accept: 'application/json',
  };

  if (process.env.JIRA_AUTH_HEADER && process.env.JIRA_AUTH_HEADER.trim()) {
    const header = process.env.JIRA_AUTH_HEADER;
    const index = header.indexOf(':');
    if (index <= 0) {
      throw new Error('JIRA_AUTH_HEADER must be in the format "Header-Name: value".');
    }
    headers[header.slice(0, index).trim()] = header.slice(index + 1).trim();
    return headers;
  }

  headers.Authorization = `Bearer ${process.env.JIRA_TOKEN}`;
  return headers;
}

function resolveReleaseNotesFieldId(fields) {
  const match = fields.find((field) => String(field.name || '').trim().toLowerCase() === 'release notes');
  if (!match || !match.id) {
    throw new Error("Unable to resolve the JIRA field named 'Release Notes'.");
  }
  return match.id;
}

function buildReleaseDateMap(versions) {
  const releaseDatesByName = new Map();

  if (!Array.isArray(versions)) {
    return releaseDatesByName;
  }

  for (const version of versions) {
    const name = String(version && version.name ? version.name : '').trim();
    const releaseDate = String(version && version.releaseDate ? version.releaseDate : '').trim();

    if (name && releaseDate) {
      releaseDatesByName.set(name, releaseDate);
    }
  }

  return releaseDatesByName;
}

function normalizeIssue(issue, releaseNotesFieldId) {
  const fields = issue && typeof issue === 'object' ? issue.fields || {} : {};
  const fixVersions = Array.isArray(fields.fixVersions)
    ? fields.fixVersions
        .map((version) => String(version && version.name ? version.name : '').trim())
        .filter(Boolean)
    : [];
  const releaseNotes = extractText(fields[releaseNotesFieldId]);
  // Keep only the fields needed by the generated JSON.
  const normalized = {
    key: String(issue && issue.key ? issue.key : '').trim(),
    fix_versions: fixVersions,
    release_notes: releaseNotes,
  };

  if (!normalized.key || !normalized.release_notes || normalized.fix_versions.length === 0) {
    return null;
  }

  return normalized;
}

function resolveJiraBaseUrl() {
  if (process.env.JIRA_BASE_URL && process.env.JIRA_BASE_URL.trim()) {
    return process.env.JIRA_BASE_URL.replace(/\/$/, '');
  }

  if (process.env.JIRA_URL && process.env.JIRA_URL.trim()) {
    return `${process.env.JIRA_URL.replace(/\/$/, '')}/rest/api/2`;
  }

  return '';
}

function extractText(value) {
  if (value === null || value === undefined) {
    return '';
  }

  if (typeof value === 'string') {
    return value.trim();
  }

  if (Array.isArray(value)) {
    return value.map(extractText).filter(Boolean).join('\n').trim();
  }

  if (typeof value === 'object') {
    if (typeof value.text === 'string') {
      return value.text.trim();
    }
    if (Array.isArray(value.content)) {
      return value.content
        .map(extractText)
        .filter(Boolean)
        .join('\n')
        .replace(/\n{3,}/g, '\n\n')
        .trim();
    }
  }

  return String(value).trim();
}

function groupIssuesByFixVersion(issues, releaseDatesByName) {
  const releases = new Map();

  for (const issue of issues) {
    // Group each issue under every fix version it belongs to.
    for (const fixVersion of issue.fix_versions) {
      if (!releases.has(fixVersion)) {
        releases.set(fixVersion, []);
      }
      releases.get(fixVersion).push({
        key: issue.key,
        release_notes: issue.release_notes,
      });
    }
  }

  return Array.from(releases, ([rawName, items]) => ({
    name: formatReleaseName(rawName),
    jira_name: rawName,
    release_date: releaseDatesByName.get(rawName) || null,
    items,
  })).sort(compareReleasesByDateDesc);
}

function compareReleasesByDateDesc(left, right) {
  const leftDate = left.release_date ? Date.parse(left.release_date) : Number.NaN;
  const rightDate = right.release_date ? Date.parse(right.release_date) : Number.NaN;
  const leftHasDate = Number.isFinite(leftDate);
  const rightHasDate = Number.isFinite(rightDate);

  if (leftHasDate && rightHasDate && leftDate !== rightDate) {
    return rightDate - leftDate;
  }

  if (leftHasDate && !rightHasDate) {
    return -1;
  }

  if (!leftHasDate && rightHasDate) {
    return 1;
  }

  return right.name.localeCompare(left.name, undefined, {
    numeric: true,
    sensitivity: 'base',
  });
}

function formatReleaseName(name) {
  const trimmedName = String(name || '').trim();

  // Jira names prefixed with "Release" are displayed as "Core".
  if (/^release\s+/i.test(trimmedName)) {
    return trimmedName.replace(/^release\s+/i, 'Core ');
  }

  // Reformat kebab-case names (e.g. digital-letters-0.0.0 → Digital Letters 0.0.0).
  if (!trimmedName.includes('-') || trimmedName.includes(' ')) {
    return trimmedName;
  }

  return trimmedName
    .split('-')
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join(' ');
}

main().catch((error) => {
  console.error(error.message || error);
  process.exit(1);
});
