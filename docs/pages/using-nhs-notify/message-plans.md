---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Message plans
parent: Using NHS Notify
nav_order: 4
permalink: /using-nhs-notify/message-plans
section: Sending a message
---

You'll need to create a message plan to decide how messages will be sent to your recipients.

Setting up a message plan can make your messages more effective and sometimes lower messaging costs.

You can set up message plans to:

- [send messages in a cascade](#message-cascades)
- use specific message templates for different groups of recipients
- stop sending messages to a recipient when a channel is successful

## Message plans and contact details from the Personal Demographics Service (PDS)

NHS Notify checks for each recipient's contact details before we send any messages using a message plan.

This means that if we do not find a recipient's contact details for a message channel, we'll automatically skip that channel.

We do not re-check for contact details each time there's a fallback in a message plan.

## Message cascades

A message cascade allows you to message a recipient with different channels in the order you choose. You can set up primary and secondary message cascades in your message plan.

### Primary cascades

Use primary message cascades to send a message with a different channel as a fallback if a primary channel fails.

### Secondary cascades

Use secondary message cascades to send a message with another channel at the same time as your primary channel. For example, sending a text message at the same time as an email. You cannot fall back to another channel with secondary cascades.
