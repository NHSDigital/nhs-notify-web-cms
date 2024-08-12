---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Features
nav_order: 1
has_children: true
permalink: /features/
---

Use NHS Notify to send:

- [NHS App messages]({% link pages/features/nhs-app-messages.md %})
- [emails]({% link pages/features/emails.md %})
- [text messages (SMS)]({% link pages/features/text-messages.md %})
- [letters]({% link pages/features/letters.md %})

## Send messages to different audiences in bulk and individually

You only need a person’s NHS number to send them messages. Choose who you want to message by providing NHS numbers.

## Write your messages

Create reusable templates for the message channels you want to use.

Once you’ve created a template you can:

- [edit and format your messages]({% link pages/using-nhs-notify/editing-and-formatting.md %})
- [add personalisation]({% link pages/using-nhs-notify/personalisation.md %})
- [include links and URLs]({% link pages/using-nhs-notify/links-and-urls.md %})
- [tell recipients who your messages are from]({% link pages/using-nhs-notify/tell-recipients-who-your-messages-are-from.md %})

## Plan how your messages will be sent

Routing plans allow you to send messages to audiences more effectively and sometimes at lower costs.

You can set up routing plans to:

- use certain templates for specific audiences
- message a recipient with each channel in a specific order
- set up fallbacks for messages that fail
- stop sending messages after a channel is successful

{% include components/action-link.html
    url='/using-nhs-notify/routing-plans'
    text='More about routing plans'
%}

## Prevent sending people unnecessary messages

NHS Notify uses the [Personal Demographics Service](https://digital.nhs.uk/services/personal-demographics-service) to automatically prevent you from messaging [recipients you cannot message]({% link pages/using-nhs-notify/recipients-you-cannot-message.md %}).

## Reach audiences with additional needs

You can use NHS Notify to:

- [send letters in other languages]({% link pages/using-nhs-notify/letters-in-other-languages.md %})
- [send letters in accessible formats]({% link pages/using-nhs-notify/accessible-formats.md %})

## See how your messages perform

Track how many messages you’ve sent and find out which ones are not being delivered.

## Automatic sending

To send messages automatically, you’ll need a developer to integrate with the NHS Notify API.

[Read our API documentation (opens in a new tab)](https://digital.nhs.uk/developer/api-catalogue/nhs-notify){:target="\_blank"}.

## Keep your data secure

[Learn more about NHS Notify’s security features.]({% link pages/features/security.md %})

## Get support when you need it

NHS Notify is available 24 hours a day, 365 days a year and supported from 8am to 6pm, Monday to Friday excluding bank holidays.
