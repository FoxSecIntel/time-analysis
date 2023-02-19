#!/bin/bash

read -p "Enter your date of birth (YYYY-MM-DD): " dob

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
