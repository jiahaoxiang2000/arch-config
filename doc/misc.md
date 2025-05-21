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

```conf hyprland.conf
# tell X11/XWayland to go through Fcitx
env = XMODIFIERS @im=fcitx
# for GTK (if you hit issues, you can unset/adjust per https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland)
env = GTK_IM_MODULE fcitx
# for Qt apps under Hyprland
env = QT_IM_MODULE fcitx
```

### Starting fcitx5

Launch fcitx5 with hyprland:

```conf hyprland.conf
exec-once = fcitx5 &
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
- **Switch between Chinese and English**: `Ctrl Space`
- **Use the Emoji**: "Super + `" then input :smile: get 😃, so funny
- **Configure appearance**: Use fcitx5-configtool > Addons > Classic User Interface
- **Adjust candidate list**: Configure through the fcitx5-configtool

### Troubleshooting

If fcitx5 is not working properly:

1. Check if environment variables are set correctly
2. Restart your desktop environment or window manager
3. Ensure fcitx5 is running (`ps aux | grep fcitx5`)
4. Check logs with `journalctl --user -xe | grep fcitx5`

## TeX Live

### Overview

To use Chinese text in LaTeX documents and compile journal templates (such as IEEEtran) with bibliography support, you need to install several TeX Live packages, including XeTeX and BibTeX.

### Required Packages

- **texlive-basic**: Core TeX Live files
- **texlive-bin**: TeX Live binaries
- **texlive-langchinese**: Chinese language support (fonts, packages)
- **texlive-fontsextra**: Additional fonts
- **texlive-science**: Science-related LaTeX packages
- **texlive-binextra**: Extra TeX Live binaries
- **texlive-publishers**: Publisher/journal templates (e.g., IEEEtran)
- **texlive-latexextra**: Additional LaTeX packages

### Installation

Install all required packages with:

```bash
sudo pacman -S texlive-basic texlive-bin texlive-langchinese texlive-fontsextra texlive-science texlive-binextra texlive-publishers texlive-latexextra
```

### Notes

- **XeTeX** is included for Unicode and Chinese support.
- **IEEEtran** and other journal templates are provided by `texlive-publishers`.
- **BibTeX** is included for bibliography management.

## linux-zen Kernel

### Overview

The linux-zen kernel is a community-maintained Arch kernel variant, tuned for better responsiveness and interactivity on desktop systems. It includes additional patches and tweaks for improved desktop and workstation performance.

### Installation

To install the linux-zen kernel and its headers, run:

```fish
sudo pacman -S linux-zen linux-zen-headers
```

After installation, reboot your system and select the linux-zen kernel from your bootloader menu (systemd-boot, GRUB, etc).

> **Tip:** With systemd-boot, use the arrow keys at boot to choose 'Arch Linux (linux-zen)' from the list. If you want linux-zen as the default, edit `/boot/loader/loader.conf` and set `default arch-*linux-zen*` (the exact entry name may vary, check `/boot/loader/entries/`).

### Notes

- The linux-zen kernel is compatible with most desktop hardware and drivers.
- If you use DKMS modules (such as NVIDIA or custom drivers), the headers package is required.
- You can always switch back to the standard Arch kernel from your boot menu if needed.

## Maximizing Intel CPU Frequency on Linux

### Overview

To maximize the performance of your Intel(R) Core(TM) i7-7820X CPU on Linux, you can set the CPU frequency governor to 'performance' and ensure Intel Turbo Boost is enabled. This will allow your CPU to run at its highest possible frequency under load.

### Steps

1. **Install cpupower**

   ```fish
   sudo pacman -S cpupower
   ```

2. **Set the CPU governor to performance**

   ```fish
   sudo cpupower frequency-set -g performance
   ```

   This sets all CPU cores to use the 'performance' governor, maximizing frequency.

3. **Check Turbo Boost status**

   Turbo Boost should be enabled by default. To check:

   ```fish
   cat /sys/devices/system/cpu/intel_pstate/no_turbo
   ```

   - If the output is `0`, Turbo Boost is enabled.
   - If the output is `1`, Turbo Boost is disabled (enable it in your BIOS/UEFI).

