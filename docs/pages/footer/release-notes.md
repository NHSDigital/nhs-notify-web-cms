---
layout: page
title: NHS Notify release notes
parent: About
nav_order: 3
permalink: /release-notes/
---

Find out about technical updates and bug fixes for NHS Notify.

_This page is aimed at people with technical roles, like developers._

{% assign releases = site.data["release-notes"].releases %}

{% if releases and releases.size > 0 %}
{% for release in releases %}

## {{ release.name }}

{% if release.release_date %}

Released on {{ release.release_date | date: "%d %B %Y" }}
{% endif %}

{% if release.items and release.items.size > 0 %}
{% include components/timeline.html items=release.items %}
{% else %}
No release notes available for this release.
{% endif %}

{% endfor %}
{% else %}
No release notes data is currently available.
{% endif %}
