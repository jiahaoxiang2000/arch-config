# System Freeze Debugging Guide

TEMP: Here we guess it is the software conflict, we use the `pacman -Syu` to update the system, see what happens.

## Issue: System freezes with unresponsive TTY switching

### Root Causes Identified:

1. Dual GPU configuration conflicts (NVIDIA + AMD)
2. xdg-desktop-portal-gtk repeated failures
3. Graphics driver/compositor issues

### Debugging Commands:

```bash
# Check for freezes in logs
journalctl --boot=-1 --since "yesterday" | grep -i -E "(freeze|hang|panic|segfault)"

# Monitor GPU usage
nvidia-smi -l 1

# Check compositor logs
journalctl --user -u river.service --since "1 hour ago"

# Monitor system resources
htop
watch -n 1 'free -h && uptime'
```

### Prevention Steps:

1. **Set Primary GPU**:

   ```bash
   # Add to /etc/environment
   __GLX_VENDOR_LIBRARY_NAME=nvidia
   __GL_SYNC_TO_VBLANK=1
   ```

2. **Fix Portal Issues**:

   ```bash
   systemctl --user disable xdg-desktop-portal-gtk
   systemctl --user enable xdg-desktop-portal-wlr
   ```

3. **Enable SysRq for emergency recovery**:
   ```bash
   echo 'kernel.sysrq = 1' | sudo tee -a /etc/sysctl.conf
   ```

### Emergency Recovery:

- **Magic SysRq**: Alt+SysRq+R,E,I,S,U,B (reboot safely)
- **SSH from another device** if network works
- **Single user mode** during boot

### Monitoring Setup:

Create watchdog script to log system state before freezes occur.
