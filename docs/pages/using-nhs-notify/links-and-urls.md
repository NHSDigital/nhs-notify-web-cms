---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Links and URLs
parent: Using NHS Notify
nav_order: 3
permalink: /using-nhs-notify/links-and-urls
section: Writing a message
---

You can include links in your messages. How you do this depends on the message channel.

You can see instructions on links and URLs while you’re editing a template.

## Using the full URL

To add a link to a message, you can write the URL in full. For example:

{% include components/inset-text.html
    text='<code>Book now at https://www.nhs.uk/example'
%}

For NHS App messages and emails, use square brackets around the full URL to make it the link text and use round brackets around the full URL.

Make sure there are no spaces between the brackets or the link will not work. For example:

{% include components/inset-text.html
    text='<code>[https://www.nhs.uk/example](https://www.nhs.uk/example)'
%}

URLs should be easy to read.

{% include components/details.html
    heading='Short URLs'
    text='
If you have a long, complex web address, you can request a short URL from GOV.UK. This can take some time and may delay your template creation.

We do not recommend using a third-party link shortening service because:

- your users cannot see where the link will take them
- your link might stop working if there’s a service outage
- you can no longer control where the redirect goes'
%}

## Converting text into a link

For NHS App messages and emails, you can convert text into a link.

Use square brackets around the link text and round brackets around the full URL. Make sure there are no spaces between the brackets or the link will not work. For example:

{% include components/inset-text.html
    text='<code>[Read more](https://www.nhs.uk/example)'
%}

Link text should tell the recipient what action they need to take and where the link goes.

Never use ‘click here’, ‘click link’, ‘this link’ or ‘more’, as these do not make sense when read out of context.

If the recipient is not expecting to receive an email from you, we recommend using the full URL instead of link text.

You cannot convert text into a link in text message or letter templates.
