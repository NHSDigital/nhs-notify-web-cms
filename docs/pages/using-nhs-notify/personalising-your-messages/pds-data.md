---
layout: mini-hub
title: Personal Demographics Service (PDS) data
nav_title: Personalising your messages
nav_order: 2
permalink: /using-nhs-notify/personalising-your-messages/pds-data
section: Writing a message
mini_hub_topic: Personalising your messages
mini_hub_pages:
  - title: Overview
    url: /using-nhs-notify/personalising-your-messages
  - title: Personal Demographics Service (PDS) data
    url:
    current: true
  - title: Custom data
    url: /using-nhs-notify/personalising-your-messages/custom-data
  - title: Providing your own data
    url: /using-nhs-notify/personalising-your-messages/providing-your-own-data

previous_page:
  title: Overview
  url: /using-nhs-notify/personalising-your-messages
next_page:
  title: Custom data
  url: /using-nhs-notify/personalising-your-messages/custom-data
published: true
---

NHS Notify uses the Personal Demographics Service (PDS) to fill personalisation fields in your template. This happens when you [tell us who you want to message]({% link pages/using-nhs-notify/tell-us-who-you-want-to-message.md %}) using recipients’ NHS numbers.

You can use the following PDS fields in your message template:

- fullName
- firstName
- lastName
- nhsNumber
- date

Make sure your personalisation fields in your template match the PDS personalisation fields. This includes using the correct order of upper and lower case letters. For example:

{% include components/inset-text.html
  text='`Hello ((fullName)), your NHS Number is ((nhsNumber)). Your appointment is on ((date)).`'
%}

Learn more about the <a href="https://digital.nhs.uk/services/personal-demographics-service" target="_blank">Personal Demographics Service (PDS) (opens in a new tab)</a>.
