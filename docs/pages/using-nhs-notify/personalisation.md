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

NHS Notify uses the [Personal Demographics Service (PDS)](https://digital.nhs.uk/services/personal-demographics-service) to find and populate certain personalisation fields for each recipient. This happens automatically when you [tell us who you want to message]({% link pages/using-nhs-notify/tell-us-who-you-want-to-message.md %}) using recipients' NHS numbers.

You can use the following PDS personalisation fields in your templates:

- fullName
- firstName
- middleNames
- lastName
- namePrefix
- nameSuffix
- nhsNumber
- date

Any placeholders in your content need to match the PDS personalisation fields.

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

The column names should start with 'personalisation\_', followed by the same wording as the placeholders in your template.

For example, if you wanted to include 'practice' as a personalisation field, the column name would be:

{% include components/inset-text.html
    text='nhsNumber,requestItemRefId,dateOfBirth,personalisation_practice'
%}

_[PDS]: Personal Demographics Service
_[MESH]: Message Exchange for Social Care and Health
