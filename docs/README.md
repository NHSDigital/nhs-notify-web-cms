# Developer info for Public Website

## Setup

In the `docs` directory run the following command:

```bash
make install
```

This will install dependencies required by `Jekyll` and `npm`. On this install step we copy out `nhsuk.min.js` from `node_modules/nhsuk-frontend/dist`.

## Running the application

Run the following command to run the application in `debug` mode:

```bash
make debug
```

When running the application in `debug` mode the `/examples` page is available.

Run the following command to run the application in `production` mode:

```bash
make s
```

## Writing content

This project aims to keep content written in pure markdown with the exception of certain components supplied by the nhsuk design system.

### Markdown and Jekyll Examples

We have an `/examples/` page which aims to provide examples on how to use `markdown` and `Jekyll` together to display different components such as `actions-links`, `images with captions` and `tables`.

The `/examples/` page is only available when the application is run in `debug` mode ([see Running the application](#running-the-application)).

## Creating Jekyll include components

To write a Jekyll component please follow the guidance in [Jekyll \_includes](https://jekyllrb.com/docs/includes/). We have also adopted a pattern to use [Jekyll liquid filters](https://jekyllrb.com/docs/liquid/filters/) to apply `escaping` and `encoding` to input variables notably;

- `uri_escape` to escape any passed in URLS
- `xml_escape` to encode any special characters being used on HTML attributes

### Encoding special characters

> This only applies to a `Jekyll component` in your markdown file.
> At time of writing this doc (14/06/2024) all `Jekyll` components will encode values correctly.

When writing content you may need to `encode` special characters. What this means is for certain characters we need to use the encoded value:

| Character | Encoded  | Description       |
| --------- | -------- | ----------------- |
| '         | `&#39;`  | Single quote      |
| "         | `&quot;` | Double quote      |
| <         | `&lt;`   | Less than sign    |
| >         | `&gt;`   | Greater than sign |

The above table contains the main characters which could cause issues. A more extensive list can be found [here](https://psdtowp.net/html-codes-special-characters.html).

## NHS styled Jekyll components

Below is a list of the supported nhsuk [design system components](https://service-manual.nhs.uk/design-system/components) to use in `markdown` and `html` files.

- [Image](image.component.md)
- [Action link](action-link.component.md)

## Assets

We have an assets folder which is used to put files such as;

- favicons
- images
- Javascript
- CSS

If you have new images, favicons or other assets place them in the corresponding folder and the asset will be available via `/assets/<assert_type>/<asset_name>` for example `/assets/images/landing-main-image.svg`.
