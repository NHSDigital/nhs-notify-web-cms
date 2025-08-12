---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Onboard with NHS Notify
parent: Get started
nav_order: 2
permalink: /get-started/onboard-with-nhs-notify
---

Use this page to find out what you need to do step by step to onboard with NHS Notify.

1. [Get invited to onboard](#1-get-invited-to-onboard)<!-- markdownlint-disable-line -->
2. [Prepare your integration](#2-prepare-your-integration)
3. [Confirm your setup to get access to our integration environment](#3-confirm-your-setup-to-get-access-to-our-integration-environment)
4. [Build your integration](#4-build-your-integration)
5. [Complete integration testing](#5-complete-integration-testing)
6. [Apply to go live](#6-apply-to-go-live)
7. [Go live](#7-go-live)

## 1. Get invited to onboard

Once you [get started]({% link pages/get-started/get-started.md %}) and register your interest, we'll contact you to either:

- learn more about your use case
- invite your organisation or service to onboard

If your organisation or service is invited to onboard, we'll send you an email. This email will include:

- what you need to do next
- an online form to confirm your setup
- the Supplier Conformance Assessment List SCAL you need to complete before you go live

## 2. Prepare your integration

You must prepare your integration before you can get access to NHS Notify's integration environment.

You'll need technical or developer support to complete tasks in this step.

### If you're using NHS Notify API

You'll need to:

{% include components/details.html
heading='Set up your APIM application ID'
text='To set up an APIM application ID, you need to:

1. [Sign in to your NHS Digital developer account](https://digital.nhs.uk/developer).
2. Create an APIM application.
3. Select ‘integration test’ as the environment.
4. Select ‘Communications Manager (integration environment)’ as the connected API.
   '
   %}

{% include components/details.html
heading='Choose how you want to see your message performance'
text='To see how your messages perform, you can [get the status of a message](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#get-/v1/messages/-messageId-) or choose to receive [realtime message callbacks](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#post-/%3Cclient-provided-message-status-URI%3E).

If you want to receive realtime message status callbacks, you‘ll need to:

- decide which [message, channel or supplier statuses](https://notify.nhs.uk/using-nhs-notify/message-channel-supplier-status) you want to receive
- prepare an endpoint URL for your integration
  '
  %}

### If you're using NHS Notify MESH

You'll need to:

1. [Set up your MESH mailboxes (opens in a new tab)](https://digital.nhs.uk/developer/api-catalogue/nhs-notify-mesh/set-up-nhs-notify-mesh#set-up-your-mesh-mailboxes) and make a note of their IDs.
2. Decide which reports you want when you get reports on how your messages perform.

## 3. Confirm your setup to get access to our integration environment

You must confirm how you'll be set up with NHS Notify using our online form so we can prepare your integration environment to meet your needs.

{% include components/inset-text.html
  text='Only complete the online form and confirm your setup if you’ve been invited to onboard.'
    %}

{% include components/action-link.html
    url='https://forms.office.com/Pages/ResponsePage.aspx?id=slTDN7CF9UeyIge0jXdO4-wXWyN79ZdLkmec1Fsc491UNFRYSDFTOUs5TzZQUjlOVUlGWTQxQTlMQy4u'
    text='Confirm your setup with NHS Notify'
%}

### Before you confirm your setup

In the form you'll be asked to:

{% include components/details.html
heading='Confirm your use case'
text='You can only use NHS Notify if your organisation or service sends messages that are:

- [part of a campaign](https://notify.nhs.uk/using-nhs-notify/campaigns)
- [triggered when something happens in your service](https://notify.nhs.uk/using-nhs-notify/event-based-messaging)
- [sent directly on a one-to-one basis](https://notify.nhs.uk/using-nhs-notify/direct-messaging)
  '
  %}

{% include components/details.html
heading='Provide your message sender names'
text='When you send messages you’ll need to tell your recipients who your messages are from by creating message sender names.

Before you provide your message sender names, you should understand more about:

- [NHS App sender names](https://notify.nhs.uk/using-nhs-notify/tell-recipients-who-your-messages-are-from#nhs-app-sender-name)
- [email sender names and from addresses](https://notify.nhs.uk/using-nhs-notify/tell-recipients-who-your-messages-are-from#email-sender-name-and-from-email-address)
- [email reply-to email addresses](https://notify.nhs.uk/using-nhs-notify/tell-recipients-who-your-messages-are-from#reply-to-email-address)
- [text message sender names](https://notify.nhs.uk/using-nhs-notify/tell-recipients-who-your-messages-are-from#text-message-sender-name)
  '
  %}

{% include components/details.html
heading='Provide more detail about your messages and how they’ll be sent'
text='You’ll be asked if your organisation or service will:

- have finished drafts of the messages you want to send
- send NHS App messages and if so, which links and URLs you’ll include
- send letters in other languages and if so, which languages
- send letters in accessible formats and if so, which formats
- use Personal Demographics Service (PDS) fields
- have your PDS test data ready
- use custom personalisation fields
- have test data prepared for your custom personalisation fields

The form will also ask for the routing plans that you want to use for your messages.
'
%}

{% include components/details.html
heading='Tell us who will create and submit templates'
text='You do not need to do this if you send direct messages and use free-text inputs.

When you get access to NHS Notify’s integration environment, you’ll need to [create and submit your templates](https://notify.nhs.uk/using-nhs-notify/create-and-submit-a-template). These templates will be used as the messages you send when you go live.

To access this feature, you must nominate someone in your organisation or service to sign in with NHS Notify. This is because creating and submitting templates is only available to one person in an organisation or service at this time.

To sign into NHS Notify you must have a Care Identity (CIS2 authentication). If you do not have a Care Identity, we can help you create one.
'
%}

{% include components/details.html
heading='Give accurate estimates on your message volumes and frequency'
text='We need to understand how many messages you need to send and how often to set up your integration environment.

You’ll need to provide:

- how many messages you want to send per day
- the maximum amount of messages you might send per day
  '
  %}

After you submit the form, it will be reviewed by NHS Notify's onboarding team.

They'll contact you to either:

- ask you about some of the answers you provided
- provide access to NHS Notify's integration environment

## 4. Build your integration

Once you get access to our integration environment, you can start building your integration with [NHS Notify API](https://digital.nhs.uk/developer/api-catalogue/nhs-notify) or [NHS Notify MESH](https://digital.nhs.uk/developer/api-catalogue/nhs-notify-mesh).

How you build your integration to meet your needs is your responsibility.

If you're sending campaign or event based messages, you need to create and submit your templates during this step. You will also need to [approve your messages before we send them]({% link pages/using-nhs-notify/approve-your-messages.md %}).

## 5. Complete integration testing

You'll need to [complete integration testing]({% link pages/using-nhs-notify/complete-your-testing.md %}) to make sure you're ready to start sending messages with NHS Notify.

If you're sending NHS App messages, you'll also need to [complete NHS App testing]({% link pages/using-nhs-notify/complete-your-testing.md %}).

## 6. Apply to go live

You'll need technical or developer support to complete tasks in this step. They must also be ready to support the go live process.

When you’re ready to go live, contact your onboarding manager.

They'll ask you to:

- send them your SCAL
- sign our [connection agreement](https://digital.nhs.uk/developer/guides-and-documentation/online-connection-agreement) if you’re a non-NHSE organisation

### If you're using NHS Notify API

Your onboarding manager will ask for your:

- production (PROD) application name
- PROD application ID
- consumer organisation name
- JWKS resource URL (if you’re self-hosting)
- key ID for JWKS and public key (if NHS Notify is hosting your keys via APIM)

### If you’re using NHS Notify MESH

Your onboarding manager will ask for your PROD Mesh Mailbox ID.

### Before you go live

Once we’ve received your details, you’ll need to:

- [complete smoke testing]({% link pages/using-nhs-notify/complete-your-testing.md %}), with support from NHS Notify and your technical team
- discuss your rollout or implementation plan with us

We will:

- check your SCAL and confirm all assurance is complete
- set you up in the production environment
- work with you to support your rollout or implementation plan
- agree a go live date with you

## 7. Go live

On your go live date, you can start making requests via [NHS Notify API](https://digital.nhs.uk/developer/api-catalogue/nhs-notify) or [NHS Notify MESH](https://digital.nhs.uk/developer/api-catalogue/nhs-notify-mesh) to send messages with NHS Notify.

### After you go live

NHS Notify will set up a series of early service support calls with you to check your integration is performing as expected.

If you need help after these calls, contact [support]({% link pages/support/support.md %}).
