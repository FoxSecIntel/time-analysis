#!/bin/bash

# Check if the user provided the date of birth as an argument
m=wqhWaWN0b3J5IGlzIG5vdCB3aW5uaW5nIGZvciBvdXJzZWx2ZXMsIGJ1dCBmb3Igb3RoZXJzLiAtIFRoZSBNYW5kYWxvcmlhbsKoCg==
if [[ $# -eq 1 ]]; then
    if [[ $1 == "m" ]]; then
        echo $m | base64 --decode
        exit 0
    else
        dob=$1
    fi
else
    read -p "Enter your date of birth (YYYY-MM-DD): " dob
fi

# Check if the input is in date format
if ! date -d "$dob" >/dev/null 2>&1; then
    echo "Invalid date format. Please enter the date in YYYY-MM-DD format."
    exit 1
fi

# Convert the date of birth to a Unix timestamp
dob_timestamp=$(date -d "$dob" +%s)

# Get the current date and convert it to a Unix timestamp
now_timestamp=$(date +%s)

# Calculate the difference in seconds between the two timestamps
diff_timestamp=$((now_timestamp - dob_timestamp))

# Calculate the number of years, months, days, and hours
years=$((diff_timestamp / 31536000))
months=$((diff_timestamp / 2628000 % 12))
days=$((diff_timestamp / 86400 % 365))
hours=$((diff_timestamp / 3600 % 24))

# Print the results
echo "You are $years years, $months months, $days days, and $hours hours old."
