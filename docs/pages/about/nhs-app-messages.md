---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: NHS App messages
parent: About
nav_order: 1
permalink: /about/nhs-app-messages
section: Features by message channel
redirect_from: /features/nhs-app-messages
---

Send free messages of up to 5,000 characters to patients and members of the public who have the NHS App.

{% include components/image-with-caption.html
    src="nhs-notify-nhs-app-example-2.svg"
    alt="A screenshot of an opened message in the NHS App inbox."
    caption="An example of a message sent with the NHS App."
%}

## What you need to know

Recipients can receive NHS App messages in their NHS App inbox.

[Push notifications](#push-notifications) are generated when recipients have an unopened message in their NHS App inbox.

You might also want to understand more about:

- [delivery times for NHS App messages]({% link pages/using-nhs-notify/delivery-times.md %})
- [how to tell recipients who your NHS App messages are from]({% link pages/using-nhs-notify/tell-recipients-who-your-messages-are-from.md %})
- [formatting]({% link pages/using-nhs-notify/formatting.md %})
- [links and URLs]({% link pages/using-nhs-notify/links-and-urls.md %})
- [personalisation]({% link pages/using-nhs-notify/personalisation.md %})

## Push notifications

The NHS App will try to send push notifications to your recipient’s device whenever you send them an NHS App message.

Recipients can choose if they want to receive notifications in the NHS App or in their device settings. Depending on their choice, NHS App messages will push a banner notification and badge notification to their device.

### Banner notifications

Banner notifications are short messages that appear on the lock screen of a recipient’s device. They show the recipient that there is an unopened message waiting in their NHS App inbox.

When a user selects the banner notification, this opens their message in the NHS App.

To protect recipients, banner notifications pushed by the NHS App do not include any of your message content.

{% include components/image-with-caption.html
    src="nhs-notify-nhs-app-banner-notification.svg"
    alt="An image of 2 mobile devices side by side showing an example banner notification for both iPhone and Android devices pushed by the NHS App."
    caption="An example of a banner notification pushed to an iPhone and an Android device by the NHS App."
%}

### Badge notifications

When a recipient receives a NHS App message, a badge notification will appear on the NHS App icon. Badges let NHS App users know that there’s an unopened message or notification for them in the app.

{% include components/image-with-caption.html
    src="nhs-notify-nhs-app-badge-notification.svg"
    alt="A screenshot of the NHS App icon with a red badge showing 1 notification."
    caption="An example of a badge notification pushed by the NHS App when a message is sent to a recipient’s NHS App inbox."
%}
