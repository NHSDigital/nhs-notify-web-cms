---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Direct messaging
parent: Using NHS Notify
nav_order: 3
permalink: /using-nhs-notify/direct-messaging
section: By use case
---

Use NHS Notify to support your organisation or service to send individual messages directly to each of your patients.

## Who can use direct messaging

Direct messaging with NHS Notify is recommended for organisations, services or GPIT suppliers in secondary care.

You might send direct messages for:

- online consultations
- general primary care
- acute secondary care appointments

## What features you can use

Find out what features you can and cannot use when you send direct messages with NHS Notify.

{% include custom-components/direct-message-feature-list.html %}

## Using the NHS App for patient journeys

When you send direct messages with NHS Notify, how patients can interact with them and continue their journey depends on your message type.

{% include components/details.html
heading='General primary care messages'
text='
You must adhere to the following in your user journeys:

- the message must only provide information, or its call to action must not involve a digital step (for example, "call your GP")
- message content must be in the message body or if you’re linking to other message content
- any links should only open a patients web browser
- links should only take patients to web-based content such as your website, NHS.UK, a GP’s website, or other relevant web pages
- do not include links that open other mobile applications
  '
  %}

{% include components/details.html
heading='Online consultation (OLC) messages'
text='You must adhere to the following in your user journeys:

- include the clinical response directly in the message body
- use links to your website for additional content or full responses
- links should only open a patients web browser
- do not include links that open other mobile applications
- only include deeplink’s that takes patients into your OLC journey within the NHS App to view a clinicians response
- only allow patients to reply to OLC messages through an external website or as part of the broader OLC journey within the NHS App
  '
  %}

{% include components/details.html
heading='Acute secondary care appointment messages (PEPs)'
text='You must adhere to the following in your user journeys:

- only use content that is standard and created by the Wayfinder programme
- your NHS Trust owns any of the content linked to digital letters or questionnaires
- your NHS App message must link directly to the letter or questionnaire, following the standard Wayfinder patient flow
- all patient replies are handled via questionnaires controlled within the PEP platform, not through the NHS App
  '%}

## See what's next for NHS Notify

If you're thinking of using NHS Notify for direct messaging but cannot find the features you need, [read our roadmap to find out what we're working on next]({% link pages/features/roadmap.md %}).
