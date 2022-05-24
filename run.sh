#!/bin/bash

cd ..

bash ./check.sh
cargo run "${@:2}"