#!/usr/bin/env bash
# Backup script for pacman packages
# This creates lists of installed packages for easy reinstallation

BACKUP_DIR="${HOME}/.config/pacman-backup"
mkdir -p "${BACKUP_DIR}"

# Export explicitly installed packages (packages you manually installed)
pacman -Qqe > "${BACKUP_DIR}/pkglist-explicit.txt"

# Export all installed packages (including dependencies)
pacman -Qq > "${BACKUP_DIR}/pkglist-all.txt"

# Export foreign packages (AUR and other non-official repos)
pacman -Qqm > "${BACKUP_DIR}/pkglist-foreign.txt"

# Export native packages (from official repos only)
pacman -Qqn > "${BACKUP_DIR}/pkglist-native.txt"

echo "Package lists exported to ${BACKUP_DIR}/"
echo "- pkglist-explicit.txt: Explicitly installed packages"
echo "- pkglist-all.txt: All installed packages"
echo "- pkglist-foreign.txt: AUR/foreign packages"
echo "- pkglist-native.txt: Official repository packages"