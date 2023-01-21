#!/bin/bash
#set -x

# Define the cities and their time zones to display
CITIES=("San Francisco" "America/Los_Angeles" "Denver" "America/Denver" "New York City" "America/New_York" "Dublin" "Europe/Dublin" "London" "Europe/London" "Amsterdam" "Europe/Amsterdam" "Zurich" "Europe/Zurich" "Bratislava" "Europe/Bratislava" "Warsaw" "Europe/Warsaw")
m=wqhWaWN0b3J5IGlzIG5vdCB3aW5uaW5nIGZvciBvdXJzZWx2ZXMsIGJ1dCBmb3Igb3RoZXJzLiAtIFRoZSBNYW5kYWxvcmlhbsKoCg==

# Define the format for the date command
DATE_FORMAT="%Y-%m-%d %H:%M:%S"

if [ "$1" == "m" ]; then
    echo $m | base64 --decode
else
    # Loop over the cities and display the current time in each one
    for ((i=0; i<${#CITIES[@]}; i+=2)); do
      city=${CITIES[$i]}
      time_zone=${CITIES[$i+1]}

      export TZ=$time_zone
      # Use the date command to get the current time in the specified time zone
      current_time=$(date)

      # Print the city and the current time
      printf "%-20s %s\n" "$city:" "$current_time"
    done
fi
