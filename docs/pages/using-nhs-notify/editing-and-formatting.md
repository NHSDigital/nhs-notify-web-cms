---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Editing and formatting
parent: Using NHS Notify
nav_order: 1
permalink: /using-nhs-notify/editing-and-formatting
section: Writing a message
---

NHS Notify uses Markdown to format content for emails and letters.

You can see formatting instructions while you’re editing a template.

## Formatting options

Email templates can include:

- [bullet points](#bullet-points)<!-- markdownlint-disable-line -->
- [headings](#headings)
- [horizontal lines](#horizontal-lines)
- [numbered lists](#numbered-lists)
- [page breaks](#page-breaks)

Letter templates can include:

- [bullet points](#bullet-points)<!-- markdownlint-disable-line -->
- [headings](#headings)
- [horizontal lines](#horizontal-lines)
- [numbered lists](#numbered-lists)
- [page breaks](#page-breaks)

## Guidance

### Bullet points

Use bullet points to help words or phrases stand out in your emails and letters.

You can either:

- add the same bullet points to every message you send
- add personalised bullet points each time you send a message

Copy this example to add bullet points:

{% include components/inset-text.html
  text='<code>Introduce bullet points with a lead-in line ending with a colon:<br><br>- leave one empty line space after the lead-in line <br>- use an asterisk or a dash followed by a space to add an item<br>&nbsp;</code>'
    %}

To create sub-items, add an indent of 2 spaces before the asterisk or dash.

#### How to add personalised bullet points

Copy this example to add a placeholder to your message template:

{% include components/inset-text.html
text='<code>Introduce bullet points with a lead-in line ending in a colon:<br><br>((bullet points))<br><br>Leave one empty line space before the next paragraph. To send the message, upload a list of recipient details.<br><br>Your spreadsheet should include one column for each bullet point. The column names must match the placeholder in the template.<br><br>NHS Notify will fill in the placeholder with your bullet points.'
%}

There's more [guidance about bullet points on GOV.UK](https://www.gov.uk/guidance/style-guide/a-to-z-of-gov-uk-style#bullet-points-steps).

### Headings

Use a heading to tell recipients what your email or letter is about.

For emails, use subheadings to break up the rest of your content. Your first subheading must come after a heading.

For letters, use headings to break up the rest of your content.

Write all headings and subheadings in sentence case.

Use one hash symbol followed by a space for a heading in emails and letters, for example:

{% include components/inset-text.html
    text='<code># This is a heading'
%}

Use 2 hash symbols followed by a space for a subheading in emails, for example:

{% include components/inset-text.html
    text='<code>## This is a subheading'
%}

### Horizontal lines

Use a horizontal line to create separate sections in an email template.

To add a horizontal line between 2 paragraphs, use 3 dashes. Leave one empty line space after the first paragraph. For example:

{% include components/inset-text.html
text='<code>First paragraph<br><br>---<br><br>Second paragraph'
%}

### Numbered lists

Use numbered lists instead of bullet points to guide a user through a process, or when the order of the items in a list is relevant.

You do not need a lead-in line for a numbered list.

Copy this example to add numbered steps:

{% include components/inset-text.html
text='<code><br>1. Leave one empty line space before starting your list.<br>2. Enter a number followed by a full stop and a space to add an item.<br>3. Start each item with a capital letter and end it with a full stop.<br>4. Leave one empty line space after the last item.'
%}

To create sub-items, add an indent of 2 spaces before the number.

There’s more guidance about numbered lists in the GOV.UK Design System.

### Page breaks

To insert a page break in a letter template, use 3 asterisks. For example:

{% include components/inset-text.html
text='<code>Content on page 1<br><br>***<br><br>Content on page 2'
%}
