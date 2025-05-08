# Apple Devices on Arch Linux

Apple's _Magic Mouse_ and _Magic Keyboard_ are well known for their **excellent design** and **functionality**. Although Apple does not officially support these devices on _Arch Linux_, you can still use them with the help of community-supported packages and a few configuration steps.

---

## Magic Mouse

> This guide is for the _Magic Mouse 2 USB-C 2024_.

To use the 2024 USB-C version of the Magic Mouse 2, you can rely on [this community repository](https://github.com/mr-cal/Linux-Magic-Trackpad-2-USB-C-Driver). It provides the necessary drivers and instructions to build kernel modules like `hid_magicmouse` for your device.

Once the modules are installed, you can connect the Magic Mouse via Bluetooth. It will then work as a standard mouse on your system.

### Configuration

```bash
filename:       /lib/modules/6.11.0-25-generic/updates/dkms/hid-magicmouse.ko.zst
license:        GPL
description:    Apple "Magic" Wireless Mouse driver
parm:           emulate_3button:Emulate a middle button (bool)
parm:           emulate_scroll_wheel:Emulate a scroll wheel (bool)
parm:           scroll_speed:Scroll speed, value from 0 (slow) to 63 (fast)
parm:           scroll_acceleration:Accelerate sequential scroll events (bool)
parm:           report_undeciphered:Report undeciphered multi-touch state field using a MSC_RAW event (bool)

```

```text /etc/modprobe.d/hid-magicmouse.conf
options hid-magicmouse emulate_3button=0 emulate_scroll_wheel=1 scroll_speed=32 scroll_acceleration=0 report_undeciphered=1
```

---

## Magic Keyboard

> This guide is for the _Magic Keyboard 2021 (no Touch ID)_.

The Magic Keyboard (2021, no Touch ID) is supported out of the box by the Linux kernel firmware. You do **not** need to build or install any extra kernel modules.

However, to ensure everything works smoothly, you should add a module load rule. Create the following file:

- `/etc/udev/rules.d/91-apple-keyboard.rules`

This will make sure the `hid` device is loaded, which in turn enables the `hid_apple` module.

You can further configure the Magic Keyboard by editing:

- `/etc/modprobe.d/hid-apple.conf`

This file lets you customize keyboard behavior to your liking.

---
