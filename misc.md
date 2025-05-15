# MISC

## PipeWire Audio Setup with pavucontrol

### Overview

This document describes the setup of PipeWire audio system with pavucontrol GUI on Arch Linux.

### Installed Components

- **PipeWire Core**: Main audio/video processing engine
- **PipeWire PulseAudio**: PulseAudio compatibility layer
- **PipeWire ALSA**: ALSA compatibility layer
- **PipeWire JACK**: JACK compatibility layer
- **WirePlumber**: Session/policy manager for PipeWire
- **pavucontrol**: PulseAudio Volume Control (GUI tool)

### Installation Steps

```bash
# Install PipeWire core components
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber

# Install pavucontrol for volume management
sudo pacman -S pavucontrol
```

### Configuration

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

### Starting Services

To enable PipeWire services:

```bash
# Enable PipeWire services for the current user
systemctl --user enable pipewire pipewire-pulse
systemctl --user start pipewire pipewire-pulse
```

### Using pavucontrol

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

### Alternative GUI Tools

Other GUI tools compatible with PipeWire:

- **QpwGraph**: PipeWire graph manager (Qt-based)
- **Helvum**: GTK-based patchbay for PipeWire
- **EasyEffects**: Advanced audio control with equalizers and effects
- **KDE Plasma Audio**: Volume control for KDE users
- **GNOME Control Center**: Volume control for GNOME users

### Troubleshooting

If audio issues occur:

1. Check service status: `systemctl --user status pipewire pipewire-pulse`
2. Restart services: `systemctl --user restart pipewire pipewire-pulse`
3. Verify default devices in pavucontrol's Configuration tab

## Fcitx5 Input Method Setup

### Overview

This section describes the setup of fcitx5 for multilingual input, with a focus on Chinese and English typing support.

### Installed Components

- **fcitx5**: Core input method framework
- **fcitx5-chinese-addons**: Chinese input methods including Pinyin
- **fcitx5-configtool**: Configuration GUI tools
- **fcitx5-gtk**: GTK integration for applications
- **fcitx5-qt**: Qt integration for applications
- **fcitx5-material-color**: Material design theme for fcitx5

### Installation Steps

```bash
# Install fcitx5 with Chinese support and configuration tools
sudo pacman -S fcitx5 fcitx5-chinese-addons fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-material-color
```

### Environment Configuration

Create environment variables configuration for fcitx5:

```bash
# Create environment variables configuration
sudo mkdir -p /etc/environment.d
sudo tee /etc/environment.d/fcitx5.conf << EOF
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus
EOF
```

### Starting fcitx5

Launch fcitx5 with:

```bash
fcitx5 -d
```

Create an autostart entry to run fcitx5 at login:

```bash
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/fcitx5.desktop << EOF
[Desktop Entry]
Name=Fcitx5
GenericName=Input Method
Comment=Start Input Method
Exec=fcitx5
Icon=fcitx
Terminal=false
Type=Application
Categories=System;Utility;
StartupNotify=false
X-GNOME-Autostart-Phase=Applications
X-GNOME-AutoRestart=false
X-GNOME-Autostart-Notify=false
X-KDE-autostart-after=panel
X-KDE-autostart-condition=fcitx5AutostartCondition.sh
EOF
```

### Configuration

To configure fcitx5:

```bash
# Open the GUI configuration tool
fcitx5-configtool
```

For adding Chinese input methods:

1. Open fcitx5-configtool
2. Click "+" to add input methods
3. Uncheck "Only Show Current Language"
4. Select "Chinese" and then choose "Pinyin" or other preferred methods
5. Use Ctrl+Space to toggle between input methods

### Using fcitx5

- **Toggle input methods**: Ctrl+Space (default)
- **Switch between Chinese and English**: Shift key
- **Configure appearance**: Use fcitx5-configtool > Addons > Classic User Interface
- **Adjust candidate list**: Configure through the fcitx5-configtool

### Troubleshooting

If fcitx5 is not working properly:

1. Check if environment variables are set correctly
2. Restart your desktop environment or window manager
3. Ensure fcitx5 is running (`ps aux | grep fcitx5`)
4. Check logs with `journalctl --user -xe | grep fcitx5`
