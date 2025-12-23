#!/bin/sh

# 1. Update package lists
echo "Updating package lists..."
opkg update

# 2. Set up the loop variables
# We use a function to check for upgradable packages, EXCLUDING kernel modules
get_upgradable() {
    opkg list-upgradable | grep -vE '^(kmod|kernel|base-files|libc)' | head -n 1 | cut -f 1 -d ' '
}

# 3. Dynamic Loop (Re-scans database every time as you requested)
while [ "$(get_upgradable)" ]; do
    # Get the next package to upgrade
    PKG=$(get_upgradable)
    
    echo "------------------------------------------------"
    echo "Upgrading $PKG..."
    
    # Try to upgrade
    opkg upgrade "$PKG"
    
    # checking exit status (optional safety)
    if [ $? -ne 0 ]; then
        echo "Error upgrading $PKG. Stopping to prevent breakage."
        exit 1
    fi
done

echo "------------------------------------------------"
echo "All safe user-space packages updated!"
