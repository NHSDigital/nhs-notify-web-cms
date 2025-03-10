---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: no-nav-page
title: Accessibility statement
permalink: /accessibility/
---

This accessibility statement applies to [notify.nhs.uk](https://notify.nhs.uk/).

It does not apply to:

- [NHS Notify API catalogue page](https://digital.nhs.uk/developer/api-catalogue/nhs-notify)
- [NHS Notify MESH catalogue page](https://digital.nhs.uk/developer/api-catalogue/nhs-notify-mesh)
- [NHS Notify service catalogue page](https://digital.nhs.uk/services/nhs-notify)

This website is run by the NHS Notify team at NHS England. We want as many people as possible to be able to use this website. For example, that means you should be able to:

- change colours, contrast levels and fonts using browser or device settings
- zoom in up to 400% without the text spilling off the screen
- navigate most of the website using a keyboard or speech recognition software
- listen to most of the website using a screen reader (including the most recent versions of JAWS, NVDA and VoiceOver)

We’ve also made the website text as simple as possible to understand.

[AbilityNet](https://mcmw.abilitynet.org.uk/) has advice on making your device easier to use if you have a disability.

## Feedback and contact information

If you find any problems not listed on this page or think we’re not meeting accessibility requirements, contact us by sending an email to <england.nhsnotify@nhs.net>.

## Enforcement procedure

The Equality and Human Rights Commission (EHRC) is responsible for enforcing the Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility Regulations 2018 (the ‘accessibility regulations’). If you’re not happy with how we respond to your complaint, [contact the Equality Advisory and Support Service (EASS)](https://www.equalityadvisoryservice.com/).

## Technical information about this website's accessibility

NHS Notify is committed to making its website accessible, in accordance with the Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility Regulations 2018.

## Compliance status

The website has been tested against the Web Content Accessibility Guidelines (WCAG) 2.2 AA standard.

This website is partially compliant with the Web Content Accessibility Guidelines version 2.2 AA standard, due to the non-compliances listed in the next section.

## Non-accessible content

The following content is non-accessible for the following reasons.

### Non-compliance with the accessibility regulations

The NHS logo image in the header is missing an appropriate aria-label, making it hard for people with screen readers to understand what the image is. This fails WCAG 2.2 success criterion 1.1.1 (non-text content).

We plan to add an aria-label to this image in a future release.

When using 'create and submit a template', people using screen readers may not understand the relationship of the template guidance to the main task of creating a template. Additionally, when the tables in the preview screens are resized, a logical tab order is not maintained. This fails WCAG 2.2 success criterion 1.3.1 (info and relationships).

In a future release we plan to:

- amend the HTML structure to reflect the intended relationships between the guidance and the main task of creating a template
- ensure a logical tab order when the screen is resized

Autocomplete is turned off by default, making it harder to fill out any form elements when using 'create and submit a template'. This fails WCAG 2.2 success criterion 1.3.5 (identity input purpose).

Autocomplete is turned off by default because the text a user enters into ‘create and submit a template’ will almost always be different for each submission. This makes autocomplete inappropriate for these fields. When we add new features that ask users for repeatable information, autocomplete will be enabled.

Pages within 'create and submit a template' are missing meaningful titles, making it difficult for people to:

- easily identify if the information on that page is relevant to their needs
- differentiate content when multiple web pages are open
- navigate between web pages when using audio assistive technologies

This fails WCAG 2.2 success criterion 2.4.2 (page titles).

We plan to add page titles that are unique and reflect the purpose of each page in a future release.

Some links such as 'copy' and 'delete' are ambiguous for users, making it difficult for screen reader users to determine what items they are copying or deleting. This fails WCAG 2.2 success criterion 2.4.4 (link purpose).

We plan to add hidden text that can be read by screen readers and better describes what items are being copied or deleted in a future release.

When using a screen reader, it is not clear that the markdown examples in 'create and submit a template' are examples that can be copied. This fails WCAG 2.2 success criterion 2.4.6 (headings and labels).

In a future release, we plan to add hidden text that can be read by screen readers and describes that the markdown examples are examples that can be copied.

## What we're doing to improve accessibility

Our [roadmap]({% link pages/features/roadmap.md %}) shows how and when we plan to improve accessibility on this website.

## Preparation of this accessibility statement

This statement was prepared on Friday 7 March 2024. It was last reviewed on Friday 7 March 2024.

This website was last tested on Thursday 27 February 2025 against the WCAG 2.2 AA standard.

The test was carried out by the NHS Notify research and development team. The most viewed pages were tested using automated testing tools by our team. A further audit of the website was carried out to the WCAG 2.2 AA standard.
