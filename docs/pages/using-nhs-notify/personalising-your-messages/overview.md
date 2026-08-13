---
layout: mini-hub
title: Overview
redirect_from: /using-nhs-notify/personalisation
nav_title: Personalising your messages
nav_order: 1
permalink: /using-nhs-notify/personalising-your-messages
section: Writing a message
mini_hub_topic: Personalising your messages
mini_hub_pages:
  - title: Overview
    url: /using-nhs-notify/personalising-your-messages
    current: true
  - title: Personal Demographic Service (PDS) data
    url: /using-nhs-notify/personalising-your-messages/pds-data
  - title: Custom data
    url: /using-nhs-notify/personalising-your-messages/custom-data
  - title: Providing your own data
    url: /using-nhs-notify/personalising-your-messages/providing-your-own-data

previous_page:

next_page:
  title: Personal Demographic Service (PDS) data
  url: /using-nhs-notify/personalising-your-messages/pds-data
published: true
---

You can use NHS Notify to personalise messages with details like a recipient's name, appointment times, or reference numbers to your messages.

You can add personalisation fields to:

- NHS App messages
- emails
- text messages
- letters

You can personalise messages using data from the Personal Demographic Services (PDS), or your own custom data.

## Adding personalisation fields to message templates

You’ll need to add personalisation fields to your message templates, to send personalised messages to recipients.

Use double brackets to add personalisation fields to NHS App messages, text messages, or email templates. Do not include spaces in your personalisation fields. For example:

{% include components/inset-text.html
  text='`Hello ((fullName)), your NHS Number is ((nhsNumber)). Your appointment is on ((appointmentDate)) at ((gpSurgery)).`'
%}

### Adding personalisation fields to letter templates

Use single curly brackets with d. at the start to add personalisation to letter templates. For example:

{% include components/inset-text.html
  text='`Hello {d.fullName}, your NHS Number is {d.nhsNumber}. Your appointment is on {d.appointmentDate} at {d.gpSurgery}.`'
%}

You can read personalisation instructions while you’re editing a template.
