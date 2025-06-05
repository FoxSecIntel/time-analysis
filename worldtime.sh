#!/bin/bash

GREEN='\e[32m'
NC='\e[0m'
DATE_FORMAT="+%a %d %b %Y %H:%M:%S"

CITIES=(
  "San Francisco|America/Los_Angeles"
  "Denver|America/Denver"
  "New York City|America/New_York"
  "Dublin|Europe/Dublin"
  "London|Europe/London"
  "Amsterdam|Europe/Amsterdam"
  "Zurich|Europe/Zurich"
  "Bratislava|Europe/Bratislava"
  "Warsaw|Europe/Warsaw"
)

display_times() {
  for entry in "${CITIES[@]}"; do
    city="${entry%%|*}"
    tz="${entry##*|}"
    current_time=$(env TZ="$tz" date "$DATE_FORMAT")
    zone=$(env TZ="$tz" date +%Z)
    printf "${GREEN}%-20s %s %s${NC}\n" "$city:" "$current_time" "$zone"
  done
}

utility_function() {
  secret="VmljdG9yeSBpcyBub3Qgd2lubmluZyBmb3Igb3Vyc2VsdmVzLCBidXQgZm9yIG90aGVycy4g4oCTIFRoZSBNYW5kYWxvcmlhbg=="
  echo -e "${GREEN}$(echo "$secret" | base64 --decode)${NC}"
}

case "$1" in
  m) utility_function ;;
  *) display_times ;;
esac
