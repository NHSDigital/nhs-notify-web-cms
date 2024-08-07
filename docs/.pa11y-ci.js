const fs = require('fs');
const { XMLParser } = require('fast-xml-parser');

const SITEMAP_PATH = './_site/sitemap.xml';

function getUrlsFromSiteMap() {
  const file = fs.readFileSync(SITEMAP_PATH, 'utf8').toString();

  const sitemap = new XMLParser().parse(file);

  return sitemap.urlset.url.map(r => r.loc);
}

module.exports = {
  defaults: {
    reporters: [
      'cli',
      [
        'pa11y-ci-reporter-html',
        {
            destination: './.reports/accessibility',
            includeZeroIssues: true
        }
      ],
    ],
    chromeLaunchConfig: {
      args: ['--no-sandbox']
    },
    rules: [
      'Principle1.Guideline1_3.1_3_1_AAA',
    ],
    useIncognitoBrowserContext: false,
    standard: 'WCAG2AA',
    userAgent: 'pa11y-ci',
    concurrency: 8,
  },
  urls: getUrlsFromSiteMap()
};;
