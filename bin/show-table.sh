#! /usr/bin/env bash

# displaying tabular data in pager (with col numbers)
# optional argument; set default value to -1, which shows all table
sed 's/\t\t/\t \t/g;s/\t\t/\t \t/g' "$1" | head -n ${2:-"-1"} | cut -f2,3,5,6,7 | column -t -s $'\t' | less -#2 -N -S
#head -n ${2:-"-1"} sed 's/\t\t/\t \t/g;s/\t\t/\t \t/g' "$1" | column -s, -t | less -#2 -N -S
#sed 's/\t\t/\t \t/g;s/\t\t/\t \t/g' data.csv | column -s, -t
