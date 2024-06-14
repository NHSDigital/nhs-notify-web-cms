# Jekyll component - Inset text

> |          |                                                                                          |
> | -------- | ---------------------------------------------------------------------------------------- |
> | Theme    | `nhsuk`                                                                                  |
> | Link     | [nhsuk inset element](https://service-manual.nhs.uk/design-system/components/inset-text) |
> | location | `/_includes/components/inset-text.html`                                                  |

## Usage

```markdown
# This is a markdown file with a Jekyll component

- Step 1
- Step 2
- Step 3

Below is inset text

{% include components/inset-text.html
    text='content you need inside an inset component'
%}

Above is inset text
```

The inset text element has a visually hidden element where the text is `Information:`.

## Attributes

### text

> |             |                                                      |
> | ----------- | ---------------------------------------------------- |
> | state       | `required`                                           |
> | description | The text you want to display inside an inset element |

The `text` attribute supports plain text and markdown format

#### plain text

```Jekyll
{% include components/inset-text.html
    text='This is simple plain text'
%}
```

#### markdown

Please note when using markdown the wording content is aligned all the way to the left.

```Jekyll
{% include components/inset-text.html
    text='
this is with markdown here is a [action-link](https://service-manual.nhs.uk/design-system/components/inset-text)

- list item 1
- list item 2
- list item 3
 - nested
    '
%}
```
