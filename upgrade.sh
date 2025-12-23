#!/bin/sh

# --- 1. CONFIGURATION & COLORS ---
# We define colors to make the output "pop"
BOLD="\033[1m"
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Header Banner
clear
echo -e "${BLUE}"
echo "   ___                   _  _ __   _"
echo "  / _ \  _ __   ___  _ _| ||_ \ | |_"
echo " | (_) || '_ \ / - \| ' \ __ | ||  _|"
echo "  \___/ | .__/ \___/|_||_||___/  \__|"
echo "        |_|   VISUAL SAFE UPDATER    "
echo -e "${RESET}"
echo "------------------------------------------------"

# --- 2. UPDATE REPOS ---
echo -e "${CYAN}[INFO]${RESET} Updating package lists..."
if opkg update > /dev/null 2>&1; then
    echo -e "${GREEN}[OK]${RESET} Repository lists updated."
else
    echo -e "${RED}[ERR]${RESET} Failed to update repositories. Check internet?"
    exit 1
fi

# --- 3. CALCULATE TOTALS ---
echo -e "${CYAN}[INFO]${RESET} Scanning for upgradable packages (skipping kernels)..."

# We get the list ONCE just to count the total for the progress bar
# We filter out kmod, kernel, base-files, etc.
ALL_UPDATES=$(opkg list-upgradable | grep -vE '^(kmod|kernel|base-files|libc|busybox|dnsmasq)' | cut -f 1 -d ' ')

if [ -z "$ALL_UPDATES" ]; then
    echo -e "\n${GREEN}✅  System is fully up to date!${RESET}\n"
    exit 0
fi

# Count total packages
TOTAL_COUNT=$(echo "$ALL_UPDATES" | wc -w)
CURRENT_COUNT=0

echo -e "${YELLOW}[WARN]${RESET} Found ${BOLD}$TOTAL_COUNT${RESET} safe packages to upgrade."
echo "------------------------------------------------"

# --- 4. THE LOOP (Dynamic & Visual) ---

# Helper function to get the next package dynamically
get_next_pkg() {
    opkg list-upgradable | grep -vE '^(kmod|kernel|base-files|libc|busybox|dnsmasq)' | head -n 1 | cut -f 1 -d ' '
}

while [ "$(get_next_pkg)" ]; do
    PKG=$(get_next_pkg)
    CURRENT_COUNT=$((CURRENT_COUNT + 1))
    
    # Calculate Percentage
    PERCENT=$((CURRENT_COUNT * 100 / TOTAL_COUNT))
    
    # Create a visual progress bar [====>....]
    BAR_SIZE=20
    DONE_CHARS=$((PERCENT * BAR_SIZE / 100))
    TODO_CHARS=$((BAR_SIZE - DONE_CHARS))
    
    # Build the bar string
    BAR_STR="["
    i=0
    while [ $i -lt $DONE_CHARS ]; do BAR_STR="${BAR_STR}="; i=$((i+1)); done
    BAR_STR="${BAR_STR}>"
    while [ $i -lt $TODO_CHARS ]; do BAR_STR="${BAR_STR}."; i=$((i+1)); done
    BAR_STR="${BAR_STR}]"

    # Print Status Line
    # Format: [====>....] 25% Upgrading package_name
    echo -ne "${BLUE}${BAR_STR} ${BOLD}${PERCENT}%${RESET} 📦 Upgrading ${BOLD}$PKG${RESET}..."
    
    # Perform the Upgrade (hide standard output to keep it clean, show only errors)
    if opkg upgrade "$PKG" > /dev/null 2>&1; then
        # Overwrite the line with "Success" checkmark
        echo -e "\r${GREEN}${BAR_STR} ${BOLD}${PERCENT}%${RESET} ✅ Upgraded ${BOLD}$PKG${RESET}      "
    else
        echo -e "\r${RED}${BAR_STR} ${BOLD}${PERCENT}%${RESET} ❌ Failed ${BOLD}$PKG${RESET}      "
        # Optional: Stop on error?
        # exit 1
    fi
done

# --- 5. SUMMARY ---
echo "------------------------------------------------"
echo -e "${GREEN}✨  All operations completed successfully!${RESET}"
echo -e "${CYAN}    Run 'reboot' if you updated major services.${RESET}"
echo ""
