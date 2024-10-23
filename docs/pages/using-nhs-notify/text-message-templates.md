---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Text message templates
parent: Using NHS Notify
nav_order: 3
permalink: /using-nhs-notify/text-message-templates
section: Writing a message
---

Upload a Word document of your text message and NHS Notify will send it for you.

## How to edit your text message using our template

Download our [text message template](/assets/worddocs/Text%20message%20template%20NHS%20Notify%202.docx) to set up your text message.

You can save the template and edit it with your message content.

## Formatting your text message

Organise your message content using the styles in the template.

If you’re copying and pasting text from another document, paste it without any formatting. Then [apply the styles](https://support.microsoft.com/en-gb/office/apply-styles-f8b96097-4d25-4fac-8200-6139c8093109) in the template.

You can also use [Microsoft Word’s format painter](https://support.microsoft.com/en-gb/office/use-the-format-painter-4bb415a9-d4e4-42b7-b579-170adc594e40) to copy the formatting of the styles and apply it to your text.

Find out how to use:

- [personalisation](#personalisation)<!-- markdownlint-disable-line -->
- [body text](#body-text)
- [links](#links)

You can also find out about:

- [message length](#message-length)<!-- markdownlint-disable-line -->
- [attachments](#attachments)<!-- markdownlint-disable-line -->
- [images](#images)
- [telling recipients who your email is from](#telling-recipients-who-your-email-is-from)

## Personalisation

To add a personalisation field, include a placeholder with double brackets around it. For example:

{% include components/inset-text.html
    text='Hello ((firstName)), your NHS Number is ((nhsNumber))'
%}

Read about the [personalisation fields]({% link pages/using-nhs-notify/personalisation.md %}) that are available in the Personal Demographics Service (PDS) and how to provide your own personalisation data.

## Body text

Use the style 'Normal' in the template for body text.

## Links

Use the style ‘Hyperlink' in the template for links.

Write links in full, starting with https://. For example:

{% include components/inset-text.html
    text='<b><span>https://www.service-manual.nhs.uk/content</span></b>'
%}

### Short URLs

If you have a long, complex web address, you can [request a short URL from GOV.UK](https://www.gov.uk/guidance/contact-the-government-digital-service/request-a-thing#short-url). This can take some time and may delay your template creation.

We do not recommend using a third-party link shortening service because:

- your users cannot see where the link will take them
- your link might stop working if there’s a service outage
- you can no longer control where the redirect goes

## Message length

If a text message is longer than 160 characters, it will be charged as more than one message.

If you're using personalisation fields, it could make your message longer.

Learn more about [character counts and text message pricing]({% link pages/pricing/text-messages.md %}).

## Attachments

We do not currently support sending files as attachments with text messages.

If you need to send an attachment, host the attachment separately on a website and add a link to it in your message content.

## Images

We do not currently support images in text messages.

If you need to send an image, host it separately on a website and add a link to it in your message content.

## Telling recipients who your email is from

Find out how to set up your [reply-to email address]({% link pages/using-nhs-notify/tell-recipients-who-your-messages-are-from.md %}). This is the email address that your emails are sent from and that recipients can reply to.
