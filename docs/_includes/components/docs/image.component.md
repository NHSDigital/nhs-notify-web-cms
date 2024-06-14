# Jekyll component - Image

> |          |                                                                              |
> | -------- | ---------------------------------------------------------------------------- |
> | Theme    | `nhsuk`                                                                      |
> | Link     | [nhsuk image](https://service-manual.nhs.uk/design-system/components/images) |
> | location | `/_includes/components/image.html`                                           |

## Usage

```markdown
# This is a markdown file with a Jekyll component

- Step 1
- Step 2
- Step 3

Below is an image

{% include components/image.html
    src="path to image"
    alt="image alt text"
    class="additional classes"
    caption="this is optional caption text"
%}

Above is an image.
```

## Attributes

### src

> |             |                                            |
> | ----------- | ------------------------------------------ |
> | state       | `required`                                 |
> | description | The path to the image you want to display. |

This image component supports both local images in the [assets folder](README.md#assets) and external images.

#### local images

If you want to display an image from the [assets folder](README.md#assets) then you do not need to use the full folder path just the file name. For example:

```Jeykll
{% include components/image.html
    src="landing-main-image.svg"
    alt="this is the landing page image"
%}
```

#### external images

If you need to display and image from an external address then `src` needs to start with `https://` for example:

```Jeykll
{% include components/image.html
    src="https://assets.nhs.uk/prod/images/ABF9YH_GDGeL2X.2e16d0ba.fill-320x213.jpg"
    alt="an external image"
%}
```

### alt

> |             |                       |
> | ----------- | --------------------- |
> | state       | `required`            |
> | description | Alt text of the image |

This applies the alt text to the image. Used for accessibility.

### class

> |             |                                          |
> | ----------- | ---------------------------------------- |
> | state       | `optional`                               |
> | description | Adds additional CSS classes to the image |

If you need to style the image in a different way than the standard you can use `class` attribute. For example:

```Jeykll
{% include components/image.html
    src="landing-main-image.svg"
    alt="this is the landing page image"
    class="nhsnotify-image"
%}
```

Applying `nhsnotify-image` class removes all the padding and white background on the image.

### caption

> |             |                                           |
> | ----------- | ----------------------------------------- |
> | state       | `optional`                                |
> | description | adds a caption text field below the image |

Some images require a caption below the image as specified on the nhs design system - [caption image](https://service-manual.nhs.uk/design-system/components/images#captions).

```Jeykll
{% include components/image.html
    src="landing-main-image.svg"
    alt="this is the landing page image"
    caption="1. This is additional caption text"
%}
```
