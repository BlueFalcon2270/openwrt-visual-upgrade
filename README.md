![OpenWrt](https://img.shields.io/badge/OpenWrt-2299CC?style=for-the-badge&logo=openwrt&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Bash](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

# OpenWrt Visual & Safe Upgrade
A smart shell script to perform sequential package upgrades on OpenWrt with a visual progress bar.

Unlike standard bulk updaters, this script re-evaluates dependencies after every installation and automatically skips kernel modules to prevent system instability.
<br><br>

## Quick Run
Copy and run this single command:
```bash
wget -O - https://raw.githubusercontent.com/BlueFalcon2270/openwrt-visual-upgrade/main/upgrade.sh | sh
```
<br>

## 🌟 Features
* **Visual Progress:** Displays a clear `[Count/Total]` status bar so you know exactly how long the process will take.
* **Dynamic Dependency Resolution:** The script re-scans `opkg list-upgradable` after *every* single package update. This ensures that if Package A updates and changes dependencies for Package B, the system handles it correctly immediately.
* **Anti-Brick Safety:** Automatically excludes sensitive system packages (`kmod`, `kernel`, `base-files`, `libc`) to prevent "Vermagic" (Kernel Version Mismatch) errors that can soft-brick your router.
* **Stop-on-Error:** If a package fails to update, the script pauses immediately to prevent cascading failures.
<br><br>
