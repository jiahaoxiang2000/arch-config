# CLAUDE.md

> created by the Claude Code, cost $0.2536, too expensive.

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles/configuration repository that manages configuration files for various tools and applications on a Linux desktop system. The repository uses git for version control and is organized into tool-specific directories.

## Key Configuration Areas

### Shell Configuration

- **Fish Shell**: `/fish/config.fish` - Main shell configuration with environment variables, custom functions, and tool setup
  - Custom functions: `mydate` (date formatting), `tozh` (translation)
  - Environment setup for fcitx input method, Node.js (fnm), and Rust (cargo)
  - Cross-platform support for macOS Homebrew

### Window Manager & Desktop

- **Hyprland**: `/hypr/hyprland.conf` - Wayland compositor configuration
- **Waybar**: `/waybar/config.jsonc` and `/waybar/style.css` - Status bar configuration
- **Kitty**: `/kitty/kitty.conf` - Terminal emulator configuration

### Application Configurations

- **Git**: `/git/ignore` - Global git ignore patterns
- **Neofetch**: `/neofetch/config.conf` - System information display
- **VLC**: Media player settings
- **Input Methods**: fcitx5 configuration for multilingual input

## File Management Patterns

- Configuration files use standard formats (.conf, .fish, .jsonc)
- Backup files are maintained (e.g., `kitty.conf.bak`)
- Git submodules are used for some components (see `.gitmodules`)
- Tool-specific directories follow XDG configuration standards

## Environment Setup

The fish shell configuration handles:

- Input method environment variables for GUI applications
- Node.js version management via fnm
- Rust toolchain PATH configuration
- Cross-platform Homebrew support for macOS
- Custom registry mirrors for faster Node.js/npm downloads
- Integration with `~/.profile` for additional environment setup

## Git Workflow

The repository tracks configuration changes with descriptive commit messages focusing on functional updates (e.g., "fix: conditionally source rustup environment for macOS", "chore: update subproject commit reference").
