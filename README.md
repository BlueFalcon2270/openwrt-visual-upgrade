<div align="center">

# 🛡️ OpenWrt Visual Upgrade

**The safe, smart, and beautiful way to update your router.**

[![OpenWrt](https://img.shields.io/badge/Platform-OpenWrt-2ca5e0?style=for-the-badge&logo=openwrt)](https://openwrt.org/)
[![Language](https://img.shields.io/badge/Written%20in-Shell-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)](https://github.com/BlueFalcon2270/openwrt-visual-upgrade/graphs/commit-activity)

<br />
</div>

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







<div align="center">

# 🛡️ OpenWrt Visual Upgrade

**The safe, smart, and beautiful way to update your router.**

[![OpenWrt](https://img.shields.io/badge/Platform-OpenWrt-2ca5e0?style=for-the-badge&logo=openwrt)](https://openwrt.org/)
[![Language](https://img.shields.io/badge/Written%20in-Shell-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)](https://github.com/BlueFalcon2270/openwrt-visual-upgrade/graphs/commit-activity)

<br />

</div>

---

## 📸 What it looks like

Unlike standard `opkg upgrade` which floods your screen with text, **Visual Upgrade** gives you a clean status bar:

```console
root@OpenWrt:~# ./upgrade.sh
Updating package lists...
------------------------------------------------
[1/5] Upgrading luci-app-firewall...
[2/5] Upgrading dnsmasq...
[3/5] Upgrading odhcpd...
------------------------------------------------
✅ All safe user-space packages updated!```
