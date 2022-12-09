#!/bin/bash

# Set the time zone of San Francisco
export TZ=US/Pacific
echo -e "US Pacific: \t$(date)"

export TZ=US/Central
echo -e "US Central: \t$(date)"

# Set the time zone of New York City
export TZ=US/Eastern
echo -e "US Eastern: \t$(date)"

# Set the time zone of Amsterdam
export TZ=Europe/Amsterdam
echo -e "Amsterdam: \t$(date)"

# Set the time zone of Venice
export TZ=Europe/Rome
echo -e "Venice: \t$(date)"

# Set the time zone of Hong Kong
export TZ=Asia/Hong_Kong
echo -e "Hong Kong: \t$(date)"
