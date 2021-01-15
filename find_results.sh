#!/usr/bin/env bash

for i in $(find ./results -name result_summary.txt -printf "%T@ %Tc %p\n" | sort -n | awk '{print $7}')
do
    echo $i
    cat $i
    echo
done
