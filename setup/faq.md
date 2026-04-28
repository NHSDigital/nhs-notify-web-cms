# FAQ

## Something is not working. What should I try first?

Restart your Codespace first. This fixes most issues, including GPG signing, stale environment variables, and preview problems.

1. Visit [https://github.com/codespaces](https://github.com/codespaces)
2. Find your Codespace in the list
3. Click the three dots menu on the right
4. Select **Stop codespace**
5. Reopen the Codespace

## How do I check whether GPG commit signing is working?

Run these two commands in the Codespace terminal:

```bash
git config --list --show-origin | grep -E 'commit.gpgsign|gpg.program|user.signingkey|user.name|user.email|credential.helper'

git config --show-origin --get commit.gpgsign
```

The second command should return `true`.

If it returns `false` or nothing:

- Complete all steps in [GPG setup](gpg.md)
- Confirm GitHub **Settings > Codespaces > GPG verification** is set to **All repositories**
- Restart your Codespace and re-check

## My commit is being rejected because it is not signed

This usually means GPG verification was not active when the Codespace started. Restart the Codespace and try committing again.

## Where can I get help with using AI or GitHub Copilot?

See [Copilot quick start](copilot.md) and the linked Team AI guidance.

## How do I stop being billed for an idle Codespace?

Visit [https://github.com/codespaces](https://github.com/codespaces), open the three dots menu next to your Codespace, and select **Stop codespace**. A stopped Codespace keeps your saved work and does not consume included compute hours.
