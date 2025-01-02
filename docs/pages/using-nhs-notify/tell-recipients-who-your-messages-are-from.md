---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Tell recipients who your messages are from
parent: Using NHS Notify
nav_order: 1
permalink: /using-nhs-notify/tell-recipients-who-your-messages-are-from
section: Sending a message
---

It’s important that your recipients know and trust who has sent them a message.

You can change the:

- [NHS App sender name](#nhs-app-sender-name)<!-- markdownlint-disable-line -->
- [text message sender name](#text-message-sender-name)
- [email sender name and from address](#email-sender-name-and-from-address)
- [reply-to email address](#reply-to-email-address)

## Return addresses for letters

You cannot change the return addresses of letters. These are set by NHS Notify’s suppliers and are printed on the envelopes.

If you want users to reply to your letters, include your organisation or service's address in the content of your [letter templates]({% link pages/using-nhs-notify/letter-templates.md %}).

## NHS App sender name

Your NHS App sender name is shown when you send recipients messages in the NHS App.

{% include components/image-with-caption.html
    src="nhs-app-sender-name-example-nhs-notify-1.png"
    alt="A screenshot of a mobile with an NHS App message open showing where the NHS App sender appears to recipients."
    caption="An example NHS App message that shows how NHS App sender names appear to recipients."
%}

The NHS App uses your service or organisation’s ODS code to set up your NHS App message sender name.

NHS Notify will ask you for your ODS code during onboarding. [Find your ODS code with the ODS Portal](https://odsportal.digital.nhs.uk/){:target="\_blank"}.

If your organisation or service does not have an ODS code, you can [request a code or update your organisation's details](https://digital.nhs.uk/services/organisation-data-service/request-a-new-code-or-update-organisation-details){:target="\_blank"}.

### Using other NHS App sender names

If you send NHS App messages on behalf of other organisations or services, you can use their sender name instead of yours by:

- [overriding your ODS code in NHS Notify API](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#post-/v1/messages){:target="\_blank"}
- [overriding your ODS code in NHS Notify MESH](https://digital.nhs.uk/developer/api-catalogue/nhs-notify-mesh/sending-a-message#how-to-create-your-request){:target="\_blank"}

To use ODS code overrides, contact the onboarding team.

## Text message sender name

The text message sender name shows your recipients who the text message is from.

{% include components/image-with-caption.html
    src="text-message-sender-name-example-nhs-notify-1.png"
    alt="A screenshot of a mobile with a text message that shows where the text message sender name appears to recipients."
    caption="An example text message that shows how text message sender names appear to recipients."
%}

To send text messages, you must choose and provide a text message sender name during onboarding.

Your text message sender names will be reviewed by the National Cyber Security Centre. This can take up to 2 weeks.

Text message sender names must:

- have a limit of 11 characters
- only contain letters and numbers
- use upper or lower case letters, for example you can use different cases to show separation between words instead of spaces

Text message sender names must not:

- contain spaces or special characters such as @%\_();
- be an existing registered sender name or a variation of one
- be in the list of sender names you cannot use

{% include components/details.html
heading='List of sender names and terms that you cannot use'
text='

Do not use any of the following sender names, terms or any variations in your text message sender name:

- 2FA
- accept
- access
- active
- alert
- app
- appointment
- approved
- auth
- aware
- bank
- banking
- call
- card
- caution
- code
- confirm
- contact
- control
- delivery
- energy
- fraud
- help
- info
- loan
- login
- logistics
- message
- mobile
- MSG
- network
- NHSNoReply
- NHSNotify
- NoReply
- notify
- order
- OTP
- parcel
- pay
- payment
- pin
- rebate
- receipt
- reminder
- reply
- schedule
- secure
- shipping
- SMS
- support
- text
- trace
- TXT
- update
- verify
- winner'

%}

## Email sender name and 'from' address

Your email sender name is shown in your recipient's inbox when you send them an email. It appears alongside the email address your email was sent from, known as the 'from' address.

{% include components/image-with-caption.html
    src="email-sender-name-example-nhs-notify.png"
    alt="A screenshot of an email inbox showing where the email sender name and from address will appear."
    caption="An example of a recipient's inbox showing your email sender name and 'from' address."
%}

Before you can send emails, you must choose and provide your email sender name and 'from' address during onboarding.

### Choosing your email sender name

Use an email sender name that clearly represents your NHS organisation or service.

It should help recipients quickly tell who the email is from, for example:

{% include components/inset-text.html
    text='NHS Vaccination Invitations'
%}

If you send emails for multiple organisations, such as GP surgeries, your email sender name can be more general. It should still be clear who the sender is and that it can be trusted.

Email sender names should not:

- contain special characters such as .@%\_();
- use abbreviations and acronyms unless they're well known by recipients

### Email 'from' address

NHS Notify uses your email sender name to create your 'from' address. If you include spaces in your email sender name, they will be added as full-stops in your 'from' address, for example:

{% include components/inset-text.html
    text='your.email.sender.name@notifications.service.gov.uk'
%}

Emails will always be sent from the notifications.service.gov.uk domain.

## Reply-to email address

A reply-to email address appears when a recipient tries to reply to an email. Emails with a reply-to address seem more trustworthy and are less likely to be labelled as spam.

It must be based on a real mailbox that you've set up, even if you do not monitor or respond to replies.

You must choose and provide your reply-to email address during onboarding.

### If you want recipients to reply to your emails

Include 'reply-to' in your reply-to email address, for example:

{% include components/inset-text.html
    text='reply-to-your-service-name@nhs.net'
%}

### If you do not want recipients to reply to your emails

Include 'no-reply' in your reply-to email address, for example:

{% include components/inset-text.html
    text='no-reply-your-service-name@nhs.net'
%}
