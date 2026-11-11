# Edit `NHSDigital/nhs-notify-web-cms` in the browser

1. Open [github.dev/NHSDigital/nhs-notify-web-cms](https://github.dev/NHSDigital/nhs-notify-web-cms).
2. Sign in to GitHub when prompted.
3. Click the branch name in the lower-left corner, then create a new branch (for example, `yourname/content-update`).
4. Edit and save the required files.
5. Open **Source Control** (branch icon), review the diff, stage the intended files, enter a clear commit message, and select **Commit & Push**.
6. Open GitHub and create a pull request from your branch.

## Signing

`vscode.dev` is a browser editor, not a full development machine: it does not provide a normal Git terminal or local signing-key setup.

- For commit verification, GitHub automatically signs commits made through its web interface. For a `vscode.dev` commit, check the resulting commit on GitHub; it should show **Verified** if GitHub signed it.

## Testing the output

**Recommended: GitHub Codespaces.** From `vscode.dev`, click on the Run and Debug tab, then use **Continue Working On → Create New Codespace**.
It provides a real Linux VM, terminal, dependencies, ports, and a browser preview. Enable **GPG verification** in GitHub Codespaces settings as verified commits are required.

Use a GitHub Codespace to test changes before opening the pull request:

1. Create or open a Codespace for `NHSDigital/nhs-notify-web-cms`.
2. Check out the branch you created in `vscode.dev`.
3. Install dependencies and copy/configure any required environment variables or secrets.
4. Run the project’s documented checks and local development command.
5. Open the forwarded preview URL, test the affected CMS pages or content, then commit/push any fixes.
6. Create the pull request only after the local checks and preview behave as expected.

If the branch was created in `vscode.dev`, it must be pushed first; then select that branch when creating the Codespace.
