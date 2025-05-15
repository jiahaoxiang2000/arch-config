# PipeWire Audio Setup with pavucontrol

## Overview

This document describes the setup of PipeWire audio system with pavucontrol GUI on Arch Linux.

## Installed Components

- **PipeWire Core**: Main audio/video processing engine
- **PipeWire PulseAudio**: PulseAudio compatibility layer
- **PipeWire ALSA**: ALSA compatibility layer
- **PipeWire JACK**: JACK compatibility layer
- **WirePlumber**: Session/policy manager for PipeWire
- **pavucontrol**: PulseAudio Volume Control (GUI tool)

## Installation Steps

```bash
# Install PipeWire core components
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber

# Install pavucontrol for volume management
sudo pacman -S pavucontrol
```

## Configuration

PipeWire configuration files are located in:

- System-wide: `/usr/share/pipewire/`
- User-specific: `~/.config/pipewire/`

pavucontrol configuration is stored in:

```
~/.config/pavucontrol.ini
```

Current pavucontrol settings:

- Window width: 500
- Window height: 400
- Volume meters enabled: Yes

## Starting Services

To enable PipeWire services:

```bash
# Enable PipeWire services for the current user
systemctl --user enable pipewire pipewire-pulse
systemctl --user start pipewire pipewire-pulse
```

## Using pavucontrol

Launch pavucontrol with:

```bash
pavucontrol
```

Key features:

- **Playback**: Adjust volume for application outputs
- **Recording**: Manage recording inputs from applications
- **Output Devices**: Configure and select output audio devices
- **Input Devices**: Configure and select input audio devices
- **Configuration**: Set default devices and profiles

## Alternative GUI Tools

Other GUI tools compatible with PipeWire:

- **QpwGraph**: PipeWire graph manager (Qt-based)
- **Helvum**: GTK-based patchbay for PipeWire
- **EasyEffects**: Advanced audio control with equalizers and effects
- **KDE Plasma Audio**: Volume control for KDE users
- **GNOME Control Center**: Volume control for GNOME users

## Troubleshooting

If audio issues occur:

1. Check service status: `systemctl --user status pipewire pipewire-pulse`
2. Restart services: `systemctl --user restart pipewire pipewire-pulse`
3. Verify default devices in pavucontrol's Configuration tab
