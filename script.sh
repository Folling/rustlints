#!/bin/bash

args = ""

while read -r line; do
    args += "-D {line}"
done < $clippy_denies

while read -r line; do
    args += "-D {line}"
done < $std_denies

while read -r line; do
    args += "-W {line}"
done < $clippy_warns

while read -r line; do
    args += "-W {line}"
done < $std_warns

cargo clippy args
cargo run
