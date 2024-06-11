---
layout: page
title: Examples
permalink: /examples/
---

- [Table](#table)
- [Images](#images)
  - [Standard](#standard-image)
  - [Caption](#caption-image)
- [Links](#links)
  - [Standard](#standard-link)
  - [Customised](#customised-link)
  - [Caption](#caption-link)

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
  src='https://assets.nhs.uk/prod/images/ABF9YH_GDGeL2X.2e16d0ba.fill-320x213.jpg'
  alt='random alt text'
  caption='
    1. Chickenpox starts with red spots. They can appear anywhere on the body.'
%}

## Links

Examples of different types of links.

### Standard link
[A link](https://google.com)

### Customised link
[A link with a custom class and styling](https://google.com){: class="random-css-class" style="color:red;"}

### Caption link
{% include components/action-link.html url='https://google.com' text='Bob!' %}