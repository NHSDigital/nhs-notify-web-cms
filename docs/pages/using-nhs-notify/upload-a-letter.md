---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Uploading a letter
parent: Using NHS Notify
nav_order: 4
permalink: /using-nhs-notify/upload-a-letter
section: Writing a message
---

Upload a Microsoft Word version of your letter and we’ll print and post it for you.

## How to create your letter template

1. Download a blank Word letter template.
2. Download the correct [fonts for letter templates]({% link pages/using-nhs-notify/formatting/formatting-fonts.md %}).
3. Add your letter content to the blank template.
4. Add [formatting]({% link pages/using-nhs-notify/formatting/formatting-overview.md %}).
5. Add [personalisation]({% link pages/using-nhs-notify/personalisation.md %}) fields by using single curly brackets with d. at the start. For example, {d. appointmentDate}.

## How to upload your letter template

How you upload your template depends on whether:

- you use the ServiceNow letter request process
- we've invited you to use the **Upload a letter template** feature in your NHS Notify account

{% include components/inset-text.html
  text='It can take up to 2 days for letters to be dispatched once you’ve uploaded them. Find out more about [delivery times](https://notify.nhs.uk/using-nhs-notify/delivery-times).'
%}

### If you use the ServiceNow request process

Name your letter template clearly so it’s easy to identify, and include:

- service name
- campaign, cohort or topic of your message
- language used, including English
- accessible format or standard format used
- message channel (letter)
- version number

For example:

{% include components/inset-text.html
  text='vaccinations_under-16_english_standard_letter_v1'
%}

Upload your final letter template by submitting <a href="https://nhsdigitallive.service-now.com/csm?id=sc_cat_item&sys_id=6cc625151b9fbad083b0a7d0b24bcb11&referrer=recent_items" target="_blank">ServiceNow request (opens in a new tab)</a>. You can include multiple letter templates.

We’ll send you digital proofs so you [can approve your messages]({% link pages/using-nhs-notify/approve-your-messages.md %}).

{% include components/details.html
heading='How to raise a ServiceNow request for letter templates'
text='

1. Go to <a href="https://nhsdigitallive.service-now.com/csm?id=sc_cat_item&sys_id=6cc625151b9fbad083b0a7d0b24bcb11&referrer=recent_items" target="_blank">ServiceNow (opens in a new tab)</a>.
2. Sign in with your NHS.net account, or register for a Portal account.
3. In the <b>Description</b> field, include the email address you want the proofs sent to and the name of your letter template.
4. For the service, select <b>NHS Notify</b> from the drop-down list.
5. For the service offering, select <b>NHS Notify - letter</b> from the drop-down list.
6. Attach your Word letter templates directly to the request.
   '
   %}

### If you can upload letters using your account

1. Log in to NHS Notify and go to **Templates**. Select **New template**. Choose **Letter** as your template type and select **Continue**.
2. Name your template and choose which campaign it’s for.
3. Choose your file and select **Upload letter template file**.
4. Choose your **Printing and postage**.
5. View the **Letter preview**. Check how your personalisation fields appear using short and long example data.

When you’re ready to approve your letter, select **Approve template**. You can now use this letter in your message plans.

## Download a blank Word letter template

Download a new template each time you create a letter to ensure you’re using the latest version:

- [standard English letter template (DOCX 85KB)]({% link assets/worddocs/letter-template-nhs-notify.docx %})
- [large print English letter template (DOCX 84KB)]({% link assets/worddocs/letter-template-nhs-notify-large-print.docx %})
- [other languages letter template (DOCX 87KB)]({% link assets/worddocs/letter-template-nhs-notify-other-language.docx %})
- [other languages (right-aligned) letter template (DOCX 87KB)]({% link assets/worddocs/letter-template-nhs-notify-other-language-right-aligned.docx %})
- [parent or guardian English letter template (DOCX 83KB)]({% link assets/worddocs/letter-template-nhs-notify-parent-or-guardian.docx %})

You’ll need the desktop Microsoft Word app.

If you need [accessible formats]({% link pages/using-nhs-notify/accessible-formats.md %}), set them up using the standard English letter template.

Find out more about [letters in other languages]({% link pages/using-nhs-notify/letters-in-other-languages.md %}).

## Formatting your letter template

Keep the comments and pre-formatted text in the template until you’ve finished adding your message content. They’ll help you to apply the styles.

Organise your letter content using the styles in the template. If you’re copying and pasting text from another document, paste it without any formatting and apply the styles in the template. Find out how to [customise or create new styles (Microsoft website)](https://support.microsoft.com/en-gb/office/customize-or-create-new-styles-d38d6e47-f6fc-48eb-a607-1eb120dec563).

You can also use [Microsoft Word's format painter](https://support.microsoft.com/en-gb/office/use-the-format-painter-4bb415a9-d4e4-42b7-b579-170adc594e40) to copy the formatting of the styles and apply it to your text.

{% include components/inset-text.html
  text="Do not change the page margins in the letter template, your letter may not print correctly."
  classes='nhsuk-u-margin-top-2'
%}

Find out more about [formatting]({% link pages/using-nhs-notify/formatting/formatting-overview.md %}) your letter templates.

## Links and URLs

Use the style **Hyperlink** in the template for links.

Links in letters are in bold to make them stand out. Do not use underlined text or italics.

Do not split links across different pages. Add a page break before the paragraph with the link if needed.

Learn more about [links and URLs]({% link pages/using-nhs-notify/links-and-urls.md %}).

## Images

Images must be black and white. Position them within the same page margins as the text.

## QR codes

If you want to include a QR code, put it in the body of your letter. Insert it as an image.

You'll need to generate the QR code yourself.

You must also provide a short URL or written instructions for how to find your webpage. For example:

{% include components/inset-text.html
  text='scan the QR code or visit <b>https://www.notify.nhs.uk</b>'
  classes='nhsuk-u-margin-top-2'
%}

## Content you should not edit

### Address field

The address field fits inside the address window on the envelope.

The address is a personalisation field and is set automatically.

The recipient's name is always included as the first line of the address.

If your letter is about a child, use the parent or guardian letter template. This template includes 'Parent or guardian of' in the first line of the address.

### NHS logo

The NHS logo is black and white. It's positioned in the top right of the letter.

### NHS number

The recipient's NHS number appears above the body content of the letter and is right aligned.

It's a personalisation field and is set automatically.

### Date

The date that will be printed is the date when the letter is dispatched.

It's set automatically.

It appears above the body content of the letter and is right aligned.

### Page count

The page count shows the current page number and the total number of pages. For example:

{% include components/inset-text.html
  text='Page 1 of 2'
  classes='nhsuk-u-margin-top-2'
%}

It updates automatically.
