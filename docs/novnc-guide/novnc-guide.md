---
title: CS 2110 Docker for noVNC
---

The image is set up to be a very basic Ubuntu 22.04 machine that includes the following tools that you need for this class:
 -   CircuitSim (for circuits)
 -   complx (for assembly)
 -   `gcc` and `gdb` (for C)

 One thing that it does not include is a text editor. **STUDENTS SHOULD NOT EDIT ANY FILES INSIDE OF THE CONTAINER!** When you write code later in the semester, you will edit the files in your favorite text editor *outside* of the container, and test them inside the container using the tools provided.

# Installation

First, download the [latest stable version of the CS 2110 Docker script](../files/cs2110docker.sh){:download}, and put it in a folder where you want to do all your work for this class.

Next, you need to install Docker. Please follow the instructions below for your platform:
- [Windows](../install-windows.md)
- [macOS](../install-mac.md)
- [Linux](../install-linux.md)

After you finish installing, check out [Using the CS 2110 Docker Container](using-docker-novnc.md) and make sure everything is working.

If you run into any issues, please take a look at [Common Issues](../common-issues.md), and also don't hesitate to ask one of your TAs for help!
