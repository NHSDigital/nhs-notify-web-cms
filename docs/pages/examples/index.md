---
layout: page
title: Examples
permalink: /examples/
---

- [Table](#table)
- [Images](#images)
  - [Standard image](#standard-image)
  - [Caption image](#caption-image)
- [Links](#links)
  - [Standard link](#standard-link)
  - [Customised link](#customised-link)
  - [Action link](#action-link)

## Table

| Month    | Savings |
| -------- | ------- |
| January  | $250    |
| February | $80     |
| March    | $420    |

## Images

Example of a standard image and an image with a caption.

### Standard image

![This is alt text](/nhs-notify-web-cms/assets/images/1-write-your-message.svg)

### Caption image

{% include components/image.html
  src='1-write-your-message.svg'
  alt='random alt text'
  caption='
    1. Chickenpox starts with red spots. They can appear anywhere on the body.'
%}

## Links

Examples of different types of links.

### Standard link

[A link](#standard-link)

### Customised link

[A link with a custom class and styling](#customised-link){: class="random-css-class" style="color:red;"}

### Action link

{% include components/action-link.html url='#' text='Example action link' %}
