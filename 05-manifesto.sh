#!/bin/bash
# ------------------------------------------------------------
# Author: Siddharthtomar006 (24BCE10204)
# ------------------------------------------------------------
# Interactive script that asks the user three questions and builds a
# personalized Open Source Manifesto. The resulting paragraph is
# appended to a text file named after the current user (e.g.,
# Siddharthtomar006_manifesto.txt).
# ------------------------------------------------------------

# --------------------------
# 1. Prompt the user for input
# --------------------------
read -p "1) What core principle of Open Source inspires you the most? " principle
read -p "2) In one sentence, why do you prefer Firefox over other browsers? " reason
read -p "3) How will you contribute to the Open Source community this year? " commitment

# --------------------------
# 2. Construct the manifesto paragraph
# --------------------------
manifesto="As an advocate of $principle, I choose Firefox because $reason."
manifesto+=" I commit to $commitment, thereby supporting the broader Open Source ecosystem."

# --------------------------
# 3. Define the output file name (user specific)
# --------------------------
output_file="${USER}_manifesto.txt"

# --------------------------
# 4. Append the paragraph to the file, creating it if necessary
# --------------------------
printf "%s\n\n" "$manifesto" >> "$output_file"

# --------------------------
# 5. Inform the user of the successful operation
# --------------------------
printf "Your manifesto has been saved to %s\n" "$output_file"
