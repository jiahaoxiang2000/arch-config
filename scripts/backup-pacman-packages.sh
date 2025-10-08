#!/usr/bin/env bash
# Backup script for pacman packages
# This creates lists of manually installed packages (no dependencies)

BACKUP_DIR="${HOME}/.config/pacman-backup"
mkdir -p "${BACKUP_DIR}"

# Export explicitly installed packages from official repos (no dependencies, no AUR)
pacman -Qqen > "${BACKUP_DIR}/pkglist-native.txt"

# Export explicitly installed foreign packages (AUR, no dependencies)
pacman -Qqem > "${BACKUP_DIR}/pkglist-foreign.txt"

echo "Package lists exported to ${BACKUP_DIR}/"
echo "- pkglist-native.txt: Manually installed official repo packages"
echo "- pkglist-foreign.txt: Manually installed AUR packages"