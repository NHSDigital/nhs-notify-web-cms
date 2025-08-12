---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Complete your testing
parent: Using NHS Notify
nav_order: 1
permalink: /using-nhs-notify/complete-your-testing
section: Going live with NHS Notify
---
You'll need to carry out testing to make sure you're ready to start sending messages to recipients with NHS Notify.

You're responsible for:

- leading your testing
- completing integration testing in our integration (INT) environment
- how long testing will take
- deciding when to carry out integration testing

You need to:

- [complete your integration testing](#how-to-carry-out-integration-testing).<!-- markdownlint-disable-line -->
- [complete NHS App testing](#nhs-app-integration-testing) if you're sending NHS App messages
- [complete production smoke testing](#production-smoke-testing) just before you go live

We need specific evidence for your NHS App testing.

To complete integration testing, you need to give us your final templates and routing plans.

You can start testing earlier using:

- our [Sandbox environment](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#overview--environments-and-testing)
- [free-text inputs with NHS Notify API](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#overview--enable-users-to-write-and-send-messages-from-your-software) or [NHS Notify MESH](https://digital.nhs.uk/developer/api-catalogue/nhs-notify-mesh/set-up-nhs-notify-mesh#write-your-messages) - our [routing plan IDs](https://digital.nhs.uk/developer/api-catalogue/nhs-notify#overview--making-your-request-to-send-messages-from-your-software) can be helpful if you've not got your own set up yet

## Before you start

Make sure your team has someone to:

- test (like a test engineer, developer or someone who can send API or MESH requests)
- manage your testing and report on progress (like a test manager or delivery manager)

Make sure you've [prepared your integration](https://notify.nhs.uk/get-started/onboard-with-nhs-notify#2-prepare-your-integration).

## How to carry out integration testing

### 1. Prepare for testing

To prepare for testing, you need to:

- arrange your own Personal Demographics Service (PDS) data - contact your integration manager if you have any questions
- provide us with your [test personalisation data](https://notify.nhs.uk/using-nhs-notify/personalisation#providing-example-data)
- ask your onboarding manager to set up your NHS App test data (if you're using the NHS App)

### 2. Confirm your connection to the integration environment

You need to show you've connected to our INT environment by sending an API request or a MESH message. This will trigger the creation of a message in INT.

You'll know your connection is working when you can successfully run tests in the INT environment.

{% include components/inset-text.html
  text='If you’re using free-text inputs and NHS Notify’s dedicated routing plans, you do not need to do any more steps for integration testing.

Next, carry out [NHS App testing](#nhs-app-integration-testing) (if you’re sending NHS App messages) and [production smoke testing](#production-smoke-testing).'
%}

### 3. Approve proofs of your messages

You need to [approve final proofs of your messages]({% link pages/using-nhs-notify/approve-your-messages.md %}). This is to ensure that NHS Notify sends your messages exactly as you expect your recipients to get them.

### 4. Wait for NHS Notify to set up your routing plans

NHS Notify will build your routing plans in the INT environment.

### 5. Check your templates and routing plans work as you expect

You need to check that we've set up your templates and routing plans in line with your needs.

It's up to you to decide how to do this. We recommend making sure that:

- the message channels in your routing plan are in the correct order
- the correct templates are used in the correct routing plans, for example, one plan might be for invitations and one might be for reminders

{% include components/details.html
    heading='If you need help getting test evidence'
    text='Let your onboarding manager know 2 weeks in advance if you need support to carry out this step.

We can get evidence of your test outputs for emails and text messages if you give us your test data and request IDs. Find out about [NHS App message test outputs](#nhs-app-integration-testing).'
%}

{% include components/details.html
    heading='If you need support'
    text='Contact your onboarding manager if you need support or have any problems with your testing. Tell us the following details:

- a description of the request and what you expected to happen
- the date and time of the request
- the routing plan ID, also known as the sending group ID
- the request ID that the API batch-message endpoint returned, if you used NHS Notify API
- the request item ID that the API message endpoint returned, if you used NHS Notify API
- the request ID that MESH returned, if you used NHS Notify MESH'
%}

## NHS App integration testing

You'll need to use a special test version of the NHS App and test user accounts to check how your messages will appear in the NHS App.

We need to see evidence of these messages in the test version of the NHS App.

### 1. Provide details for the test app

Give your onboarding manager the following details of the people on your team who need access to the test version of the NHS App:

- their email addresses - these can be personal details if they're testing on personal devices
- whether they have Android or Apple devices

We'll then send you a link to download the app from the [Apple Store](https://www.apple.com/uk/store) or [Google Play](https://play.google.com/store/apps?hl=en).

### 2. We'll send you test user account details

We'll give you sign in details for 3 test user accounts.

### 3. Sign in with test accounts

Sign in with the 3 test user accounts on a mobile device that we approved for the test NHS App,

### 4. Send test messages

Wait 24 hours after you first sign in.

Then send test messages using requests through NHS Notify API or NHS Notify MESH. Use the test users' NHS numbers.

### 5. Receive the notification

The notification will be delivered to the test NHS App on the phone of the person who's signed in to the test accounts.

### 6. Show evidence of your NHS App testing

You'll need to show evidence of the results with a screen recording or on a video call with us. You can send us the screen recordings in one video or in separate videos if this is easier.

We can provide extra evidence from our database if you request this.

Your test results should show certain results for each test patient account:

#### P9 level with NHS App available, identity verified and push notifications enabled

- NHS App receives the message
- The message can be read
- Callback goes to NHS Notify to say that the message was read (if you've set up callbacks)
- Any embedded links work correctly

#### P9 level with NHS App available, identity verified and push notifications disabled

- NHS App receives the message
- The message is treated as if it will not be read
- Rejected callback goes to NHS Notify (if you've set up callbacks)

#### P5 level with identity not verified for NHS App

- NHS App does not receive the message
- Rejected callback goes to NHS Notify (if you've set up callbacks)
- The next available message channel in the routing plan is triggered

## Production smoke testing

Smoke testing helps us to make sure:

- your new integration is working in the production environment
- your production configuration is set up correctly in line with the INT set up

For letters, smoke testing will take place 24 hours before you go live with NHS Notify. For other message channels, it can take place on the same day that you go live.

The output of the smoke tests will be on our test devices. This means you will not see the messages at this stage.

We do not check any links in your message templates during smoke testing. You can check your links work correctly during [proofing]({% link pages/using-nhs-notify/approve-your-messages.md %}) (if you're using templates rather than free-text inputs).

### Before your smoke test

We'll:

- draft a production smoke test plan
- prepare your test data
- arrange a smoke test call with you

### During your smoke test call

We'll share test data with you, including NHS numbers and routing plans.

You'll then use this data to send requests using either NHS Notify API or NHS Notify MESH.

If there are any issues, we'll work through these with you.

We'll record the results of the smoke test and confirm once you're ready to go live and send messages to recipients.

Here's what to expect for each channel:

#### NHS App

We'll check the NHS App has received the notification on the test device. We usually expect it to come through after a few minutes.

#### Email

We'll check our test inbox to make sure the email was received. We usually expect it to come through after a few minutes.

#### Text message

We'll check that the test device received the text message. We usually expect it to come through after a few minutes.

#### Letters

After you've triggered the request, it will go into the letter supplier's overnight queue. The day after your smoke test, we'll confirm that they received it.

Your letters will not be printed and posted at this stage.
