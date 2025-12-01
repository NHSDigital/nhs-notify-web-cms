---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Personalisation
parent: Using NHS Notify
nav_order: 4
permalink: /using-nhs-notify/personalisation
section: Writing a message
---

## Placing personalisation fields in your template

You can send personalised messages by adding personalisation fields to a single template.

Use double brackets to add a personalisation field to your template. Do not include spaces in your personalisation fields. For example:

{% include components/inset-text.html
text='Hello `((fullName))`, your NHS Number is `((nhsNumber))`. Your appointment is on `((appointmentDate))` at `((gpSurgery))`.'
classes='nhsuk-u-margin-top-2'
%}

You can read personalisation instructions while you’re editing a template.

You can use [Personal Demographics Service (PDS) personalisation fields](#pds-personalisation-fields-automatic-data) and [custom personalisation fields](#custom-personalisation-fields-your-data) in the same template.

## PDS personalisation fields (automatic data)

NHS Notify uses the <a href="https://digital.nhs.uk/services/personal-demographics-service" target="_blank">Personal Demographics Service (PDS)</a> to populate the personalisation fields in your template. This happens when you [tell us who you want to message]({% link pages/using-nhs-notify/tell-us-who-you-want-to-message.md %}) using recipients' NHS numbers.

You can use the following PDS fields:

- fullName
- firstName
- lastName
- nhsNumber
- date

{% include components/inset-text.html
text='Make sure your personalisation fields match the PDS personalisation fields. This includes using the correct order of upper and lower case letters.'
classes='nhsuk-u-margin-top-2'
%}

## Custom personalisation fields (your data)

Use custom personalisation fields when you want to provide your own data that is not available through PDS.

### Sending custom personalisation data in your request

When you go live, you can provide the data for your custom personalisation fields in your API or MESH request.

{% include components/details.html
heading='If you use NHS Notify API'
text='Include a personalisation block for each message in your API request.

For example, if you wanted to include `((gpSurgery))` and `((appointmentDate))` as custom personalisation fields, the personalisation block for one message would be:

`personalisation: {
"gpSurgery": "The Health Centre, Knaresborough Road",
"appointmentDate": "15 January 2027"
}`

Read the <a href="https://digital.nhs.uk/developer/api-catalogue/nhs-notify#post-/v1/message-batches" target="_blank">API documentation (opens in a new tab)</a> to find out where to put this in your request.
'
%}

{% include components/details.html
heading='If you use NHS Notify MESH'
text='Include the custom personalisation fields as column headings in the CSV file you use in your request. Put the personalisation data for each message in the rows underneath, with one row per message.

The column heading should start with `personalisation_` followed by the same wording as the personalisation field in your template.

For example, if your personalisation fields were `((gpSurgery))` and `((appointmentDate))`, the column headings would be:

`personalisation_gpSurgery` and `personalisation_appointmentDate`

The CSV file you use in your MESH request is different to the CSV example data file for custom personalisation fields.

Read more about <a href="https://digital.nhs.uk/developer/api-catalogue/nhs-notify-mesh/sending-a-message" target="_blank">how to create your request with NHS Notify MESH (opens in a new tab)</a>.
'
%}

### Providing example personalisation data

You must provide example data if you use custom personalisation. This means you can check how your templates will look during [proofing]({% link pages/using-nhs-notify/approve-your-messages.md %}), as the data in personalisation fields can affect message cost and length.

You do not need to do this if you only use PDS fields in your template.

Download and fill in the [example data file]({% link assets/personalisationexampledata/personalisation-blank-example-data-nhs-notify.csv %}). You can also download a [completed example file]({% link assets/personalisationexampledata/personalisation-completed-example-data-nhs-notify.csv %}) to check how to format your data.

For each personalisation field, provide short, medium and long examples. For example, if your personalisation field was `((gpSurgery))`, you could use the following example data:

{% include components/inset-text.html
text='

- New Surgery (short)
- The Health Centre, Knaresborough Road (medium)
- Church Avenue and Park Grove Medical Group Surgery (long)
  '
  classes='nhsuk-u-margin-top-2'
  %}

Follow these rules for your example data:

- the personalisation fields in your template must exactly match the fields in the 'personalisation field' column of your spreadsheet
- decide the number of characters for your short, medium and long examples - there are no set lengths
- if a field is always a fixed length, such as a phone number, provide 3 different examples of that fixed length
- your example data does not need to be real user data

### Adding personalised links

To add personalised links and URLs, include personalisation fields for both the link text and the URL in your template. For example:

{% include components/inset-text.html
text='`[((link_text))](((link_URL)))`'
classes='nhsuk-u-margin-top-2'
%}

### Fields to avoid for custom personalisation

If you use custom personalisation, do not use the following personalisation fields:

- any [PDS personalisation fields](#pds-personalisation-fields-automatic-data)
- emailAddress
- phoneNumber
- addressLine1 to addressLine7
- middleNames
- namePrefix
- nameSuffix
- date
- clientRef
- recipientContactValue
- template

{% include components/inset-text.html
text='Using these fields will cause custom personalisation to fail. This includes any variations, for example, if you add spaces, punctuation, and upper or lower case letters.'
classes='nhsuk-u-margin-top-2'
%}

You can include extra words in your custom personalisation fields to make them different to the fields to avoid. For example, if you wanted to include GP surgery phone number, your personalisation field could be:

{% include components/inset-text.html
text='`((GP_phoneNumber))`'
classes='nhsuk-u-margin-top-2'
%}
