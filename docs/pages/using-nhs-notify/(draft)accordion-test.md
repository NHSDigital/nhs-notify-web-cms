---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Accordion test
parent: Using NHS Notify
nav_order: 3
permalink: /using-nhs-notify/accordion-test
section: By use case
published: false
---

Use NHS Notify to send messages to your recipients that facilitate transactions between your organisation or service and your patients.

## Examples of transactional messages

Use NHS Notify for transactional messaging to send:

- appointment reminders
- booking confirmations
- test result notifications
- prescription reminders
- discharge information

## How you can use NHS Notify for transactional messages

Find out what features you can use when you send transactional messages with NHS Notify.

{% include components/expander.html
heading='How you can integrate'
text='

| Integration method | Availability |
| ------------------ | ------------ |
| NHS Notify API     | Recommended  |
| NHS Notify MESH    | Yes          |

'
%}

{% include components/expander.html
heading='What message channels and other formats you can use'
text='

| Message channel     | Included |
| ------------------- | -------- |
| NHS App messages    | Yes      |
| Emails              | Yes      |
| Text messages (SMS) | Yes      |
| Letters             | Yes      |

'
%}

{% include components/expander.html
heading='Other message formats you can use'
text='

| Feature                    | Is it included? |
| -------------------------- | --------------- |
| Braille                    | Yes             |
| Large print                | Yes             |
| Audio CD                   | Yes             |
| Letters in other languages | Yes             |

'
%}

{% include components/expander.html
heading='What you can do when writing your messages'
text='

| Feature          | Is it included? |
| ---------------- | --------------- |
| Templates        | Yes             |
| Free-text inputs | Yes             |
| Personalisation  | Yes             |

'
%}

{% include components/expander.html
heading='How you can send your messages'
text='

| Feature        | Is it included? |
| -------------- | --------------- |
| Rate limiting  | Up to 5 TPS     |
| Routing plans  | Yes             |
| Fallback rules | Yes             |
| Parallel send  | Yes             |

'
%}

{% include components/expander.html
heading="Recipients you cannot message with NHS Notify"
text="NHS Notify prevents you from sending messages to specific recipients to make your messaging more effective.

You cannot send transactional messages to recipients with:

- flagged records
- exit codes (also known as reason for removal codes)
- invalid postcodes
- invalid email addresses
- an informal or formal death status

[Find out more about recipients you cannot message](/using-nhs-notify/recipients-you-cannot-message)."
%}
