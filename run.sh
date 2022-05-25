#!/bin/bash

cd ..

echo "${@}"

./check.sh "${@}"
cargo run "${@:2}"
