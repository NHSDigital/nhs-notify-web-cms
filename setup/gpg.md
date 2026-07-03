# GPG Setup for GitHub Codespaces

GPG signing proves that commits are genuinely from you. You only need to do this once.

## Step 1: Generate a GPG key inside your Codespace terminal

Open the terminal in your Codespace and run:

```bash
gpg --full-generate-key
```

Choose these options:

- `RSA and RSA` (default)
- Key size: `4096`
- Expiry: `0` (does not expire), or choose a duration you prefer
- Enter your name and the email address linked to your GitHub account
- Set a passphrase (or leave blank for no passphrase)

Then find the key ID you just created:

```bash
gpg --list-secret-keys --keyid-format=long
```

The key ID is the long string after `rsa4096/` on the `sec` line, for example `3AA5C34371567BD2`.

Export your public key (replace `YOUR_KEY_ID`):

```bash
gpg --armor --export YOUR_KEY_ID
```

Copy the full output, including:

- `-----BEGIN PGP PUBLIC KEY BLOCK-----`
- `-----END PGP PUBLIC KEY BLOCK-----`

## Step 2: Add the key to your GitHub account

1. Click your profile photo (top right of any GitHub page)
2. Go to **Settings**
3. In the left sidebar, click **SSH and GPG keys**
4. Click **New GPG key**
5. Paste the key you copied and click **Add GPG key**

## Step 3: Tell Codespaces to use GPG signing for all repositories

1. In GitHub, go to **Settings** then **Codespaces**
2. Under **GPG verification**, select **All repositories**
3. Click **Save**

## Step 4: Restart your Codespace

GPG settings take effect after a restart.

1. Visit [https://github.com/codespaces](https://github.com/codespaces)
2. Find your Codespace
3. Click the three dots menu and select **Stop Codespace**
4. Reopen the Codespace

## Verify GPG is configured

Run these commands in the Codespace terminal:

```bash
git config --list --show-origin | grep -E 'commit.gpgsign|gpg.program|user.signingkey|user.name|user.email|credential.helper'

git config --show-origin --get commit.gpgsign
```

The second command should return `true`.

- If it returns `false` or nothing, restart your Codespace and try again.
- If it still fails, check that your GPG key is added in **Settings > SSH and GPG keys** and that Codespaces GPG verification is set to **All repositories**.

## Reference

- [Managing GPG verification for GitHub Codespaces](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-gpg-verification-for-github-codespaces)
