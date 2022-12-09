#!/bin/bash

# Set the time zone of San Francisco
export TZ=America/Los_Angeles
echo "The time in San Francisco is: $(date)"

# Set the time zone of New York City
export TZ=America/New_York
echo "The time in New York City is: $(date)"

# Set the time zone of Amsterdam
export TZ=Europe/Amsterdam
echo "The time in Amsterdam is: $(date)"

# Set the time zone of Venice
export TZ=Europe/Rome
echo "The time in Venice is: $(date)"

# Set the time zone of Hong Kong
export TZ=Asia/Hong_Kong
echo "The time in Hong Kong is: $(date)"
