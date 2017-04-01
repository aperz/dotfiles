#!/bin/sh
# Timezones and current offsets
ZONES="$(timedatectl list-timezones)"

for ZONE in $ZONES
do
    OFFSET="$(env TZ=${ZONE} date +%:z)"
    echo "$ZONE $OFFSET"
done
