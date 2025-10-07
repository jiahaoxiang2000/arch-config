# Pacman Package Lists

This directory contains lists of installed packages for system restoration.

## Files

- `pkglist-explicit.txt`: Explicitly installed packages (manually installed)
- `pkglist-all.txt`: All installed packages including dependencies
- `pkglist-foreign.txt`: AUR and foreign packages
- `pkglist-native.txt`: Official repository packages

## Usage

### Backup packages
Run the backup script to update these lists:
```bash
~/.config/scripts/backup-pacman-packages.sh
```

### Restore packages

**Restore explicitly installed packages (recommended):**
```bash
sudo pacman -S --needed - < ~/.config/pacman-backup/pkglist-explicit.txt
```

**Restore all packages:**
```bash
sudo pacman -S --needed - < ~/.config/pacman-backup/pkglist-all.txt
```

**Restore only official repo packages:**
```bash
sudo pacman -S --needed - < ~/.config/pacman-backup/pkglist-native.txt
```

For AUR packages, you'll need to install them manually with your AUR helper (e.g., `yay`, `paru`):
```bash
yay -S --needed - < ~/.config/pacman-backup/pkglist-foreign.txt
```

## Automation

Consider adding this to your shell configuration to run before commits:
```fish
# In ~/.config/fish/config.fish
alias git-backup='~/.config/scripts/backup-pacman-packages.sh && git add ~/.config/pacman-backup/'
```