---
layout: mini-hub
title: Paragraphs, line breaks, and horizontal lines
nav_order: 6
permalink: /using-nhs-notify/formatting/paragraphs
mini_hub_topic: Formatting
mini_hub_pages:
  - title: Overview
    url: /using-nhs-notify/formatting/overview
  - title: Bold text
    url: /using-nhs-notify/formatting/bold-text
  - title: Bullet points and numbered lists
    url: /using-nhs-notify/bullet-points-numbered-lists
  - title: Fonts for letter templates
    url: /using-nhs-notify/letter-fonts
  - title: Headings
    url: /using-nhs-notify/headings
  - title: Paragraphs, line breaks, and horizontal lines
    url:
    current: true

previous_page:
  title: Headings
  url: /using-nhs-notify/headings
next_page:

published: true
---

You can add paragraphs and line breaks to:

- NHS App messages
- emails
- letters

You can add horizontal lines to emails, to create separate sections.

{% include components/inset-text.html
text='Find out more about <a href="https://service-manual.nhs.uk/content/writing-nhs-messages" target="_blank"> writing NHS messages (NHS Digital service manual)</a>.'
classes='nhsuk-u-margin-top-2'
%}

## Add a paragraph

To add a paragraph to NHS App messages or emails, use a blank line between each paragraph. For example:

{% include components/inset-text.html
  text='`line 1`<br><br>`line 2`<br><br>`line 3`'
  classes='nhsuk-u-margin-top-2'
%}

To add paragraphs to letters, use the style Normal in the template for body text.

Paragraphs can be split across 2 pages. If you do not want a paragraph to run over different pages, add a page break in Microsoft Word before the paragraph:

1. Select **Insert**
2. Select **Pages**
3. Select **Page break**

## Add a line break

To add line breaks to NHS App messages or emails, use 2 spaces at the end of each line. Copy this example to add line breaks to NHS App messages and emails:

{% include components/inset-text.html
  text='`line 1`&nbsp;&nbsp;<br />`line 2`&nbsp;&nbsp;<br />`line 3`'
  classes='nhsuk-u-margin-top-2'
%}

## Add a horizontal line

Use a horizontal line to create separate sections in emails.

To add a horizontal line between 2 paragraphs, use 3 dashes. Leave one empty line space after the first paragraph. For example:

{% include components/inset-text.html
text='`First paragraph`

`---`

`Second paragraph`'
classes='nhsuk-u-margin-top-2'
%}
