#!/bin/zsh

for shift in {0..700}; do echo -ne "`printf ' \\\\u%x' $((0xe100 + $shift))`"; done
