---
title: Installing Docker (Windows)
---

**PLEASE READ THIS SECTION CAREFULLY.** The installation process is easy, but there are multiple versions of Docker and you have to be careful to install the right one.

Docker Desktop only runs on relatively recent builds of Windows:
- Windows 11 64-bit: Home or Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher.
- Windows 10 64-bit: Home or Pro 21H1 (build 19043) or higher, or Enterprise or Education 20H2 (build 19042) or higher.

If you are running an older version and do not want to or cannot update, please ask your TA for help. You can determine your version of Windows by pressing `⊞ Win` + `R`, typing `winver` in the box that shows up, and then hitting Enter.


### Installation Steps
1. Install Git for Windows if you do not already have it, which can
be found at <https://gitforwindows.org/>{:target="_blank"}.
    * The Git installation will prompt you for lots of configuration options about Git; if you don't know what an option means, select the default option.

2. Install Docker Desktop for Windows by following the installation instructions here: <https://docs.docker.com/docker-for-windows/install/>{:target="_blank"}
    * Note that we will be using the "WSL2 backend", not the "Hyper-V backend".
    * If prompted to choose between "Edge" and "Stable" versions to download, select "Stable".
    * If prompted to install the necessary components for WSL2, select yes.
3. Follow the guides on the Docker page up through "Start Docker Desktop". You do not need to follow the onboarding tutorial after starting Docker.
4. Restart your computer, then move on to "Running the Docker Container" below!


### Running the Docker Container
1. Make 100% sure you've rebooted your computer after installation before proceeding.
2. Open the "Docker Desktop" application. Docker will start up, and the whale icon should eventually either turn green (yay it worked!) or red (error).
3. If your Docker shows up as red, please right-click the whale icon in the system tray on the right-side of the Windows Taskbar and select "Restart Docker Desktop"; this usually fixes the issue.
4. If you see a popup saying "WSL 2 installation is incomplete", click the link in that popup and complete Steps 4 and 5.
5.  If you see a popup saying "WSL 2 is not installed":
    * Search for "Windows PowerShell" in the Start Menu, right click it, and select "Run as administrator". Then, run the command `wsl --install`.
    * If that fails (some error like `wsl: command not found`, or something about `--install` being an invalid flag), then follow **Steps 1-5 only** of the manual installation instructions found [here](https://docs.microsoft.com/en-us/windows/wsl/install-manual){:target="_blank"}. 
6.  When the whale in the bottom left of this window is green and says "Running" on hover, Docker is ready to run. If you cannot get Docker for Windows to run at this point, please ask a TA for help.
7. After Docker has started, search for "Git Bash" in the Start Menu, and use `cd` to navigate to the directory in which you put the `cs2110docker.sh` script.
    * See [Navigating the Terminal](navigating-terminal.md){:target="_blank"} if you are not familiar with how to do this.
8. Run the script by typing `./cs2110docker.sh`.
    * This may take a moment if it is your first time running the script, but if everything goes as planned, you should see eventually see the message `Successfully launched CS 2110 Docker container.`

Installation is done, and you have the container up and running! Finally, check out [Using the CS 2110 Docker Container](using-docker.md).