#!/bin/bash

# Script name: isloggedon.sh
# Author: Sara Kendig
# Date created: 04-18-2023
# Purpose: Check if a user is logged on or when they last logged on.

# Check if username is provided as a command line argument
if [ $# -eq 0 ]; then
  echo "Usage: ./isloggedon.sh <username>"
  exit 1
fi

# Extract the username from command line argument
username=$1

# Check if the user exists in /etc/passwd
if grep -q "^$username:" /etc/passwd; then
  # Check if the user is currently logged on
  if who | grep -qw "$username"; then
    echo "User '$username' is currently logged on."
  else
    # Get the last login information using lastlog command
    lastlog_info=$(lastlog -u "$username" | awk 'NR>1 {print $1, $4, $5, $6}')
    # Check if the user has never logged on
    if [ -z "$lastlog_info" ]; then
      echo "User '$username' has never logged on."
    else
      echo "User '$username' last logged on: $lastlog_info"
    fi
  fi
else
  echo "User '$username' does not exist."
fi