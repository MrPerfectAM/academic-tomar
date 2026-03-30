#!/bin/bash
# ------------------------------------------------------------
# Author: Siddharthtomar006 (24BCE10204)
# ------------------------------------------------------------
# This script determines the appropriate package manager for the
# host distribution, checks whether Firefox is installed, extracts its
# exact version, and prints short philosophy notes for four popular
# FOSS tools.
# ------------------------------------------------------------

# --------------------------
# 1. Detect Linux distribution
# --------------------------
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  distro_id="$ID"
else
  distro_id="unknown"
fi

# --------------------------
# 2. Choose package manager and Firefox package name based on distro
# --------------------------
case "$distro_id" in
  ubuntu|debian)
    pkg_manager="apt"
    pkg_query="dpkg -s"
    pkg_name="firefox"
    ;;
  fedora|rhel|centos)
    pkg_manager="dnf"
    pkg_query="rpm -q"
    pkg_name="firefox"
    ;;
  arch)
    pkg_manager="pacman"
    pkg_query="pacman -Qi"
    pkg_name="firefox"
    ;;
  opensuse*)
    pkg_manager="zypper"
    pkg_query="rpm -q"
    pkg_name="firefox"
    ;;
  *)
    pkg_manager="unknown"
    pkg_query=""
    pkg_name="firefox"
    ;;
esac

# --------------------------
# 3. Check installation status and retrieve version
# --------------------------
installed=false
version="N/A"

if command -v "$pkg_name" >/dev/null 2>&1; then
  installed=true
  case "$pkg_manager" in
    apt)
      version=$(dpkg -s "$pkg_name" 2>/dev/null | awk -F ': ' '/^Version/ {print $2}')
      ;;
    dnf|zypper)
      version=$($pkg_query "$pkg_name" 2>/dev/null | awk -F '-' '{print $1}')
      ;;
    pacman)
      version=$($pkg_query "$pkg_name" 2>/dev/null | awk -F ':' '/Version/ {print $2}' | xargs)
      ;;
    *)
      version="unknown"
      ;;
  esac
fi

# --------------------------
# 4. Output results
# --------------------------
printf "================================================================================\n"
printf "                   Firefox AUDIT - PACKAGE INSPECTOR                 \n"
printf "================================================================================\n"
if $installed; then
  printf "Status: %s is INSTALLED on this %s system.\n" "$pkg_name" "$distro_id"
  printf "Version: %s\n" "$version"
else
  printf "Status: %s is NOT INSTALLED on this %s system.\n" "$pkg_name" "$distro_id"
fi
printf "--------------------------------------------------------------------------------\n"
printf "FOSS Philosophy Notes:\n"
case "$pkg_name" in
  firefox)
    printf " - Firefox: A web browser that champions open web standards and user privacy.\n"
    ;;
esac
printf " - LibreOffice: Provides a free, feature‑rich office suite, ensuring document freedom.\n"
printf " - GIMP: A powerful image editor that respects artists' rights to modify their work.\n"
printf " - VLC: A versatile media player that supports countless formats without DRM.\n"
printf "================================================================================\n"
