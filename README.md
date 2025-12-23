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
wget -O upgrade.sh https://raw.githubusercontent.com/BlueFalcon2270/openwrt-visual-upgrade/main/openwrt-upgrade.sh && chmod +x openwrt-upgrade.sh.sh && ./openwrt-upgrade.sh.sh
```
<br><br>

## Features
* **Visual Feedback:** Specific progress bar (0-100%).
* **Sequential Processing:** Upgrades one package at a time to maintain stability.
* **Clean Output:** Hides the verbose output of `opkg` unless an error occurs.
<br><br>
