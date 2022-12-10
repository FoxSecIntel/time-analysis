#!/bin/bash

# Set the time zones to query
time_zones=(US/Pacific US/Central US/Eastern Europe/Amsterdam Europe/Rome Asia/Hong_Kong)

# Loop over the time zones and print the current time for each one
for tz in "${time_zones[@]}"; do
  export TZ=$tz
  printf "%-12s %s\n" "$tz:" "$(date)"
done
