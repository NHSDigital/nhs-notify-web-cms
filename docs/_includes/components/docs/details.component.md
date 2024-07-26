# Jekyll component - Inset text

> |          |                                                                                          |
> | -------- | ---------------------------------------------------------------------------------------- |
> | Theme    | `nhsuk`                                                                                  |
> | Link     | [nhsuk details element](https://service-manual.nhs.uk/design-system/components/details)  |
> | location | `/_includes/components/details.html`                                                  |

## Usage

```markdown
# This is a markdown file with a Jekyll component

- Step 1
- Step 2
- Step 3

Below is details expander

{% include components/details.html
    heading='this is the text show in the underlined link'
    text='example text hidden by default until a user clicks the heading text'
%}

Above is details expander
```

## Attributes

### heading

> |             |                                                                               |
> | ----------- | ----------------------------------------------------------------------------- |
> | state       | `required`                                                                    |
> | description | The wording used in the blue underlined text that a user will click to expand |

### text

> |             |                                                      |
> | ----------- | ---------------------------------------------------- |
> | state       | `required`                                           |
> | description | The text you want to display inside an details element |

The `text` attribute supports plain text and markdown format

#### plain text

```Jekyll
{% include components/details.html
    heading='plain'
    text='This is simple plain text'
%}
```

#### markdown

Please note when using markdown the wording content is aligned all the way to the left.

```Jekyll
{% include components/details.html
    heading='markdown'
    text='
this is with markdown here is a [link](https://service-manual.nhs.uk/design-system/components/details)

- list item 1
- list item 2
- list item 3
 - nested
    '
%}
```
