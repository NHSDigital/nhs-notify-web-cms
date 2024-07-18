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
  - [Action link](#action-link)
- [Inset text](#inset-text)
- [Details component](#details-component)

## Table

| Month    | Savings |
| -------- | ------- |
| January  | $250    |
| February | $80     |
| March    | $420    |

## Images

Example of a standard image and an image with a caption.

### Standard image

![This is alt text](/assets/images/1-write-your-message.svg)

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

[A link](#standard-link)

### Action link

{% include components/action-link.html url='#' text='Example action link' %}

## Inset text

{% include components/inset-text.html
  text='This is an example of inset text with a [link](#inset-text)'
%}

{% include components/inset-text.html
    text='
this is with markdown here is a [link](#inset-text)

- list item 1
- list item 2
- list item 3
  - nested 3.1
    '
%}


## Details component

{% include components/details.html
    heading='Example details expander'
    text='
this is with markdown here is a [link](https://service-manual.nhs.uk/design-system/components/details)

- list item 1
- list item 2
- list item 3
  - nested 3.1
    '
%}
