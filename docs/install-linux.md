---
title: Installing Docker (Linux)
---
In order to install Docker on Linux (specifically Ubuntu), you need to be running at least Ubuntu 16.04. If you are running a different flavor of Linux, you should be able to find instructions online on how to install it.

If you are running Ubuntu 16.04 or newer, follow the instructions here: <https://docs.docker.com/install/linux/docker-ce/ubuntu/>{:target="_blank"}.

For other Linux distributions, you can follow online instructions; if you get stuck, you can ask a TA or ask for help on Ed Discussion / Piazza.

# Running the Docker container
The installation process should have set the Docker daemon to start on boot, so you don't need to worry about launching it manually.

1. Before you can launch the container, you have to set up the user group for Docker (you only need to do this on the first run). Open a terminal window and run the following commands:
    * `sudo groupadd docker`
    * `sudo usermod -aG docker $USER`
2. Open a terminal and use `cd` to navigate to the directory in which you put the `cs2110docker-c.sh` script.
    * See [Navigating the Terminal](navigating-terminal.md){:target="_blank"} if you are not familiar with how to do this.
3. Run the following command to give the Docker script permission to run (again, you only need to do this the first time):
    * `sudo chmod +x cs2110docker-c.sh`
    * Enter your password if prompted.
5. Run the script by typing `./cs2110docker-c.sh`.
    * This may take a moment if it is your first time running the script, but if everything goes as planned, you should see eventually that your user and path for your host machine should be replaced by something along the lines of `root@41c0750d2a18`, with varying characters after `root@`.

Installation is done, and you have the container up and running! Finally, check out [Using the CS 2110 Docker Container](c-guide/using-docker-c.md).