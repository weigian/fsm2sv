#!/bin/env sh

echo "
Usage: %source dot2mmd.sh in.dot out.mmd fsm_name

"

inf=$1
outf=$2
name=$3

cat > $outf << EOF
---
title: $name
---
flowchart TD
EOF
sed '1,2d; $d; s/\t/ /g; s/\[\S\+\];//; s/ -> / --> /; s/--> \(.\+\)\[label=\"\(.\+\)\"\];/--> | \2 | \1/; s/(\(.\+\))/\1/' $inf >> $outf
