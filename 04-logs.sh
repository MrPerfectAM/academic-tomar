#!/bin/bash
# ------------------------------------------------------------
# Author: Siddharthtomar006 (24BCE10204)
# ------------------------------------------------------------
# This script analyses a given log file for occurrences of a
# user‑provided keyword. It counts total matches and then prints the
# last five matching lines.
#
# Usage: ./04-logs.sh <log_file> <keyword>
# Example: ./04-logs.sh /var/log/firefox/firefox.log error
# ------------------------------------------------------------

# --------------------------
# 1. Validate arguments
# --------------------------
if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <log_file> <keyword>"
  exit 1
fi

log_file="$1"
keyword="$2"

# Suggest a realistic default path for Firefox logs (comment for users).
# For many Linux installations Firefox writes logs to ~/.mozilla/firefox/*.log
# or to system journal; adjust as needed.

# --------------------------
# 2. Verify that the log file exists and is readable
# --------------------------
if [[ ! -r "$log_file" ]]; then
  echo "Error: Cannot read log file '$log_file'"
  exit 2
fi

# --------------------------
# 3. Process the log file line‑by‑line
# --------------------------
match_count=0
# Use an array to store matching lines for later tail operation.
declare -a matches

while IFS= read -r line; do
  if [[ "$line" == *"$keyword"* ]]; then
    ((match_count++))
    matches+=("$line")
  fi
done < "$log_file"

# --------------------------
# 4. Output the results
# --------------------------
printf "================================================================================\n"
printf "                   Firefox AUDIT - LOG FILE ANALYZER                \n"
printf "================================================================================\n"
printf "Log File   : %s\n" "$log_file"
printf "Keyword    : %s\n" "$keyword"
printf "Total Matches Found: %d\n" "$match_count"
printf "--------------------------------------------------------------------------------\n"
if (( match_count > 0 )); then
  printf "Last 5 matching entries:\n"
  # Print the last five elements of the matches array.
  for (( i=${#matches[@]}-5; i<${#matches[@]}; i++ )); do
    if (( i >= 0 )); then
      printf "%s\n" "${matches[i]}"
    fi
  done
else
  printf "No matching entries found.\n"
fi
printf "================================================================================\n"
