# Jekyll component - Action link

> |          |                                                                                          |
> | -------- | ---------------------------------------------------------------------------------------- |
> | Theme    | `nhsuk`                                                                                  |
> | Link     | [nhsuk action link](https://service-manual.nhs.uk/design-system/components/action-link)  |
> | location | `/_includes/components/action-link.html`                                                 |

## Usage

```markdown
# This is a markdown file with a Jekyll component

- Step 1
- Step 2
- Step 3

Below is an action link

{% include components/action-link.html
    url='the link you want the user directed to'
    text='the link text'
%}

Above is an action link.
```

## Attributes

### url

> |             |                            |
> | ----------- | -------------------------- |
> | state       | `required`                 |
> | description | The link you want to visit |

The `url` supports both external urls and anchor links. For example;

#### external link

```Jeykll
{% include components/action-link.html
    url='https://service-manual.nhs.uk/design-system/components/action-link'
    text='About NHS action links'
%}
```


#### anchor link

```Jeykll
{% include components/action-link.html
    url='#heading'
    text='Go to heading'
%}
```

### text

> |             |                            |
> | ----------- | -------------------------- |
> | state       | `required`                 |
> | description | the action link text       |

The text you want to display next to the link

```Jeykll
{% include components/action-link.html
    url='#
    text='Hello world!'
%}
```
