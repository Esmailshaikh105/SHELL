#!/bin/bash


Dir1=$1
Dir2=$2
output_file=aman

if [[ `sdiff $Dir1 $Dir2` ]]
then
echo -e "checking the directory diffrence"
sdiff $Dir1 $Dir2 > $output_file
else
echo -e "no diffrence found"
fi
