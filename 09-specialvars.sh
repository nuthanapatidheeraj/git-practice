#!/bin/bash

echo "All variables passed to the script : $@"
echo "Number of variables passed: $#"
echo "Script Name: $0"
echo "Curremt working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "curremt script process instace id: $$"
sleep 100 &
echo "PID of last background command: $!"