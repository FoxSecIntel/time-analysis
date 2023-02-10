#!/bin/bash

# function to calculate number of seconds from a given date
calculate_seconds() {
  local birth_date=$1
  local current_date=$(date +%s)
  local birth_seconds=$(date -d "$birth_date" +%s)
  local diff_seconds=$((current_date - birth_seconds))
  echo $diff_seconds
}

# function to convert seconds to years, months, days, and seconds
convert_seconds() {
  local seconds=$1
  local years=$((seconds / 31536000))
  seconds=$((seconds % 31536000))
  local months=$((seconds / 2592000))
  seconds=$((seconds % 2592000))
  local days=$((seconds / 86400))
  seconds=$((seconds % 86400))
  echo "$years years, $months months, $days days, and $seconds seconds"
}

# function to calculate time left until expected death
m=wqhWaWN0b3J5IGlzIG5vdCB3aW5uaW5nIGZvciBvdXJzZWx2ZXMsIGJ1dCBmb3Igb3RoZXJzLiAtIFRoZSBNYW5kYWxvcmlhbsKoCg==
calculate_time_left() {
  local birth_date=$1
  local death_age=$2
  local birth_seconds=$(calculate_seconds "$birth_date")
  local death_seconds=$((death_age * 31536000))
  local time_left=$((death_seconds - birth_seconds))
  echo "$(convert_seconds $time_left)"
}

if [ "$1" == "m" ]; then
    echo $m | base64 --decode
else

# validate input parameters
if [ $# -ne 2 ]; then
  echo -e "\033[31mError: Invalid number of parameters\033[0m"
  exit 1
fi

if [[ ! "$1" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  echo -e "\033[31mError: Invalid birth date format\033[0m"
  exit 1
fi

if [[ ! "$2" =~ ^[0-9]+$ ]]; then
  echo -e "\033[31mError: Invalid death age\033[0m"
  exit 1
fi

# calculate and display time left
time_left=$(calculate_time_left "$1" "$2")
echo -e "\033[32mTime left: $time_left\033[0m"
fi
