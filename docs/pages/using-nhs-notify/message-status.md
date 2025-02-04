---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Message, channel and supplier status
parent: Using NHS Notify
nav_order: 7
permalink: /using-nhs-notify/message-channel-supplier-status
section: Sending a message
---

This page describes the statuses you'll see when using NHS Notify API or NHS Notify MESH to find out what's happened to your messages.

{% include components/details.html
heading='If you’re using NHS Notify API'
text='

Check the status of a single message or channel by using the [get message status endpoint](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#get-/v1/messages/-messageId-).

To check the status of multiple messages automatically, use [message status callbacks](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#post-/%3Cclient-provided-message-status-URI%3E).'
%}

{% include components/details.html
heading='If you’re using NHS Notify MESH'
text='

You’ll receive a daily report of messages and channels that have completed that day.'

%}

To get an overall status of a message you've sent using a routing plan, use the [message status](#message-status).

To see the status of a specific channel in your routing plan, use the [channel and supplier status](#channel-and-supplier-status).

## Message status

If you're using a routing plan to send a message using multiple channels, you'll get an overall status for all the channels that were attempted.

Messages can have the following statuses:

| Status             | Description                                                                                                               |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------- |
| created            | The message has been created but has not been processed by NHS Notify.                                                    |
| pending_enrichment | NHS Notify is waiting to check and improve the recipient's contact details using the Personal Demographics Service (PDS). |
| enriched           | NHS Notify has found the recipient's contact details.                                                                     |
| sending            | The message is in the process of being sent.                                                                              |
| delivered          | The message has been successfully delivered.                                                                              |
| failed             | We have failed to deliver the message.                                                                                    |

### Failed messages

Messages and channels that have not reached a recipient will have a 'failed' status with one of the following descriptions:

| Failed message status descriptions                                               |
| -------------------------------------------------------------------------------- |
| The provider could not deliver the message.                                      |
| There was an unexpected error while sending the letter to our printing provider. |
| PDS - patient record invalidated.                                                |
| PDS - patient is formally dead.                                                  |
| PDS - patient is informally dead.                                                |
| PDS - patient has an exit code.                                                  |
| PDS - contact detail is malformed.                                               |
| PDS - patient does not exist.                                                    |

## Channel and supplier status

You can find out what's happened to each channel in a routing plan with the channel or supplier status.

### Channel status descriptions

Each channel can have the following status:

| Status    | Description                                  |
| --------- | -------------------------------------------- |
| created   | The channel has been created.                |
| skipped   | The channel was skipped in the routing plan. |
| sending   | The channel is currently being sent.         |
| delivered | The channel has reached the recipient        |
| failed    | The channel did not reach the recipient      |

### Supplier status descriptions

If you need more detail about a specific channel, you can also use supplier statuses.

Supplier statuses tell you why a channel has a certain channel status. For example, NHS App messages receive a channel status of 'delivered' when NHS Notify receives a supplier status of 'read'.

Find out the supplier statuses you can get and how they map to the channel statuses of:

- [NHS App messages](#nhs-app-message-supplier-status-descriptions) <!-- markdownlint-disable-line -->
- [emails](#email-supplier-status-descriptions)
- [text messages (SMS)](#text-message-supplier-status-descriptions)
- [letters](#letter-supplier-status-descriptions)

#### NHS App message supplier status descriptions

| Status                 | Description                                                                                                                      |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| received               | The supplier received the request to send an NHS App message.                                                                    |
| delivered              | The NHS App message was successfully delivered.                                                                                  |
| read                   | The recipient has opened the NHS App message.                                                                                    |
| notified               | A push notification was sent and displayed on the recipient's device.                                                            |
| notification attempted | A push notification has been sent to the recipient's device but we cannot confirm if the notification was received or displayed. |
| unnotified             | A push notification was not sent or displayed on the recipient's device.                                                         |
| rejected               | The supplier rejected the request to send the NHS App message.                                                                   |

{% include components/image-with-caption.html
    src="nhs-app-status-mapping-1.svg"
    alt="A diagram showing how supplier statuses for NHS App messages map to channel statuses."
    caption="A diagram showing how supplier statuses for NHS App messages map to channel statuses."
%}

#### Email supplier status descriptions

| Status            | Description                                                                                                                                  |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| delivered         | The email was successfully delivered.                                                                                                        |
| permanent_failure | The provider could not deliver the message because the email address was wrong.                                                              |
| temporary_failure | The provider could not deliver the message. This can happen when the recipient’s inbox is full or their anti-spam filter rejects your email. |
| technical_failure | Your message was not sent because there was a problem between NHS Notify and the provider.                                                   |

{% include components/image-with-caption.html
    src="email-status-mapping-1.svg"
    alt="A diagram showing how supplier statuses for emails map to channel statuses."
    caption="A diagram showing how supplier statuses for emails map to channel statuses."
%}

#### Text message supplier status descriptions

| Status            | Description                                                                                                                                                                    |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| delivered         | The text message was successfully delivered.                                                                                                                                   |
| permanent_failure | The provider could not deliver the message. This can happen if the phone number was wrong or if the network operator rejects the message.                                      |
| temporary_failure | The provider could not deliver the message. This can happen when the recipient’s phone is off, has no signal, or their text message inbox is full.                             |
| technical_failure | Your message was not sent because there was a problem between NHS Notify and the provider. You will not be charged for text messages that are affected by a technical failure. |

{% include components/image-with-caption.html
    src="text-message-status-mapping-1.svg"
    alt="A diagram showing how supplier statuses for text messages map to channel statuses."
    caption="A diagram showing how supplier statuses for text messages map to channel statuses."
%}

#### Letter status supplier descriptions

| Status              | Description                                                                                                                                                         |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| accepted            | NHS Notify has sent the letter to the provider to be printed.                                                                                                       |
| received            | The provider has printed and dispatched the letter.                                                                                                                 |
| pending_virus_check | The provider has not yet completed a virus scan of the letter.                                                                                                      |
| cancelled           | Sending cancelled. The letter will not be printed or dispatched.                                                                                                    |
| virus_scan_failed   | The provider has found a potential virus in the precompiled letter file.                                                                                            |
| validation_failed   | Content in the letter file is outside the printable area.                                                                                                           |
| technical_failure   | NHS Notify had an unexpected error while sending the letter to our printing provider. You will not be charged for letters that are affected by a technical failure. |
| permanent_failure   | The provider cannot print the letter. Your letter will not be dispatched.                                                                                           |

{% include components/image-with-caption.html
    src="letter-status-mapping-1.svg"
    alt="A diagram showing how supplier statuses for letters map to channel statuses."
    caption="A diagram showing how supplier statuses for letters map to channel statuses."
%}
