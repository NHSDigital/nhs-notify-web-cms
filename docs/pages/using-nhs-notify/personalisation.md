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

Use double brackets to add a placeholder to your content. Do not include spaces in your placeholder text. For example:

{% include components/inset-text.html
    text='Hello ((fullName)), your NHS Number is ((nhsNumber))'
%}

You can use:

- [Personal Demographics Service (PDS) personalisation fields](#personal-demographics-service-pds-personalisation-fields)<!-- markdownlint-disable-line -->
- [custom personalisation fields](#custom-personalisation-fields)

## Personal Demographics Service (PDS) personalisation fields

NHS Notify uses the [Personal Demographics Service (PDS)](https://digital.nhs.uk/services/personal-demographics-service) to find and populate certain personalisation fields for each recipient. This happens automatically when you [tell us who you want to message]({% link pages/using-nhs-notify/tell-us-who-you-want-to-message.md %}) using recipients' NHS numbers.

You can use the following PDS personalisation fields in your templates:

- fullName
- firstName
- lastName
- nhsNumber
- date

Any placeholders in your content need to match the PDS personalisation fields.

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

The column names should start with 'personalisation\_', followed by the same wording as the placeholders in your template.

For example, if you wanted to include 'practice' as a personalisation field, the column name would be:

{% include components/inset-text.html
    text='nhsNumber,requestItemRefId,personalisation_practice'
%}

### Providing example data

The data used in your personalisation fields can affect the formatting and length of your messages. This could make some messages cost more than expected.

You'll need to provide example data if you're using custom personalisation fields. This is so that we can show you what your templates will look like with different lengths of data in your personalisation fields.

Download and complete our [example personalisation data spreadsheet]({% link assets/personalisationexampledata/personalisation-example-data-nhs-notify.xlsx %}).

The placeholders in your content must match the fields in the 'personalisation field' column.

You'll need to provide short, medium and long lengths of example data for each of your personalisation fields.

For example, if you had ((hospital_address_line)) as a personalisation field, you might choose the following example data:

{% include components/inset-text.html
text='

- Hospital A - short length
- Hospital ABCDE - medium length
- Hospital ABCDEFGHIJKLMN - long length'
  %}

It's up to you to decide how many characters to use for the different lengths.

If your data will be a fixed length for a particular personalisation field, use 3 different examples of the same length.

Your example data does not need to be real data.

### Fields to avoid for custom personalisation

If you want to use custom personalisation, do not use the following placeholders:

- emailAddress
- phoneNumber
- addressLine1
- addressLine2
- addressLine3
- addressLine4
- addressLine5
- addressLine6
- addressLine7
- [PDS personalisation fields](#personal-demographics-service-pds-personalisation-fields)

Custom personalisation will not work if you try to add it using these placeholders. This includes variations such as spaces and upper or lower cases.

You can include extra words in your custom personalisation placeholders to make them different from the fields to avoid.

For example, if you wanted to include GP practice phone number as a custom personalisation field, your placeholder could be:

{% include components/inset-text.html
    text='((GP_phoneNumber))'
%}
