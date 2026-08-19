---
layout: mini-hub
title: Custom data
nav_title: Personalising your messages
nav_order: 3
permalink: /using-nhs-notify/personalising-your-messages/custom-data
section: Writing a message
mini_hub_topic: Personalising your messages
mini_hub_pages:
  - title: Overview
    url: /using-nhs-notify/personalising-your-messages
  - title: Personal Demographics Service (PDS) data
    url: /using-nhs-notify/personalising-your-messages/pds-data
  - title: Custom data
    url:
    current: true
  - title: Providing your own data
    url: /using-nhs-notify/personalising-your-messages/providing-your-own-data

previous_page:
  title: Personal Demographics Service (PDS) data
  url: /using-nhs-notify/personalising-your-messages/pds-data
next_page:
  title: Providing your own data
  url: /using-nhs-notify/personalising-your-messages/providing-your-own-data
published: true
---

You can add custom personalisation fields to use your own data that’s not available through the Personal Demographics Service (PDS).

{% include components/inset-text.html
  text='You can use your own data alongside PDS data to personalise the same message template. But you can only use custom data fields that do not already exist in PDS.'
%}

You need to provide the data for your custom personalisation fields in your API or MESH request. Find out more about [providing your own custom data](https://notify.nhs.uk/using-nhs-notify/personalising-your-messages/providing-your-own-data).

## Fields you cannot use

If you use your own data, you cannot use the following personalisation fields:

<!-- vale off -->
- any PDS personalisation fields
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
<!-- vale on -->

{% include components/inset-text.html
  text='Using these fields will cause custom personalisation to fail. This includes variations, like adding spaces, punctuation, and upper or lower case letters.'
%}

You can add words or underscores to custom personalisation fields, to make them different to the fields to avoid. For example, if you want to include GP surgery phone number, your personalisation field could be:

{% include components/inset-text.html
  text='`((GP_phoneNumber))`'
%}

## Adding personalised links

To add personalised links and URLs, include personalisation fields for both the link text and the URL in your template. For example:

{% include components/inset-text.html
  text='`[((link_text))](((link_URL)))`'
%}

If your NHS App message links to a service that requires users to sign in, your organisation must be set up with NHS login. Find out how to <a href="https://digital.nhs.uk/services/nhs-login/nhs-login-for-partners-and-developers/nhs-login-integration-toolkit/apply-for-nhs-login" target="_blank">apply for NHS login (opens in a new tab)</a>.
