---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Message and channel status
parent: Using NHS Notify
nav_order: 7
permalink: /using-nhs-notify/message-and-channel-status
section: Sending a message
---

You can find out what's happened to your messages and channels by checking the message or channel status.

To get an overall status of a message you've sent using a routing plan, use the [message status](#message-status).

To see the status of a specific channel in your routing plan, use the [channel status](#channel-status).

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

## Message status

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

## Channel status

There are specific statuses for each message channel:

- [NHS App status descriptions](#nhs-app-message-status-descriptions) <!-- markdownlint-disable-line -->
- [Email status descriptions](#email-status-descriptions)
- [Text message status descriptions](#text-message-status-descriptions)
- [Letter status descriptions](#letter-status-descriptions)

### NHS App message status descriptions

| Status                 | Description                                                                                                                      |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| received               | The supplier received the request to send an NHS App message.                                                                    |
| created                | The NHS App message has been created.                                                                                            |
| skipped                | The NHS App message has been skipped.                                                                                            |
| sending                | The NHS App message is in the process of being sent.                                                                             |
| delivered              | The NHS App message was successfully delivered.                                                                                  |
| read                   | The recipient has opened the NHS App message.                                                                                    |
| notified               | A push notification was sent and displayed on the recipient's device.                                                            |
| notification attempted | A push notification has been sent to the recipient's device but we cannot confirm if the notification was received or displayed. |
| unnotified             | A push notification was not sent or displayed on the recipient's device.                                                         |
| rejected               | The supplier rejected the request to send the NHS App message.                                                                   |
| failed                 | [Read more about failed messages descriptions](#failed-messages).                                                                |

### Email status descriptions

| Status            | Description                                                                                                                                  |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| created           | The email has been created.                                                                                                                  |
| skipped           | The email has been skipped.                                                                                                                  |
| sending           | The email is in the process of being sent.                                                                                                   |
| delivered         | The email was successfully delivered.                                                                                                        |
| failed            | [Read more about failed messages descriptions](#failed-messages).                                                                            |
| permanent_failure | The provider could not deliver the message because the email address was wrong.                                                              |
| temporary_failure | The provider could not deliver the message. This can happen when the recipient’s inbox is full or their anti-spam filter rejects your email. |
| technical_failure | Your message was not sent because there was a problem between NHS Notify and the provider.                                                   |

### Text message status descriptions

| Status            | Description                                                                                                                                                                    |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| created           | The text message has been created.                                                                                                                                             |
| skipped           | The text message has been skipped.                                                                                                                                             |
| sending           | The text message is in the process of being sent.                                                                                                                              |
| delivered         | The text message was successfully delivered.                                                                                                                                   |
| failed            | [Read more about failed messages descriptions](#failed-messages).                                                                                                              |
| permanent_failure | The provider could not deliver the message. This can happen if the phone number was wrong or if the network operator rejects the message.                                      |
| temporary_failure | The provider could not deliver the message. This can happen when the recipient’s phone is off, has no signal, or their text message inbox is full.                             |
| technical_failure | Your message was not sent because there was a problem between NHS Notify and the provider. You will not be charged for text messages that are affected by a technical failure. |

### Letter status descriptions

| Status              | Description                                                                                                                                                         |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| created             | The letter has been created.                                                                                                                                        |
| accepted            | NHS Notify has sent the letter to the provider to be printed.                                                                                                       |
| skipped             | The letter has been skipped.                                                                                                                                        |
| sending             | The letter is in the process of being sent.                                                                                                                         |
| received            | The provider has printed and dispatched the letter.                                                                                                                 |
| delivered           | The letter was successfully delivered.                                                                                                                              |
| pending_virus_check | The provider has not yet completed a virus scan of the letter.                                                                                                      |
| cancelled           | Sending cancelled. The letter will not be printed or dispatched.                                                                                                    |
| failed              | [Read more about failed messages descriptions](#failed-messages).                                                                                                   |
| virus_scan_failed   | The provider has found a potential virus in the precompiled letter file.                                                                                            |
| validation_failed   | Content in the letter file is outside the printable area.                                                                                                           |
| technical_failure   | NHS Notify had an unexpected error while sending the letter to our printing provider. You will not be charged for letters that are affected by a technical failure. |
| permanent_failure   | The provider cannot print the letter. Your letter will not be dispatched.                                                                                           |
