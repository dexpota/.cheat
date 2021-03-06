#!/usr/bin/env bash

gitroot=$(git rev-parse --show-toplevel)

DISCLAIMER="<!-- DO NOT MODIFY THIS FILE, THIS FILE IS AUTO-GENERATED -->"
export DISCLAIMER

CHEAT_LISTING=$(cd "$gitroot" && find . -not -path "*/\.*" -maxdepth 1 -type f -exec basename {} \; | sort | awk 'NF{print "[" $0  "]" "(" $0 ");"}')
export CHEAT_LISTING

while (( "$#" )); do
	filename=$1
	output_filename=${filename%.mo}
	mo "$filename" > "$output_filename"
	shift
done
