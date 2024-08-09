---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Links and URLs
parent: Using NHS Notify
nav_order: 2
permalink: /using-nhs-notify/links-and-urls
section: Writing a message
published: false
---

When composing a message, write URLs in full. For example:

{% include components/inset-text.html
    text='<code>Book now at https://www.nhs.uk/example'
%}

URLs should be easy to read.

We do not recommend using a third-party link shortening service because:

- your users cannot see where the link will take them
- your link might stop working if there’s a service outage
- you can no longer control where the redirect goes

## Link texts in emails

When writing an email, you can convert text into a link instead of writing the full web address.

Link text may be useful if you have:

- long, complex URLs
- unsubscribe links
- emails that contain more than 2 links

If the recipient is not expecting to receive an email from you, we recommend using the url instead of link text.

Link text should tell the recipient what action they need to take and where the link goes.

Never use ‘click here’, ‘click link’, ‘this link’ or ‘more’, as these do not make sense when read out of context.

### How to add link text to an email

NHS Notify uses Markdown to format link text.

To convert text into a link, use square brackets around the link text and round brackets around the url. Make sure there are no spaces between the brackets or the link will not work. For example:

{% include components/inset-text.html
    text='<code>[Book now](https://www.nhs.uk/example)'
%}

You cannot use Markdown to add link text to a text message or letter template.

To see message formatting instructions while you’re editing an email template:

1. Go to the Templates page.
2. Create a new email template or choose an existing email template and select Edit.
3. The formatting guide with the available Markdown is on the right-hand side of the page.

CCM-6061 and CCM-6075 commit workaround.
