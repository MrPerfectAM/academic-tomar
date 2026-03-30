#!/bin/bash
# ------------------------------------------------------------
# Author: Siddharthtomar006 (24BCE10204)
# ------------------------------------------------------------
# This script audits a set of important directories, including two
# Firefox‑specific locations. For each existing directory it reports:
#   * Size (human readable)
#   * Permissions (e.g., drwxr-xr-x)
#   * Owner (username)
# The output is formatted into aligned columns for easy reading.
# ------------------------------------------------------------

# --------------------------
# 1. Define base directories to audit
# --------------------------
base_dirs=(
  "/etc"
  "/var/log"
  "/usr/share"
  "/opt"
)

# --------------------------
# 2. Append Firefox‑specific paths dynamically
# --------------------------
# These paths may vary between distributions; we include the most common.
firefox_paths=(
  "/usr/lib/firefox"
  "/etc/firefox"
)

# Combine the arrays into a single list for processing.
all_dirs=(${base_dirs[@]} ${firefox_paths[@]})

# --------------------------
# 3. Header for the report
# --------------------------
printf "================================================================================\n"
printf "                   Firefox AUDIT - DISK & PERMISSION AUDITOR          \n"
printf "================================================================================\n"
printf "% -30s % -10s % -12s % -s\n" "Directory" "Size" "Permissions" "Owner"
printf "--------------------------------------------------------------------------------\n"

# --------------------------
# 4. Loop through each directory, gather data, and print
# --------------------------
for dir in "${all_dirs[@]}"; do
  if [[ -d "$dir" ]]; then
    # Size: du -sh gives human‑readable size of the directory.
    size=$(du -sh "$dir" 2>/dev/null | cut -f1)
    # Permissions: stat -c %A prints symbolic permissions.
    perms=$(stat -c %A "$dir" 2>/dev/null)
    # Owner: stat -c %U prints the username of the owner.
    owner=$(stat -c %U "$dir" 2>/dev/null)
    printf "% -30s % -10s % -12s % -s\n" "$dir" "$size" "$perms" "$owner"
  else
    # If the directory does not exist, note it.
    printf "% -30s % -10s % -12s % -s\n" "$dir" "N/A" "N/A" "N/A"
  fi
done

printf "================================================================================\n"
