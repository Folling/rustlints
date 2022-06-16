#!/bin/bash

./check.sh "${@}"
cargo run "${@:2}"
