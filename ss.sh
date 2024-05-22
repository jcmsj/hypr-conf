#!/bin/env sh
target=$1
output=/tmp/$(date -Ins).png
swappy -f $(grimblast --notify copysave $target  $output)
rm $output
