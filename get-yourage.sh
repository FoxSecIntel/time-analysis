#!/bin/bash
set -euo pipefail

m="wqhWaWN0b3J5IGlzIG5vdCB3aW5uaW5nIGZvciBvdXJzZWx2ZXMsIGJ1dCBmb3Igb3RoZXJzLiAtIFRoZSBNYW5kYWxvcmlhbsKoCg=="

usage() {
  cat <<'EOF'
Usage:
  get-yourage.sh YYYY-MM-DD
  get-yourage.sh m
  get-yourage.sh -h|--help
EOF
}

arg="${1:-}"

if [[ "$arg" == "m" ]]; then
  echo "$m" | base64 --decode
  exit 0
fi

if [[ "$arg" == "-h" || "$arg" == "--help" ]]; then
  usage
  exit 0
fi

# Check if the user provided the date of birth as an argument
if [[ $# -eq 1 ]]; then
  dob="$1"
else
  read -r -p "Enter your date of birth (YYYY-MM-DD): " dob
fi

# Check if the input is in date format first
if [[ ! "$dob" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  echo "Invalid date format. Please enter the date in YYYY-MM-DD format."
  exit 1
fi

# Validate the date actually exists
if ! date -d "$dob" >/dev/null 2>&1; then
  echo "Invalid date. Please enter a real calendar date in YYYY-MM-DD format."
  exit 1
fi

# Convert the date of birth to a Unix timestamp
dob_timestamp=$(date -d "$dob" +%s)

# Get the current date and convert it to a Unix timestamp
now_timestamp=$(date +%s)

# Calculate the difference in seconds between the two timestamps
diff_timestamp=$((now_timestamp - dob_timestamp))

# Calculate the number of years, months, days, and hours (approximate)
years=$((diff_timestamp / 31536000))
months=$((diff_timestamp / 2628000 % 12))
days=$((diff_timestamp / 86400 % 365))
hours=$((diff_timestamp / 3600 % 24))

# Print the results
echo "You are $years years, $months months, $days days, and $hours hours old."
