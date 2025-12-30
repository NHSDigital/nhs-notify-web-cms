---
layout: page
title: Page 2 title
parent: Pagination example
nav_order: 2
permalink: /pagination-example/page-2
mini_hub_pages:
previous_page:
  title: Page 1 title
  url: /pagination-example/
next_page:
  title: Page 3 title
  url: /pagination-example/page-3
---

## Placeholder content

This is placeholder content for page 2. Replace this with your actual content.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

{% if page.previous_page or page.next_page %}
{% include components/pagination.html previous=page.previous_page next=page.next_page %}
{% endif %}
