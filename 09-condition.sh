#!/bin/bash
# write number lessthan 10

number=$1

if [ "${number}" -lt 10 ]; then
    echo "Entered number is less than 10"
elif [ "${number}" -eq 10 ]; then
    echo "Entered number is exactly 10"
else
    echo "Entered number is greater than 10"
fi    
