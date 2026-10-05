# Contributing

This repository provides a reusable starting point for NHS Notify projects.
Contributions that improve its clarity, quality, and maintainability are welcome.

## Before Opening A Pull Request

- Keep changes focused and explain the reason for them.
- Do not commit secrets, credentials, tokens, or personal information.
- Update relevant configuration and documentation when behaviour changes.
- Add or update tests where applicable.
- Check that generated files remain consistent with their source files.

## Validation

Run the checks relevant to your change from the repository root. The standard Make targets include:

```bash
make config
make test
```

For workflow, YAML, Make, and configuration changes, also validate the edited files and run `git diff --check`.

## Pull Requests

- Use a clear, concise title that includes the relevant work item where one exists.
- Describe what changed and why.
- Include the validation commands you ran and their results.
- Call out known limitations, follow-up work, or deployment considerations.
- Ensure required reviews and CI checks have passed before merging.
