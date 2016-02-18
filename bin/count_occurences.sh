#! /usr/bin/env bash

echo $(grep -o "$1" <<< $2 | wc -l)
