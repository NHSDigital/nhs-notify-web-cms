---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Formatting
parent: Using NHS Notify
nav_order: 2
permalink: /using-nhs-notify/formatting
section: Writing a message
---

NHS Notify uses Markdown to format message content.

You can see formatting instructions while you’re editing NHS App message, email and text message templates.

To add formatting to a letter, download our blank template, apply the styles then [upload your letter as a PDF](/using-nhs-notify/upload-a-letter).

## Formatting options

NHS App message templates can include:

- [bullet points](#bullet-points)<!-- markdownlint-disable-line -->
- [headings](#headings)
- [numbered lists](#numbered-lists)
- [line breaks and paragraphs](#line-breaks-and-paragraphs)
- [bold text](#bold-text)
- [links and URLs]({% link pages/using-nhs-notify/links-and-urls.md %})

Email templates can include:

- [bullet points](#bullet-points)<!-- markdownlint-disable-line -->
- [headings](#headings)
- [horizontal lines](#horizontal-lines)
- [numbered lists](#numbered-lists)
- [line breaks and paragraphs](#line-breaks-and-paragraphs)
- [links and URLs]({% link pages/using-nhs-notify/links-and-urls.md %})

Text message templates can include [links and URLs]({% link pages/using-nhs-notify/links-and-urls.md %}).

Letter templates can include:

- [bullet points](/using-nhs-notify/upload-a-letter#bullet-points)
- [headings](/using-nhs-notify/upload-a-letter#headings)
- [numbered lists](/using-nhs-notify/upload-a-letter#numbered-lists)
- [page breaks](/using-nhs-notify/upload-a-letter#page-breaks)
- [paragraphs](/using-nhs-notify/upload-a-letter#paragraphs-and-body-text)
- [links and URLs]({% link pages/using-nhs-notify/links-and-urls.md %})
- [images](/using-nhs-notify/upload-a-letter#images)

You can also find out about:

- attachments
- images
- [telling recipients who your message is from]({% link pages/using-nhs-notify/tell-recipients-who-your-messages-are-from.md %})

## Guidance

### Bullet points

Use bullet points to help words or phrases stand out in your content.

Put each item on a separate line with an asterisk and a space in front of each one.

Leave an empty line before the first bullet point and after the last bullet point.

Copy this example to add bullet points to NHS App messages and emails:

{% include components/inset-text.html
text='`Introduce bullet points with a lead-in line ending with a colon:`

`* bullet point 1`<br />
`* bullet point 2`<br />
&nbsp;'
classes='nhsuk-u-margin-top-2'
%}

You cannot use bullet points in text message templates.

Find out how to use [bullet points in letter templates](/using-nhs-notify/upload-a-letter#bullet-points).

### Headings

Use a heading to tell recipients what your message is about.

Use subheadings to break up the rest of your content. Your first subheading must come after a heading.

Use one hash symbol followed by a space for a heading in NHS App messages and emails. For example:

{% include components/inset-text.html
  text='`# This is a heading`'
  classes='nhsuk-u-margin-top-2'
%}

Use 2 hash symbols followed by a space for a subheading in NHS App messages and emails. For example:

{% include components/inset-text.html
  text='`## This is a subheading`'
  classes='nhsuk-u-margin-top-2'
%}

You cannot use headings in text message templates.

Find out how to use [headings in letter templates](/using-nhs-notify/upload-a-letter#headings).

### Horizontal lines

Use a horizontal line to create separate sections in emails.

To add a horizontal line between 2 paragraphs, use 3 dashes. Leave one empty line space after the first paragraph. For example:

{% include components/inset-text.html
text='`First paragraph`

`---`

`Second paragraph`'
classes='nhsuk-u-margin-top-2'
%}

You cannot use horizontal lines in NHS App message, text message and letter templates.

### Numbered lists

Use numbered lists instead of bullet points to guide a user through a process, or when the order of the items in a list is relevant.

You do not need a lead-in line for a numbered list.

Copy this example to add numbered steps to NHS App messages and emails:

{% include components/inset-text.html
text='&nbsp;<br />
`1. Leave one empty line space before starting your list.`<br />
`2. Enter a number followed by a full stop and a space to add an item.`<br />
`3. Start each item with a capital letter and end it with a full stop.`<br />
`4. Leave one empty line space after the last item.`
<br />&nbsp;'
classes='nhsuk-u-margin-top-2'
%}

You cannot use numbered lists in text message templates.

Find out how to use [numbered lists in letter templates](/using-nhs-notify/upload-a-letter#numbered-lists).

### Line breaks and paragraphs

To add a line break, use 2 spaces at the end of your text.

Copy this example to add line breaks to NHS App messages and emails:

{% include components/inset-text.html
  text='`line 1`&nbsp;&nbsp;<br />`line 2`&nbsp;&nbsp;<br />`line 3`'
  classes='nhsuk-u-margin-top-2'
%}

To add a paragraph, use a blank line between each paragraph.

Copy this example to add paragraphs to NHS App messages and emails:

{% include components/inset-text.html
  text='`line 1`<br><br>`line 2`<br><br>`line 3`'
  classes='nhsuk-u-margin-top-2'
%}

You cannot use line breaks and paragraphs in text message templates.

Find out how to use [paragraphs in letter templates](/using-nhs-notify/upload-a-letter#paragraphs-and-body-text).

### Bold text

Use 2 asterisk symbols on either side of the words you want to be bold.

Copy this example to add bold text to NHS App messages:

{% include components/inset-text.html
  text='`**this is bold text**`'
  classes='nhsuk-u-margin-top-2'
%}

You cannot use bold text in emails or text message templates.

To use bold text in letter templates, highlight the font you want to make bold then select 'bold' in the font menu in the home tab.

## Attachments and images

Attachments and images are not currently available for NHS App messages, emails and text messages.

If you need to send an attachment or image, host it separately on a website and add a link to it in your message content.

Find out about [images in letters](/using-nhs-notify/upload-a-letter#images).

If you need to include attachments such as leaflets with your letters, email us at <england.nhsnotify@nhs.net>.
