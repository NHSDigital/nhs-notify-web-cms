---
layout: page
title: Release notes
parent: About
nav_order: 3
permalink: /about/release-notes/
---

This page lists release notes for NHS Notify services.

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
