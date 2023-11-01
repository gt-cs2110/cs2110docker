---
title: Navigating the Terminal
---

Here are some useful commands and examples if you're not familiar or comfortable with using a terminal (e.g. Git Bash on Windows or Terminal on macOS):

* `cd` (change directory): go into another directory (folder).
    * For instance, if you're currently in `/c/Users/GBurdell/Documents`, and you type `cd CS2110`, that will move you into `/c/Users/GBurdell/Documents/CS2110`.
    * `..` refers to the "parent" directory, so I could use `cd ..` to do the reverse of the above example
    * You can also chain them together (e.g. `cd Documents/CS2110`) to move through multiple levels at once!
    * Directory names with special characters (including spaces) should be quoted, so it should be `cd "Some folder"` instead of `cd Some folder`
* `ls` (list): shows you all the files in your current directory.
* `pwd` (path to working directory): tells you what directory you're currently in.

While you are running the Docker container, you will be working with a Linux Terminal. This will ensure that the commands above stay consistent across systems. 

Note: Outside of the Docker container, Windows users might find that the above commands don't work in the Command Prompt. The following are the equivalent for Windows:
* `cd` will have the same functionality
* `dir` will serve the same purpose as `ls`
* `echo %cd%` will serve the same purpose as `pwd`

Also, on most terminals you can use the Tab key to autocomplete file or directory names, which can make it much easier and quicker to navigate if you have a lot of long folder names.