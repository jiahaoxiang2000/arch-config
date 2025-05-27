# Issues

This is issue collection for Ubuntu Desktop.

> here we used Ubuntu 24.04 LTS and the Arch Linux.

## shutdown ubuntu is paused

when we used Ubuntu UI supported `Power Off` or `Suspend`, then the system not shutdown or suspend. For the `Power Off` button clicked, then the system is to in one exit background, but the long time not shutdown.

### Investigations

- _2025-05-10 08:36:45 HKT_ not find the root cause.
- _2025-05-15 08:39:28 HKT_ identified potential issues that could cause shutdown problems. **So we want to back use Arch-linux.**
- _2025-05-27 08:26:35 HKT_ here we find, it may the **USB device** causing the issue.

### Try to find the root cause

`journalctl -b -1 -e` to find the log of last boot, and then find the shutdown log.

```bash
May 26 17:30:11 pc systemd[1]: Finished System Power Off.
May 26 17:30:11 pc systemd[1]: Reached target System Power Off.
May 26 17:30:11 pc systemd[1]: Shutting down.
May 26 17:30:11 pc systemd-shutdown[1]: Syncing filesystems and block devices.
May 26 17:30:11 pc systemd-shutdown[1]: Sending SIGTERM to remaining processes...
May 26 17:30:11 pc systemd-journald[391]: Received SIGTERM from PID 1 (systemd-shutdow).
May 26 17:30:11 pc systemd-journald[391]: Journal stopped
```

Check for Unresponsive Devices, Sometimes USB devices, network mounts, or swap partitions can hang. Try unplugging unnecessary peripherals before shutdown.