4. **Verify current frequency and governor**

   ```fish
   cpupower frequency-info | head -20
   ```

   - Look for `current policy: frequency should be within ...` and `The governor "performance"`.
   - Check `boost state support: Active: yes` for Turbo Boost.

### Notes

- For true overclocking (beyond Intel Turbo Boost), you must adjust settings in your motherboard's BIOS/UEFI.
- Monitor CPU temperatures and system stability if you push frequencies higher.
- The linux-zen kernel is optimized for desktop responsiveness and works well with these settings.
- Use `cpupower frequency-info` to monitor CPU scaling at any time.

## CPU Benchmarking

### Overview

To benchmark your CPU performance and compare with others, you can use Geekbench (for easy online comparison) or sysbench (open-source, CLI-based).

### Geekbench (Recommended)

1. Install Geekbench using yay:
   ```fish
   yay -S geekbench
   ```
2. Run Geekbench:
   ```fish
   geekbench
   ```
3. After the test, you'll get a link to your results online for easy comparison with other CPUs.

we get the result on the [online](https://browser.geekbench.com/v6/cpu/11981510), 1451 Single-Core Score 7180 Multi-Core Score.

#### Performance Comparison

| CPU                                                                | Single-Core | Multi-Core |
| ------------------------------------------------------------------ | ----------- | ---------- |
| i7-7820X [yours](https://browser.geekbench.com/v6/cpu/11981510)    | 1451        | 7180       |
| i7-7820X [Auto OC](https://browser.geekbench.com/v6/cpu/12025481)  | 1528        | 7541       |
| [AMD Ryzen 7 9700X](https://browser.geekbench.com/v6/cpu/11974922) | 3478        | 19177      |

- The AMD Ryzen 7 9700X, which on May 2025 1300 Yuan, is about **2.2x faster** in single-core and **3x faster** in multi-core performance compared to your i7-7820X (based on Geekbench 6).
- Your CPU is still strong for its generation, but modern high-end CPUs deliver much higher scores, especially in multi-threaded workloads.
- For more comparisons, see the [Geekbench Browser](https://browser.geekbench.com/).

## Wechat

### Fcitx5 Input Method Not Working in Wechat

If you find that the fcitx5 input method does not work in Wechat (even though the fcitx5 process is running), the likely cause is missing environment variables in the Wechat desktop entry.

#### Solution

Update the Wechat desktop file to set the required environment variables for input method support:

```bash
sudo sed -i 's|^Exec=.*|Exec=env GTK_IM_MODULE=fcitx QT_IM_MODULE=fcitx XMODIFIERS=@im=fcitx /opt/wechat/wechat %U|' /usr/share/applications/wechat.desktop
```

This command ensures that Wechat is started with the correct environment for fcitx5 to function properly.

## OBS Streaming to Bilibili Live

> **Background:** Starting from 2025-05-26, Bilibili will restrict third-party streaming software for users with fewer than 5000 fans. On Linux, OBS is commonly used for streaming, so a workaround is needed to continue streaming.

### Workaround: Use Windows Client to Start Stream, Then Push from Linux OBS

This method requires two computers: one running Windows and the other running Linux.

Steps:

1. **Start the Stream on Windows:**
   - Use the official Bilibili Live client on your Windows machine to start the stream.
   - After the stream is started, you can close the Bilibili Live application.

2. **Stream from Linux with OBS:**
   - On your Linux machine, open OBS.
   - Set the stream key and stream address in OBS. Note that the stream key does **not** auto-refresh, so you can obtain it from the Bilibili web interface before the third-party streaming restriction takes effect.
   - Start streaming from OBS as usual.

**Note:** This workaround was tested, but may not work if Bilibili enforces stricter policies in the future.

## ISSUE

- [x] When launching applications via `.desktop` files (for example, using `wofi`), environment variables set in your shell (like fish) or in `hyprland.conf` are **not** passed to those applications.
  - Here we to change the `~/.bashrc` and `~/.profile` to set the environment variables, then it works, here not the know what the file to work. the `config.fish` is can work on the application, but need the machine restart.
- As a result, input methods (such as fcitx5) or other environment-dependent features may not work as expected in apps started this way.
