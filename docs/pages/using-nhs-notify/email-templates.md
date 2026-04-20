---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Email templates
parent: Using NHS Notify
nav_order: 2
permalink: /using-nhs-notify/email-templates
section: Writing a message
published: false
---

Provide a Word document of your email and NHS Notify will send it for you.

You'll need to:

1. [Download our Microsoft Word template](#how-to-use-our-email-template)<!-- markdownlint-disable-line -->.
2. [Format your email](#how-to-use-our-email-template).
3. Provide your email template to our onboarding team via email at <england.nhsnotifyonboarding@nhs.net>.

## How to use our email template

Download our [email template]({% link assets/worddocs/email-template-nhs-notify.docx %}) to set up your email.

You can save the template and edit it with your message content.

## Formatting your email

Organise your message content using the styles in the template.

If you’re copying and pasting text from another document, paste it without any formatting. Then [apply the styles](https://support.microsoft.com/en-gb/office/apply-styles-f8b96097-4d25-4fac-8200-6139c8093109) in the template.

You can also use [Microsoft Word’s format painter](https://support.microsoft.com/en-gb/office/use-the-format-painter-4bb415a9-d4e4-42b7-b579-170adc594e40) to copy the formatting of the styles and apply it to your text.

Find out how to use:

- [personalisation](#personalisation)<!-- markdownlint-disable-line -->
- [headings](#headings)
- [body text](#body-text)
- [links](#links)
- [bullet points](#bullet-points)

You can also find out about:

- [attachments](#attachments)<!-- markdownlint-disable-line -->
- [images](#images)
- [telling recipients who your email is from](#telling-recipients-who-your-email-is-from)

## Personalisation

You can personalise your emails by adding personalisation fields. [Learn how to use personalisation]({% link pages/using-nhs-notify/personalisation.md %}).

## Headings

Use the style ‘Heading 1' in the template for headings and 'Heading 2' for subheadings.

Use the subject line to tell recipients what your email is about.

Use headings to break your content up and to help recipients find what they need.

Headings have different levels. It's important to follow a logical heading level order. Your first subheading must come after a heading.

## Body text

Use the style 'Normal' in the template for body text.

## Links

Use the style ‘Hyperlink' in the template for links.

For emails, you can convert text into a link instead of writing the full web address. For example:

{% include components/inset-text.html
  text='[content guide on the NHS service manual](https://service-manual.nhs.uk/content)'
  classes='nhsuk-u-margin-top-2'
%}

Link text should tell the recipient what action they need to take and where the link goes.

Never use ‘click here’, ‘click link’, ‘this link’ or ‘more’, as these do not make sense when read out of context.

If the recipient is not expecting to receive an email from you, we recommend using the full URL instead of link text. Start with https://. For example:

{% include components/inset-text.html
  text='https://www.service-manual.nhs.uk/content'
  classes='nhsuk-u-margin-top-2'
%}

### Short URLs

If you have a long, complex web address, you can [request a short URL from GOV.UK](https://www.gov.uk/guidance/contact-the-government-digital-service/request-a-thing#short-url). This can take some time and may delay your template creation.

We do not recommend using a third-party link shortening service because:

- your users cannot see where the link will take them
- your link might stop working if there’s a service outage
- you can no longer control where the redirect goes

## Bullet points

Use the style 'List paragraph' in the template for bullet points.

You can use bullet points to make your text easier to read. Make sure that:

- you use a lead-in line
- the bullets make sense running on from the lead-in line
- you use lower case at the start of the bullet
- there are no commas, full stops or semicolons at the end of bullets

## Attachments

We do not currently support sending files as attachments within emails.

If you need to send an attachment, host the attachment separately on a website and add a link to it in your message content.

## Images

We do not currently support images in emails.

If you need to send an image, host it separately on a website and add a link to it in your message content.

## Telling recipients who your email is from

Find out how to set up your [email sender name and reply-to email address]({% link pages/using-nhs-notify/tell-recipients-who-your-messages-are-from.md %}).
