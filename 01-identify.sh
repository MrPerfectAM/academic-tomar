#!/bin/bash
# ------------------------------------------------------------
# Author: Siddharthtomar006 (24BCE10204)
# ------------------------------------------------------------
# This script gathers basic system information useful for an
# open‑source audit. It prints the Linux distribution, kernel version,
# current user, home directory, system uptime and the current date.
# At the end a hard‑coded message about software freedom is displayed.
# ------------------------------------------------------------

# Retrieve the pretty name of the Linux distribution from /etc/os-release
# The file contains a line like: PRETTY_NAME="Ubuntu 22.04.3 LTS"
# Using source will export the variable for us.
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  distro="$PRETTY_NAME"
else
  distro="Unknown Distribution"
fi

# Kernel version via uname -r (e.g., 5.15.0-89-generic)
kernel=$(uname -r)

# Current logged‑in user (environment variable $USER)
current_user="$USER"

# Home directory of the current user (environment variable $HOME)
home_dir="$HOME"

# System uptime in a human readable format (e.g., up 2 hours, 45 minutes)
# uptime -p prints "up ..."; we strip the leading word for brevity.
uptime=$(uptime -p | sed 's/^up //')

# Current date and time in the required format.
current_date=$(date '+%a %b %d %Y %H:%M:%S %Z%z (Coordinated Universal Time)')

# ------------------------------------------------------------
# Output section – formatted for readability.
# ------------------------------------------------------------
printf "================================================================================\n"
printf "                   Firefox AUDIT - SYSTEM IDENTITY                    \n"
printf "================================================================================\n"
printf "Linux Distribution: %s\n" "$distro"
printf "Kernel Version:     %s\n" "$kernel"
printf "Current User:       %s\n" "$current_user"
printf "Home Directory:     %s\n" "$home_dir"
printf "System Uptime:      %s\n" "$uptime"
printf "Current Date/Time:  %s\n" "$current_date"
printf "--------------------------------------------------------------------------------\n"
printf "Message: This system runs on Open Source software, providing freedom to study, change, and distribute.\n"
printf "================================================================================\n"
