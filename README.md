# NHS Notify Web CMS Repository

[![CI/CD Pull Request](https://github.com/NHSDigital/nhs-notify-web-cms/actions/workflows/cicd-1-pull-request.yaml/badge.svg)](https://github.com/NHSDigital/nhs-notify-web-cms/actions/workflows/cicd-1-pull-request.yaml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=NHSDigital_nhs-notify-web-cms&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=NHSDigital_nhs-notify-web-cms)

## About this project

- This site includes the content for the public [N]HS Notify web site](https://notify.nhs.uk/)
- It uses Jekyll to generate static web HTML files from markdown content
- the source code for the web site is in /docs folder
- page content is inside the `/docs/pages` folder
- page css is inside `/docs/_sass` folder

## Release notes data sync

- Release notes data is generated into `docs/_data/release-notes.json`
- The cache is refreshed by `.github/workflows/release-notes-sync.yaml`
- The workflow supports a weekly scheduled run and manual `workflow_dispatch`
- Set the `JIRA_TOKEN` GitHub Actions secret before enabling the workflow
- The sync action resolves the custom `Release Notes` field dynamically from the JIRA API, so the field ID is not hard coded in the repository
- The webpage is published to GitHub Pages using [this GitHub Actions workflow](.github/workflows/jekyll-gh-pages.yml)

## Getting Started - First time setup

This is only needed once.

To get started, please create a new GitHub workspace from the main branch.

This will setup a development environment for you to edit the web site in. The first time this runs, it will take approximately 10 minutes. You do not need to install ANY tools on your local computer.

### Pre-requisites

- A GitHub account
- For submitting changes; [**code must be signed** with a GPG key](setup/gpg.md) linked to your GitHub account.

#### Setup guides

- [GPG setup for Codespaces](setup/gpg.md)
- [First-time Codespaces setup](setup/codespaces.md)
- [GitHub Copilot quick start](setup/copilot.md)
- [FAQ](setup/faq.md)

### Making a changes checklist

- Create a new branch in your workspace
- Commit the changes to your new branch
- Push (publish) the new branch to your remote
- Create a Pull Request for requesting that your remote branch is merged into main
- Seek and await approvals
- Do not merge changes if all checks or are not passing.
  ![Screenshot of a PR failing](assets/img/README-pr-review.png)

### Open existing Codespaces

- You can reuse existing Codespaces that have been setup.
- Visit [https://github.com/codespaces](https://github.com/codespaces) to see a list of Codespaces
- Active Codespaces are charged. Everyone gets 150 hours free per month.
- Click on the `three dots` and then click `stop codespace` to change it to inactive
- A stopped code space does **not** loose data
- You can delete a Codespace, but this **will** loose any data that you have not pushed (published) to a remote git branch.
