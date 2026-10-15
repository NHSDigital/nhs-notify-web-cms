---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Message plans
parent: Using NHS Notify
nav_order: 4
permalink: /using-nhs-notify/message-plans
section: Sending messages
---

Use message plans to tell us how to send messages to your recipients. You can choose which message channels to use and in what order.

{% include components/inset-text.html
  text='You can now set up message plans yourself in your account. You no longer need to ask NHS Notify to set up message plans for you.'
  classes='nhsuk-u-margin-top-2'
%}

Message plans are sometimes referred to as routing plans or routing configurations.

## Choosing your message order

In **Message plans**, select **New message plan**.

Then **Choose a message order** by selecting an option from a list of pre-defined message plans.

For example: NHS App, email, text message, letter.

## Adding message plan details

Enter a message plan name.

If your service has got multiple campaigns, choose which campaign your message plan will link to.

If your service only has one campaign set up, your message plan will link to this automatically.

Campaigns are a way of grouping messages. They're used for billing and tracking message performance.

## How fallbacks work

If we cannot deliver a message through your first choice, we automatically try the next channel in your message plan.

A fallback happens if:

- the recipient does not have valid contact details for a channel
- the message is not read or delivered within a certain amount of time
- the message fails to send for a technical reason

We'll stop sending messages once a chosen channel is successful.

For example, you might try to send an NHS App message first. If the recipient reads the message within 24 hours, no further messages get sent. If the recipient does not read the first message within 24 hours, we'll then try to send an email.

## Linking your templates

You can choose specific templates for each channel in your message plan.

## Contact details

We check the Personal Demographics Service (PDS) for each recipient's contact details before we start sending messages.

If we do not have a contact detail for a specific channel, we'll skip that channel and move to the next one in your message plan.

We only check for contact details once at the start. We do not re-check PDS each time there is a fallback.
