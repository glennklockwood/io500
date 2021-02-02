#!/usr/bin/env bash

basedir='./results'

if [ ! -z "$1" ]; then
    basedir="$1"
fi

for i in $(find $basedir -name result_summary.txt -printf "%T@ %Tc %p\n" | sort -n | awk '{print $7}')
do
    echo $i
    cat $i
    echo
done
