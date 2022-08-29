#!/bin/bash
X :0 -config /dockerstartup/dummy.conf &> /dev/null &
export DISPLAY=:0
/bin/bash
