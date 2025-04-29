# Apple device

The Apple device lineup includes the _Magic Mouse_ and _Magic Keyboard_, both known for their **excellent design** and **functionality**. While Apple does not officially support these devices on _Arch Linux_, you can use them with the help of some community packages.

## Magic Mouse

> This guide covers the _Magic Mouse 2 USB-C 2024_.

[This repository](https://github.com/mr-cal/Linux-Magic-Trackpad-2-USB-C-Driver) provides support for the 2024 USB-C version of the _Magic Mouse 2_. It allows you to build specific kernel modules for the device, such as `hid_magicmouse`. With these modules, you can connect the mouse via Bluetooth, and it will function as a standard mouse.

## Magic Keyboard

> This guide covers the _Magic Keyboard 2021 (no Touch ID)_.

The Magic Keyboard is supported by the _Linux kernel firmware_, so you do not need to build any additional kernel modules for the _Magic Keyboard 2021 (no Touch ID)_. However, you need to add a module load rule. Use `/etc/udev/rules.d/91-apple-keyboard.rules` to ensure the `hid` device is loaded, which will then enable the `hid_apple` module. Additionally, configure the Magic Keyboard using the `/etc/modprobe.d/hid-apple.conf` file.

