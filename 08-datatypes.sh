#!/bin/bash

number1=532
number2=345
name=bharath

sum=$(($number1+$number2+$name))
echo "sum is ${sum}"

# length=4 index=3
leaders=("modi" "putin" "trump" "bharath")
echo "All leaders: ${leaders[@]}"
echo "first leader: ${leaders[0]}"
echo "Second leader: ${leaders[1]}"
echo "6th leader: ${leaders[5]}"

