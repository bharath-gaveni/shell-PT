#!/bin/bash

echo "number of varibales passed to the script(count of variables): $#"
echo "All variables passed to the script(what are varaibles means names): $@"
echo "current/present working directory: $PWD"
echo "Home of directory of the script: $HOME"
echo "who is the user running the script:$USER"
echo "Process instance id of the script: $$"
echo "Process instance of the last executed command in background: $!"
