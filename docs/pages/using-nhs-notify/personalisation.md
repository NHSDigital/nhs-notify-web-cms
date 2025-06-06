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

You can send personalised messages by adding personalisation fields to a single template.

Use double brackets to add a personalisation field to your content. Do not include spaces in your personalisation fields. For example:

{% include components/inset-text.html
    text='Hello ((fullName)), your NHS Number is ((nhsNumber))'
%}

You can use:

- [Personal Demographics Service (PDS) personalisation fields](#personal-demographics-service-pds-personalisation-fields)<!-- markdownlint-disable-line -->
- [custom personalisation fields](#custom-personalisation-fields)

## Personal Demographics Service (PDS) personalisation fields

NHS Notify uses the [Personal Demographics Service (PDS)](https://digital.nhs.uk/services/personal-demographics-service) to find and populate certain personalisation fields for each recipient. This happens automatically when you [tell us who you want to message]({% link pages/using-nhs-notify/tell-us-who-you-want-to-message.md %}) using recipients' NHS numbers.

To use PDS personalisation fields in your templates, choose from the following list:

- fullName
- firstName
- lastName
- nhsNumber
- date

{% include components/inset-text.html
    text='Make sure your personalisation fields exactly match the PDS personalisation fields. This includes using the correct order of upper and lower case letters.'
%}

## Custom personalisation fields

You can add custom personalisation fields that use your own personalisation data.

### If you're using NHS Notify API

Include a personalisation block in your API request.

For example, if you wanted to include 'practice' as a personalisation field, the personalisation block would be:

{% include components/inset-text.html
text='"practice": "PRACTICE_NAME",'
%}

Read the [API documentation](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#post-/v1/message-batches) to find out where to put this in your request.

### If you're using NHS Notify MESH

Include the personalisation fields as columns in your CSV file.

The column names should start with 'personalisation\_', followed by the same wording as the personalisation fields in your template.

For example, if you wanted to include 'practice' as a personalisation field, the column name would be:

{% include components/inset-text.html
    text='nhsNumber,requestItemRefId,personalisation_practice'
%}

### Providing example data

The data used in your personalisation fields can affect the formatting and length of your messages. This could make some messages cost more than expected.

You need to give us example data if you use custom personalisation. This helps us show you what your templates will look like with different lengths of data in your personalisation fields.

Download and fill in our [example personalisation data spreadsheet]({% link assets/personalisationexampledata/personalisation-example-data-nhs-notify.xlsx %}).

The personalisation fields in your message content must match the fields in the 'personalisation field' column of your spreadsheet.

For each personalisation field, you need to provide examples that are:

- short
- medium
- long

For example, if you had ((hospital_address_line)) as a personalisation field, you might choose the following example data:

{% include components/inset-text.html
text='

- Hospital A (short)
- Hospital ABCDE (medium)
- Hospital ABCDEFGHIJKLMN (long)'
  %}

You can decide how many characters to use for each length.

If the information for a field will always be the same length, give us 3 different examples that are all that same length.

Your example data does not need to be real data.

### Fields to avoid for custom personalisation

If you want to use custom personalisation, do not use the following personalisation fields:

- [PDS personalisation fields](#personal-demographics-service-pds-personalisation-fields)
- emailAddress
- phoneNumber
- addressLine1
- addressLine2
- addressLine3
- addressLine4
- addressLine5
- addressLine6
- addressLine7
- middleNames
- namePrefix
- nameSuffix
- date
- clientRef
- recipientContactValue
- template

{% include components/inset-text.html
    text='Custom personalisation will not work if you use these fields. This includes any variations, for example, if you add spaces, punctuation, and upper or lower case letters.'
%}

You can include extra words in your custom personalisation fields to make them different.

For example, if you wanted to include GP practice phone number, your personalisation field could be:

{% include components/inset-text.html
    text='((GP_phoneNumber))'
%}
