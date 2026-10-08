---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Create messages with NHS Notify
redirect_from: /using-nhs-notify/create-and-submit-a-template
parent: Using NHS Notify
nav_order: 1
permalink: /using-nhs-notify/create-messages-with-nhs-notify
section: Writing a message
---

Once you’ve been accepted to [onboard with NHS Notify]({% link pages/get-started/onboard-with-nhs-notify.md %}) and have access to our integration environment, you can:

- create NHS App, email and text message templates, and upload letter templates
- add formatting, links and personalisation to your messages
- set up message plans and choose which message channels to use
- send test messages for NHS App message, email and text message templates
- review letter template previews before they’re sent

You’ll also need a Care Identity to log in. We can help you set this up.

<!-- vale off -->

{% capture gpit_inset_text %}

<!-- vale on -->

If you supply technology services to primary care organisations (GP IT), you'll need to use your own systems to create message templates.

Find out more about which features are available if you're a [supplier of technology services to primary care (GP IT)]({% link pages/about/gpit.md %}).
{% endcapture %}
{% include components/inset-text.html text=gpit_inset_text %}

{% include components/button.html
    text="Log in"
    url="https://notify.nhs.uk/auth?redirect=%2Ftemplates%2Fmessage-templates"
    target="_blank"
%}

## Create message templates

Log in to your account to create templates for NHS App messages, text messages, emails and letters.

{% include components/image-with-caption.html
src="choose-a-template-type-to-create.png"
alt="Image of an NHS Notify screen titled Choose a template type to create. Four options are presented as radio buttons, including NHS App message, email, text message (SMS), and letter. Text above the radio buttons asks the user to select one option. A black dot shows the NHS App message option has been selected. A green continue button is located at the bottom of the screen."
%}

You can:

- add formatting
- personalise your messages
- add links and URLs
- review and approve your messages

You can use Markdown to format message content. You'll be able to read tips and guidance as you create your message templates.

Find out more about [using NHS Notify]({% link pages/using-nhs-notify/using-nhs-notify.md %}).

{% include components/image-with-caption.html
src="create-nhs-app-message-template.png"
alt="Image of an NHS Notify screen titled Create NHS App message template. An expandable content block provides guidance on naming templates. A small free text box provides space for adding a template name, and a larger free text box provides space for message content. The right side of the screen contains a list of expandable guidance content for personalisation and message formatting. A green save and preview button is located at the bottom of the screen."
%}

## Set up message plans

Use message plans to tell us how to send messages to your recipients. You can tell us which message channels to use and in what order.

Message plans can help you send messages to recipients quickly, in the most cost-effective way.

Find out more about [message plans]({% link pages/using-nhs-notify/message-plans.md %}).

{% include components/image-with-caption.html
src="choose-a-message-order.png"
alt="Image of an NHS Notify screen titled Choose a message order. A variety of message order options are listed as radio buttons. Text above the radio buttons asks the user to select one option. A green save and continue button is located at the bottom of the screen, and linked text to the right gives the option to go back to the previous screen."
%}

## Check how your messages perform

NHS Notify lets you monitor your message performance over time.

You'll be able to check the delivery statuses of your messages, with detailed status descriptions if messages fail. You’ll have access to:

- our Power BI dashboard, if you have an nhs.net email address
- message status endpoints and callbacks, if you're using NHS Notify API
- daily reports of messages and channels, if you're using NHS Notify MESH

Find out more about [message, channel and supplier status]({% link pages/using-nhs-notify/message-status.md %}).
