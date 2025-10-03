#!/bin/bash

echo "please enter the number"

read  NUMBER
if [ "${NUMBER}" % 2 ]; then
    echo "Entered number "${NUMBER} is "EVEN""
else
    echo "Entered number "${NUMBER} is "ODD""
fi        