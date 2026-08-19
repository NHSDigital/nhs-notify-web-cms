---
layout: mini-hub
title: Providing your own data
nav_title: Personalising your messages
nav_order: 4
permalink: /using-nhs-notify/personalising-your-messages/providing-your-own-data
section: Writing a message
mini_hub_topic: Personalising your messages
mini_hub_pages:
  - title: Overview
    url: /using-nhs-notify/personalising-your-messages
  - title: Personal Demographics Service (PDS) data
    url: /using-nhs-notify/personalising-your-messages/pds-data
  - title: Custom data
    url: /using-nhs-notify/personalising-your-messages/custom-data
  - title: Providing your own data
    url:
    current: true

previous_page:
  title: Custom data
  url: /using-nhs-notify/personalising-your-messages/custom-data
next_page:

published: true
---

Your developer or technical team should include data for your custom personalisation fields in your API or MESH request.

## If you use NHS Notify API

Include a personalisation block for each message in your API request.

For example, if you want to include `((gpSurgery))` and `((appointmentDate))` as custom personalisation fields, the personalisation block for one message will be:

{% include components/inset-text.html
  text='`personalisation: {`<br>
`"gpSurgery": "The Health Centre, Knaresborough Road",`<br>
`"appointmentDate": "15 January 2027"`<br>
`}`'
%}

To find out where to add this in your request, go to <a href="https://digital.nhs.uk/developer/api-catalogue/nhs-notify#post-/v1/message-batches" target="_blank">NHS Notify API (opens in a new tab)</a>.

## If you use NHS Notify MESH

Include the custom personalisation fields as column headings in the CSV file you use in your request. Put the personalisation data for each message in the rows underneath, with one row per message.

The column heading should start with `personalisation_`  followed by the same wording as the personalisation field in your template.

For example, if your personalisation fields are `((gpSurgery))` and `((appointmentDate))`, the column headings will be:

{% include components/inset-text.html
text='`personalisation_gpSurgery`
`personalisation_appointmentDate`'
%}

The CSV file you use in your MESH request is different to the CSV example data file for custom personalisation fields.

Read more about <a href="https://digital.nhs.uk/developer/api-catalogue/nhs-notify-mesh/sending-a-message" target="_blank">sending a message with NHS Notify MESH (opens in a new tab)</a>.

## Example data

After you request a proof, we’ll include example data in the proof we email to you. This allows you to check how personalisation will be displayed in your message.

The data in personalisation fields can affect message cost and length.

Find out how to [approve your messages before we send them]({% link pages/using-nhs-notify/approve-your-messages.md %}).
