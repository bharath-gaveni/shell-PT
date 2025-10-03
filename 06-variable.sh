#!/bin.bash

start_time=$(date +%s)
echo "please wait for 10 seconds"
sleep 10
echo "Your time 10 seconds is completed"
end_time=$(date +%s)
TOTAL_TIME=$(($end_time - $start_time))
echo "Total time takem to execute script is: $TOTAL_TIME"
