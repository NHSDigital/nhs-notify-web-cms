---
layout: home
title: Home
site_title: NHS Notify CMS
nav_order: 1
permalink: /
---

<!-- HEADING -->
<div id="heading" class="nhsnotify-banner--blue">
  <div class="nhsuk-main-wrapper nhsuk-width-container">
    <div class="nhsuk-grid-row">
      <div class="nhsuk-grid-column-one-half">
        <h1 class="nhsuk-heading-l">{{ site.data.home.heading.heading }}</h1>
        <p>
          {{ site.data.home.heading.description }}
        </p>
        {% include components/button-reverse.html
          text="Get started"
          url="/get-started/"
          target=""
        %}
      </div>
      <div class="nhsuk-grid-column-one-half">
        {% include components/image.html src=site.data.home.heading.image alt=site.data.home.heading.image_alt classes="nhsnotify-image" %}
      </div>
    </div>
  </div>
</div>

<!-- BENEFITS -->
<div id="benefits" class="nhsnotify-banner--white">
  <div class="nhsuk-width-container nhsuk-main-wrapper">
    <div class="nhsuk-grid-row">
      {% for item in site.data.home.benefits %}
      <div class="nhsuk-grid-column-one-third">
        <h2 class="nhsuk-heading-m">{{ item.heading }}</h2>
        <p>{{ item.description }}</p>
      </div>
      {% endfor %}
    </div>
  </div>
</div>

<!-- HOW IT WORKS -->
<div id="how-it-works">
  <div class="nhsuk-width-container nhsuk-main-wrapper">
    <h2>How it works</h2>
    {% include components/styled-list.html data=site.data.home.how-it-works %}
  </div>
</div>

<!-- PRICING -->
<div id="pricing" class="nhsnotify-banner--white">
  <div class="nhsuk-width-container nhsuk-main-wrapper">
    <h2>Pricing</h2>
    <p>There's no monthly charge, no setup fee and no procurement process.</p>
    <ul class="nhsuk-grid-row nhsuk-card-group">
      {% for item in site.data.home.pricing %}
      <li class="nhsuk-grid-column-one-quarter nhsuk-card-group__item">
        {% include components/card-with-price.html
        heading=item.heading
        description=item.description
        pricing=item.pricing
        %}
      </li>
      {% endfor %}
    </ul>
    {% include components/action-link.html
        url='/pricing'
        text='Learn more about pricing'
      %}
  </div>
</div>

<!-- FIND OUT MORE -->
<div id="find-out-more" class="nhsnotify-banner--blue">
  <div class="nhsuk-width-container nhsuk-main-wrapper">
    <div class="nhsuk-grid-row">
      <div class="nhsuk-grid-column-one-half">
        <h2>{{ site.data.home.find-out-more.heading }}</h2>
        <p>
          {{ site.data.home.find-out-more.description }}
        </p>
        {% include components/button-reverse.html
          text="Get started"
          url="/get-started/"
          target=""
        %}
      </div>
      <div class="nhsuk-grid-column-one-half">
        {% include components/image.html src=site.data.home.find-out-more.image alt=site.data.home.find-out-more.image_alt classes="nhsnotify-image" %}
      </div>
    </div>
  </div>
</div>
