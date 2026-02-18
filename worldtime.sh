#!/bin/bash
set -euo pipefail

# Hidden message token
m="wqhWaWN0b3J5IGlzIG5vdCB3aW5uaW5nIGZvciBvdXJzZWx2ZXMsIGJ1dCBmb3Igb3RoZXJzLiAtIFRoZSBNYW5kYWxvcmlhbsKoCg=="

# Define cities and their time zones
declare -A CITIES=(
  ["San Francisco"]="America/Los_Angeles"
  ["Denver"]="America/Denver"
  ["New York City"]="America/New_York"
  ["Dublin"]="Europe/Dublin"
  ["London"]="Europe/London"
  ["Amsterdam"]="Europe/Amsterdam"
  ["Zurich"]="Europe/Zurich"
  ["Bratislava"]="Europe/Bratislava"
  ["Warsaw"]="Europe/Warsaw"
)

DATE_FORMAT="%Y-%m-%d %H:%M:%S"

usage() {
  cat <<'EOF'
Usage:
  worldtime.sh                Show all configured cities
  worldtime.sh "City Name"    Show one city (e.g. "Amsterdam")
  worldtime.sh m              Decode hidden message
  worldtime.sh -h|--help      Show this help
EOF
}

print_city_time() {
  local city="$1"
  local tz="$2"
  local current_time
  current_time=$(TZ="$tz" date +"$DATE_FORMAT %Z")
  printf " %-20s %s\n" "$city:" "$current_time"
}

arg="${1:-}"

if [[ "$arg" == "-h" || "$arg" == "--help" ]]; then
  usage
  exit 0
fi

if [[ "$arg" == "m" ]]; then
  echo "$m" | base64 --decode
  exit 0
fi

if [[ -n "$arg" ]]; then
  if [[ -v CITIES["$arg"] ]]; then
    print_city_time "$arg" "${CITIES[$arg]}"
    exit 0
  else
    echo "Unknown city: $arg"
    echo
    usage
    exit 1
  fi
fi

# Print cities west-to-east
ORDERED_CITIES=(
  "San Francisco"
  "Denver"
  "New York City"
  "Dublin"
  "London"
  "Amsterdam"
  "Zurich"
  "Bratislava"
  "Warsaw"
)

for city in "${ORDERED_CITIES[@]}"; do
  print_city_time "$city" "${CITIES[$city]}"
done
