#!/bin/bash
# Use a DISPLAY number that's probably not already taken
X :69 -config /dockerstartup/dummy.conf &> /dev/null &
export DISPLAY=:69
/bin/bash
