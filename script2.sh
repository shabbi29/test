#!/bin/bash

echo "Current Time Zone: $(timedatectl | grep 'Time zone')"

echo "Available Time Zones:"
timedatectl list-timezones | less

read -p "Enter the desired time zone (e.g., Asia/Kolkata): " new_timezone

if timedatectl list-timezones | grep -q "^$new_timezone$"; then
    sudo timedatectl set-timezone "$new_timezone"
    echo "Time zone changed to: $(timedatectl | grep 'Time zone')"
else
    echo "Invalid time zone entered. Please try again."
fi
