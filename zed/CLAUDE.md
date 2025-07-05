# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Zed editor configuration directory containing settings, keymaps, tasks, and themes for the Zed text editor. It's part of a larger dotfiles repository at `/home/isomo/.config/`.

## Configuration Files

### Core Configuration
- **settings.json** - Main editor configuration with vim mode, AI integration, and theme settings
- **keymap.json** - Custom key bindings (currently using defaults with commented examples)
- **tasks.json** - Task definitions for running commands, including LaTeX forward search
- **themes/** - Custom theme directory

### Key Features Configured
- **Vim Mode**: Enabled with vim_mode: true
- **AI Integration**: Copilot configured for edit predictions and chat (GPT-4.1)
- **LaTeX Support**: TeXLab LSP with latexmk build configuration
- **PDF Forward Search**: Okular integration for LaTeX development
- **GitHub Dark Theme**: Set as default for both light and dark modes

## Common Tasks

### LaTeX Development
- Forward search to PDF is configured via tasks.json using Okular
- TeXLab LSP handles LaTeX compilation with latexmk
- Synctex enabled for bidirectional PDF synchronization

### Configuration Management
- settings_backup.json serves as a backup of previous settings
- Configuration follows Zed's JSON-with-comments format
- All paths are relative to the Zed config directory

## File Structure Notes
- Standard Zed configuration structure in ~/.config/zed/
- Tasks use shell environment variables like $ZED_DIRNAME and $ZED_STEM
- Configuration supports both system and custom shell specifications