#!/bin/sh

# OpenWrt Sequential Package Upgrade with Visual Progress Bar
# Repo: https://github.com/BlueFalcon2270/openwrt-visual-upgrade
# License: MIT

echo "Update package lists..."
opkg update >/dev/null 2>&1

# Get list of upgradable packages
# We store it in a variable to avoid calling opkg repeatedly
upgradable=$(opkg list-upgradable | cut -f1 -d' ')
total=$(echo "$upgradable" | wc -w)

if [ "$total" -eq 0 ]; then
    echo "No updates available."
    exit 0
fi

echo "Found $total packages to upgrade."
echo ""

count=0

# Loop through the list
for pkg in $upgradable; do
    count=$((count+1))
    percent=$((count * 100 / total))
    
    # Calculate progress bar width (scaled to 20 chars)
    num_hash=$((percent / 5))
    bar=$(printf "%0.s#" $(seq 1 $num_hash))
    
    # Print the progress bar
    # \r returns cursor to the start of the line to overwrite it
    printf "\r[%3d%%] [%-20s] %d/%d - Upgrading: %-20s" "$percent" "$bar" "$count" "$total" "$pkg"
    
    # Perform the upgrade
    opkg upgrade "$pkg" >/dev/null 2>&1
done

echo ""
echo "Upgrade complete!"
