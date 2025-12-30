---
layout: page
title: Page 5 title
parent: Pagination example
nav_order: 5
permalink: /pagination-example/page-5
mini_hub_pages:
previous_page:
  title: Page 4 title
  url: /pagination-example/page-4
next_page:
---

## Placeholder content

This is placeholder content for page 5. Replace this with your actual content.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

{% if page.previous_page or page.next_page %}
{% include components/pagination.html previous=page.previous_page next=page.next_page %}
{% endif %}
