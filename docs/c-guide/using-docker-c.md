---
title: Using the CS 2110 Docker Contaner for C Only
---

When you first start the Docker container, you will still be in the same window that you ran the script from. However, the container is now presenting you with a Linux shell. If you run the command `ls`, you should see a device called `host`, which contains all of the same files and folders as the folder containing your CS 2110 Docker script (`cs2110docker.sh` or `cs2110docker-c.bat`). For instance, if your script is stored in Desktop, then you should see all the contents of your Desktop folder inside `host`. The folder has been *mounted* inside the container, meaning updating the files on your computer will be reflected in the container and vice versa.

You should then see something like this:
![image](assets/dockerit1.png){:.centered}

And then you can move around and interact with the Docker container like in any other termninal: 
![image](assets/dockerit2.png){:.centered}


**When you are doing your work, you should edit all of you files in this folder on your host machine. Then, use the Docker container to run the code. DO NOT SAVE FILES INSIDE THE CONTAINER ANYWHERE EXCEPT IN THE `host` FOLDER. THEY WILL DISAPPEAR. PLEASE DON'T DO IT. PLEASE.**

You will not get extensions on projects because you saved stuff where you should not have. We are making this very clear up front. Don't do it.

When you are done using the container, you can shut it down by running
    
    ./cs2110docker.sh stop
on MacOS/Linux or 

    cs2110docker.bat stop
on Windows.

**Note for Windows users**: Docker Desktop on Windows uses a WSL 2 virtual machine to run the Docker container. Stopping the container will not stop the VM, which can eat up a lot of RAM. Therefore, you may also want to run the following command after stopping the container and/or [create a .wslconfig file](../common-issues.md#wslconfig){:target="_blank"}.:

    wsl --shutdown


## Wrap up

That's about all that there is to the CS 2110 Docker container setup. If you have any questions or issues, please post on Ed Discussion / Piazza **under the Docker folder**, so we can sort through Docker questions efficiently.

If there is no Docker folder for your section, then please post any Docker questions under "General".