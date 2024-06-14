# **ADR**-001: Using NPM for nhsuk styling

>|              |                                   |
>| ------------ | --------------------------------- |
>| Date         | `12/06/2024`                      |
>| Status       | `Accepted`                        |
>| Deciders     | `Engineering`                     |
>| Significance | `Dependencies`                    |
>| Owners       | `bhansell1 (BEHA6)`               |

---

- [**ADR**-001: Using NPM for nhsuk styling](#adr-001-using-npm-for-nhsuk-styling)
  - [Context](#context)
  - [Decision](#decision)
    - [Assumptions](#assumptions)
    - [Drivers](#drivers)
    - [Options](#options)
    - [Outcome](#outcome)
    - [Rationale](#rationale)
  - [Consequences](#consequences)
  - [Actions](#actions)
  - [Tags](#tags)

## Context

The project requires an NHS theme. The nhsuk-frontend-prototyping kit offers multiple ways on acquiring the styles and Javascript;

- Using `npm` to install `nhsuk-frontend` package
- Downloading the css and Javascript

## Decision

Use `npm` to install `nhsuk-frontend` package.

In `/docs/assets/css/main.scss` we import `nhsuk.scss` from `node_modules/nhsuk-frontend`.

We copy out the required Javascript from `node_modules/nhsuk-frontend/dist/nhsuk.min.js` and put this file in `/assets/js/nhsuk.min.js`. This happens when `npm install` is run.

### Assumptions

Using `npm` should make upgrading to newer versions simpler.

### Drivers

- Easier upgrades
- Faster upgrades
- Non technical people upgrading nhsuk styling

### Options

- Using `npm` to install `nhsuk-frontend` package
- Downloading the css and Javascript from the prototyping kit

### Outcome

- Decided to use `npm` to install `nhsuk-frontend` package.

Is it a reversible decision.

### Rationale

Makes upgrading easier

## Consequences

We have to copy out the `nhsuk.min.js` file into our `assets/js` folder and have the file checked in.

## Actions

- [x] bhansell1, 14/06/2024, use npm

## Tags
`#reliability`
`#usability`
`#maintainability`
`#simplicity`
