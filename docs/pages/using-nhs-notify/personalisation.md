---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Personalisation
parent: Using NHS Notify
nav_order: 3
permalink: /using-nhs-notify/personalisation
section: Writing a message
---

You can send personalised messages using a single template.

To personalise a message, use double brackets to add a placeholder to your content. For example:

{% include components/inset-text.html
    text='<code>Hello ((firstName)), your NHS Number is ((nhsNumber))'
%}

NHS Notify uses the [Personal Demographics Service (PDS)](https://digital.nhs.uk/services/personal-demographics-service) to find and populate certain personalisation fields.
