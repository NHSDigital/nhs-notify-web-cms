---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Personalisation
parent: Using NHS Notify
nav_order: 7
permalink: /using-nhs-notify/personalisation
section: Writing a message
---

You can send personalised messages using a single template.

To personalise a message, use double brackets to add a placeholder to your content. For example:

{% include components/inset-text.html
    text='<code>Hello ((firstName)), your NHS Number is ((nhsNumber))'
%}

### Personal Demographics Service (PDS) personalisation fields

NHS Notify uses the [Personal Demographics Service (PDS)](https://digital.nhs.uk/services/personal-demographics-service) to find and populate certain personalisation fields. You only need to [provide us with recipients' NHS numbers]({% link pages/using-nhs-notify/tell-us-who-you-want-to-message.md %}).

The personalisation fields available in PDS are:

- fullName
- firstName
- middleNames
- lastName
- namePrefix
- nameSuffix
- address_line_1
- address_line_2
- address_line_3
- address_line_4
- address_line_5
- address_line_6
- address_line_7
- nhsNumber
- date
- clientRef
- recipientContactValue
- template

The placeholders in your content need to match the PDS personalisation fields.

## Providing your own personalisation data

You can provide your own personalisation data.

Do not send us personalisation data that's already available in PDS. We'll use the PDS data over your own data in this case.

### If you're using the API

Include a personalisation block in your API request.

For example, if you wanted to include 'practice' as a personalisation field, the personalisation block would be:

{% include components/inset-text.html
    text='{

    "practice": "PRACTICE_NAME",

}'
%}

Read the [API documentation](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#post-/v1/message-batches) to find out where to put this in your request.

### If you're using the Message Exchange for Social Care and Health (MESH)

Include the personalisation fields as columns in your CSV file.

The column names should start with 'personalisation_', followed by the same wording as the placeholders in your template.

For example, if you wanted to include 'practice' as a personalisation field, the column name would be:

{% include components/inset-text.html
    text='nhsNumber,requestItemRefId,dateOfBirth,personalisation_practice'
%}

*[PDS]: Personal Demographics Service
*[MESH]: Message Exchange for Social Care and Health
