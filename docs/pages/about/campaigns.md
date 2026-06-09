---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Campaigns
parent: About
nav_order:
permalink: /about/campaigns
section: Send messages based on your needs
redirect_from: /using-nhs-notify/campaigns
redirect_from: /features/campaigns
---

Use NHS Notify to set up national or targeted campaigns to send messages in bulk to patients and the public.

## Examples of campaign messaging

Create messaging campaigns with NHS Notify to send:

- vaccination invitations
- screening appointment invitations
- health or adult social care research invitations

## Choosing your message order

You can use message plans to decide how and what order messages will be sent to your recipients.

You can send campaign messages in the following ways:

- NHS App message only
- NHS App message, Email
- NHS App message, Text message
- NHS App message, Email, Text message
- NHS App message, Text message, Email
- NHS App message, Text message, Letter
- NHS App message, Email, Text message, Letter
- Letter only

### Fallback rules for messages

If we cannot deliver a message through your first choice, we automatically try the next channel in your message plan. This is called a ‘fallback.’

All digital message channels will immediately fallback to the next channel if it is rejected or an 'unnotified' status is received.

NHS App messages will fallback to the next channel when:

- a 'notified' status is not received within 1 hour
- the message is not read by the recipient within 24 hours

Emails and text messages will fallback to the next channel if they are not delivered after 72 hours.

Letters do not have any fallback rules as they’re always sent last in message plans for transactional messages.

## Using the NHS App for patient journeys

When you send NHS App messages as part of a campaign with NHS Notify, you must adhere to the following in any onward user journeys:

- any links should only open a patients web browser
- links should only take patients to web content such as your website, NHS.UK or other relevant web pages
- do not include links that open other mobile applications

## New and upcoming features for NHS Notify

If you're thinking of using NHS Notify for campaign messaging but cannot find the features you need, read about our [new and upcoming features to find out what we're working on next]({% link pages/about/new-and-upcoming-features.md %}).
