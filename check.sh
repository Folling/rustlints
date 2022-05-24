#!/bin/bash

if [ -n "$1" ]; then
    mode=$1
else
    mode="debug"
fi

echo "mode is $mode"

if [ ! -f "./$mode/clippy" ]; then
    echo "rustlint directory didn't contain clippy lints file"
    exit 1
fi

if [ ! -f "./$mode/std" ]; then
    echo "rustlint directory didn't contain std lints file"
    exit 1
fi

clippy_args=()
std_args=()

while read -r line; do
    if [[ -z "$line" || "$line" == "#*" ]]; then
        continue
    fi

    clippy_args+=("$line")
done <"./$mode/clippy"

while read -r line; do
    if [[ -z "$line" || "$line" == "#*" ]]; then
        continue
    fi

    std_args+=("$line")
done <"./$mode/std"

if [ "$1" = release ]
then
    flag="-r"
else
    flag=""
fi

cd ..

# unsure why SC2068 doesn't work, but without its violation rust complaints that " clippy" (sic)
# does not exist as a tool; once per clippy lint
# shellcheck disable=SC2068
cargo clippy --workspace -- ${clippy_args[@]} &&
    cargo rustc "$flag" -- ${std_args[@]}
