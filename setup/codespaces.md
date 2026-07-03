# First-Time Codespaces Setup

Use this guide for first-time setup in GitHub Codespaces.

## 1. From a web browser, visit the Web CMS GitHub Repository page

[https://github.com/NHSDigital/nhs-notify-web-cms](https://github.com/NHSDigital/nhs-notify-web-cms)

## 2. Click Code

Click the green `<> Code` button.

<img src="../assets/img/image.png" alt="Click Code" width="500"/>

## 3. Create Codespace on main

Click create code space on main

<img src="../assets/img/image-1.png" alt="Create Codespace on main" width="500"/>

## 4. Wait

- a new browser tab should open
- you will need to wait around 5 - 10 minutes

When it first starts it will look something like this. At it will say opening remote at the bottom left.

<img src="../assets/img/image-2.png" alt="Codespace starting up" width="500"/>

## 5. Launch workspace

You will see a box pop up bottom right notifying you there is a workspace file.

- click the Green button to `Open Workspace`

<img src="../assets/img/image-3.png" alt="Open Workspace button" width="500"/>

## 6. Open parent git repository

Another box will pop up saying a parent git repository has been found. Click the Green `Yes` button to open it.

<img src="../assets/img/image-4.png" alt="Parent repository dialog" width="500"/>

An option should appear at the top of the screen, select the `nhs-notify-web-cms` repository.

<img src="../assets/img/image-5.png" alt="Select repository option" width="500"/>

## Confirm it works

You should be able to run a live version of your changes before you submit them (via a Pull request) for updating the live content.

To do this, click the Run and Debug button, and then click the "Play" icon. Alternatively you can press F5 (warning, if you are not "clicked" in the window, it will refresh your page instead of launching the site).

- click the run and debug button:

<img src="../assets/img/image-6.png" alt="Run and Debug button" width="500"/>

- click the green "Play" button to the left of where it says `Attach (NHS Notify`

<img src="../assets/img/image-7.png" alt="Play button" width="500"/>

- after a few seconds, you should see moving text at the bottom of the screen and it say `server running`

<img src="../assets/img/image-8.png" alt="Server running message" width="500"/>

- a box should appear bottom right saying your application is running. Click the green `Open in browser button`

<img src="../assets/img/image-9.png" alt="Open in browser button" width="500"/>

- a new browser tab will open (with a random address), this is live updating as you change the content of the site.

<img src="../assets/img/image-10.png" alt="Live updating website" width="500"/>

## Make a preview change

- In the previous browser tab, click on the file `Explorer` button to show the file list.

<img src="../assets/img/image-11.png" alt="File Explorer button" width="500"/>

- Click on the `pages` folder, and then `index.md`. This will open the content of the home page.

<img src="../assets/img/image-12.png" alt="Pages folder and index.md" width="500"/>

- you can now edit this page. To see a basic preview side by side, click the markdown preview button

<img src="../assets/img/image-13.png" alt="Markdown preview button" width="500"/>

- this will open a preview to the right

<img src="../assets/img/image-14.png" alt="Preview panel" width="500"/>

- If you now edit some text in the left, it will update in the basic preview on the right in real time. If you click `File` - `Save` (or `Ctrl-S`) this will save the file.

- Saving the file will update the Full preview site in the other browser tab.

- Open the other tab, and Press `F5` to refresh the page.

## Open existing Codespaces

- You can reuse existing Codespaces that have been setup.
- Visit [https://github.com/codespaces](https://github.com/codespaces) to see a list of Codespaces
- Active Codespaces are charged. Everyone gets 150 hours free per month.
- Click on the `three dots` and then click `stop codespace` to change it to inactive
- A stopped code space does **not** loose data
- You can delete a Codespace, but this **will** loose any data that you have not pushed (published) to a remote git branch.
