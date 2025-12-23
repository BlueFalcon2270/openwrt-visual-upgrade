![OpenWrt](https://img.shields.io/badge/OpenWrt-2299CC?style=for-the-badge&logo=openwrt&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Bash](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

# OpenWrt Visual Upgrade

A simple shell script to perform sequential package upgrades on OpenWrt with a visual progress bar. 
Standard OpenWrt upgrades can be silent or flood the terminal. This script upgrades packages one by one and provides a clean status bar so you know exactly how long the process will take.
<br><br>

## Quick Run
You can run this directly on your router without downloading files by copying and pasting this command:

```bash
opkg update && total=$(opkg list-upgradable | wc -l); count=0; while [ "$(opkg list-upgradable)" ]; do pkg=$(opkg list-upgradable | head -n1 | cut -f1 -d' '); count=$((count+1)); percent=$((count * 100 / total)); bar=$(printf '%0.s#' $(seq 1 $((percent/5)))); printf "\r[%3d%%] [%-20s] %d/%d - %s" "$percent" "$bar" "$count" "$total" "$pkg"; opkg upgrade "$pkg" >/dev/null 2>&1; done; echo
```
<br><br>

## Features
* **Visual Feedback:** Specific progress bar (0-100%).
* **Sequential Processing:** Upgrades one package at a time to maintain stability.
* **Clean Output:** Hides the verbose output of `opkg` unless an error occurs.
<br><br>
