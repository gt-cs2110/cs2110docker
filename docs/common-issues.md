---
title: Common Issues
---

# Platform-independent issues

**When I run the "cs2110docker.sh" script, it says something about how it can't pull the image because of some network error.**

First, check your network connection. If everything seems correct, then this one requires you to restart the Docker daemon, which can be done most easily by restarting your computer.

---

# macOS

**I'm using macOS, and my host folder is empty when I run the cs2110docker.sh script! How can I fix this?**

Please double-check that you disabled gRPC FUSE as described in the [macOS Installation Steps](install-mac.md)

Otherwise, make sure your `cs2110docker.sh` script is NOT in a folder that is managed by Dropbox, Box, Google Drive, or something similar. If this is the case, move the script to a folder that isn't controlled by one of these applications, then try again.

---

# Windows

**I get this error during initialization: "This computer doesn't have VT-X/AMD-v enabled. Enabling it in the BIOS is mandatory".**

The first thing to do is restart into your BIOS and check if virtualization is enabled. To do this, follow the steps below:
1. Turn off your computer and enter the BIOS; on most computers this is done by spamming `F2`, `F11`, `DEL`, or `ESC` as you turn it back on.
2. Once you are in the BIOS, try to maneuver to a page where you can see a message about Virtualization, VT-x, VT-d, AMD-V, AMD-Vi, "Virtualization for Direct I/O", etc. Enable any such features, save and exit, and then let your computer boot up.

If this doesn't fix it, there is some incompatible sort of virtualization enabled. The first thing to do is to search in the Start Menu, find "Turn Windows features on and off" and see if "Hyper-V" is turned off. If so, turn it on and try again.

If not, there's one more potential fix:
1. Open a new command prompt as an administrator (search for Command Prompt, right click it, and press "Run as administrator").
2. Run this command: `bcdedit`
    * At the bottom, if you see the line `hypervisorlaunchtype off` or if you don't see a `hypervisorlaunchtype` option, then continue with the steps.
3. Run this command: `bcdedit /set hypervisorlaunchtype auto`
4. Restart your computer and open Docker Desktop; it should launch as expected now.

---

**I'm using Windows, and my host folder is empty when I run the cs2110docker.sh script! How can I fix this?**

This is a pretty common problem! It usually has to do with your directory setup on your Windows machine. 
 
First, make sure your `cs2110docker.sh` script is NOT in a folder that is managed by Dropbox, Box, Google Drive, or something similar. If this is the case, move the script to a folder that isn't controlled by one of these applications, then try again.

Next, make sure your folders are all in your `C:` drive under the `Users` folder. Docker doesn't like things outside of your C drive. Also, the `cs2110docker.sh` script should be at a path like: `C:/Users/GBurdell/CS2110/cs2110docker.sh`, not a path like
`C:/Users/cs2110docker.sh`.
 
If that doesn't fix things, the next thing is to play around with how you are moving into the directory. Instead of cd'ing like `cd /c/Users/GBurdell/CS2110`, try `cd ~/CS2110`; the `~` is an alias for your home directory.

---

**I get some error about "invalid mode" when I run the `cs2110docker.sh` script.**

Make sure the `cs2110docker.sh` script is not in a folder that contains an apostrophe `'` character in the path. If it is, and you still get this error, it's possible that other types of special characters could cause this issue.

---

**<a name="wslconfig"/>I'm on Windows and have noticed that the container eats up too many resources.**

Create a text file in `C:\Users\<UserName>\` called `.wslconfig` and put something like this in it (substituting whatever values you want, of course):

    [wsl2]
    memory=4GB 
    processors=2
    swap=8GB

*Please don't reduce both the swap and memory too much, as it may cause the container to crash.* In fact, I'd recommend deleting the "swap" line (leaving it at its default value) if you don't know what swap is or you don't care.

---

**I'm on Windows, and it just says "Docker Desktop Stopped" when I open Docker Desktop. If I click on the Settings button, I see that "Use WSL2 backend" is unchecked, but I can't check it.**

Press `⊞ Win` + `R` and type in `%appdata%/Docker`. Open `settings.json` in a text editor and change the line `"wslEngineEnabled": false` to `"wslEngineEnabled": true` (should be near the bottom of the file).

Then, restart Docker Desktop by right clicking the Docker icon on the right side of your taskbar and selecting "Restart Docker Desktop" (or alternatively, by restarting your computer).

---

**I get the error "Unsupported console settings. In order to use this feature, the legacy console must be disabled."**

Follow the steps described [here](https://goocoder.com/fix-issue-docker-unsupported-console-settings-in-order-to-use-this-feature-the-legacy-console-must-be-disabled/){:target="_blank"}.

---
