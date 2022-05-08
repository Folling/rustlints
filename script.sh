#!/bin/bash

args=""

while read -r line; do
    args+="-D ${line}"
done < clippy_denies.txt

while read -r line; do
    args+="-D ${line}"
done < std_denies.txt

while read -r line; do
    args+="-W ${line}"
done < clippy_warns.txt

while read -r line; do
    args+="-W ${line}"
done < std_warns.txt

echo $args
