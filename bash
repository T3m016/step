#!/bin/bash

# Set a load threshold (e.g., 5)
load_threshold=0

recipient="ubuntu@exam1"
subject="Server Alert : HIGH LOAD!!"

# Get load average
load_avg=$(uptime | awk -F'load average:' '{print $2}' | cut -d' ' -f2)

# Check if load is above threshold and send email if so
if [[ $load_avg > $load_threshold ]]; then
  body="The Server HAS HIGH LOAD! The load average is $load_avg."
  echo "$body" | mail -s "$subject" "$recipient" 2>> mail_error.log  # Append errors to log
fi
