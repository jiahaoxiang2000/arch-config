# VS Code User Configuration Documentation

This document provides a comprehensive overview of the custom VS Code settings and keybindings configured in this user profile, with a focus on **Vim integration** and enhanced text editing workflows.

## 🎯 Overview

This configuration transforms VS Code into a powerful Vim-centric development environment by combining:

- **Multiple Vim Extensions** (VSCodeVim + Neovim integration)
- **Custom Keybindings** for enhanced navigation
- **Optimized Settings** for Vim workflows
- **Cross-Profile Consistency** for seamless experience

## 📁 File Structure

```
~/.config/Code/User/
├── README.md           # This documentation file
├── settings.json       # Global VS Code settings
├── keybindings.json    # Custom keyboard shortcuts
├── snippets/           # Custom code snippets
├── profiles/           # User profiles configuration
└── ...
```

## ⚙️ Settings Overview

### 🅥 Vim Extensions & Integration

This configuration uses **dual Vim integration** for maximum flexibility:

#### **Primary Extensions:**

- **`vscodevim.vim`** (v1.30.1) - Full Vim emulation with VS Code integration

#### **Vim-Specific Settings:**

**Global Vim Settings:**

- `vim.useSystemClipboard: true` - Seamless system clipboard integration
- `vim.useCtrlKeys: false` - Preserves VS Code's Ctrl+key shortcuts

**Profile-Specific Vim Features:**

- `vim.sneak: true` - Quick two-character search navigation
- `vim.sneakReplacesF: true` - Enhanced f/F character search
- `editor.lineNumbers: "relative"` - Relative line numbers for Vim navigation

### 🎨 Vim-Optimized UI Settings

**Editor Enhancements for Vim Users:**

- **Font**: `JetBrains Mono Nerd Font` with ligatures enabled
- **Font Size**: 18px for comfortable reading
- **Minimap**: Disabled (Vim users prefer text-based navigation)
- **Glyph Margin**: Disabled for cleaner interface
- **Whitespace Rendering**: None (cleaner view)

**Workbench Optimizations:**

- **Startup Editor**: None (faster startup)
- **Large File Confirmation**: 50MB threshold
- **Icon Theme**: Material Icon Theme for better file recognition

### 🖥️ Remote Development

The configuration includes SSH platform definitions for multiple remote servers:

- **8.134.209.76** (linux)
- **172.17.1.175** (linux)
- **127.0.0.1** (linux)
- **192.168.71.175** (linux)
- **43.128.87.171** (linux)
- **81.71.65.222** (linux)
- **111.230.99.80** (linux)

### 🔒 Security Settings

- **Workspace Trust**: Untrusted files open without prompt
- **Local File Protocol**: No confirmation prompt for local file handling

### 💻 Terminal Configuration

- **Font Size**: 16px
- **Environment Inheritance**: Disabled for cleaner environment

### 🎨 Workbench & UI

- **Theme**: GitHub Dark Colorblind (Beta)
- **Activity Bar**: Located at the top
- **Panel Labels**: Hidden for cleaner interface
- **Navigation Control**: Disabled
- **Command Center**: Disabled
- **Zoom Level**: 3x magnification

### ✏️ Editor Settings

- **Word Wrap**: Enabled for better readability
- **Format on Save**: Automatic code formatting
- **Mouse Wheel Zoom**: Enabled
- **Horizontal Scrollbar**: Hidden for cleaner view

### 🔄 Git Integration

- **Auto Fetch**: Enabled for automatic updates
- **Sync Confirmation**: Disabled for smoother workflow

### 🤖 AI & Copilot Settings

#### GitHub Copilot

- **Next Edit Suggestions**: Enabled
- **Enabled for**: Markdown and plaintext files
- **Semantic Search**: Enabled for chat

#### Inline Chat

- **Hide on Request**: Enabled
- **V2 Features**: Enabled
- **Word Wrap**: Enabled

### 🎯 Vim Integration

- **System Clipboard**: Enabled for seamless copy/paste

### 🛠️ Build Tools

- **Makefile**: Auto-configure on open

## ⌨️ Custom Keybindings

### 🧭 Navigation History (Vim-Compatible)

The current keybinding configuration focuses on essential navigation while preserving Vim plugin functionality:

| Keybinding | Command          | Description             | Vim Context                         |
| ---------- | ---------------- | ----------------------- | ----------------------------------- |
| `Ctrl+O`   | Navigate Back    | Go to previous location | Matches Vim's `Ctrl+O` jump back    |
| `Ctrl+I`   | Navigate Forward | Go to next location     | Matches Vim's `Ctrl+I` jump forward |

### 🎯 Why Minimal Keybindings?

This configuration intentionally keeps custom keybindings minimal because:

1. **Vim Extensions Handle Most Navigation**: The installed Vim extensions (`vscodevim.vim` and `asvetliakov.vscode-neovim`) provide comprehensive Vim keybindings
2. **No Conflicts**: Avoids interference with native Vim commands
3. **Plugin Compatibility**: Ensures both Vim extensions work seamlessly
4. **Flexible Workflow**: Users can choose between VSCodeVim and Neovim modes

### 🅥 Available Vim Navigation (Via Extensions)

When using the Vim extensions, you get access to:

#### **Native Vim Navigation:**

- `h, j, k, l` - Basic directional movement
- `w, b, e` - Word-based movement
- `0, $` - Line beginning/end
- `gg, G` - Document beginning/end
- `Ctrl+d, Ctrl+u` - Half-page scrolling
- `Ctrl+f, Ctrl+b` - Full-page scrolling

#### **Advanced Vim Features:**

- **Vim Sneak**: `s{char}{char}` for quick two-character search
- **Visual Mode**: `v, V, Ctrl+v` for selection modes
- **Search**: `/pattern` and `?pattern` with `n/N` navigation
- **Marks**: `m{letter}` and `'{letter}` for position marking
- **Registers**: `"{letter}` for advanced copy/paste operations

#### **VS Code Integration:**

- **Command Palette**: `:` opens VS Code command palette
- **File Explorer**: Standard Vim commands work with VS Code's file tree
- **Multi-cursor**: Vim selections integrate with VS Code's multi-cursor
- **IntelliSense**: Vim modes work seamlessly with autocomplete

### � Switching Between Vim Modes

**VSCodeVim Mode:**

- Traditional Vim emulation within VS Code
- Best for users transitioning from Vim
- Integrated with VS Code features

**Neovim Mode:**

- Direct Neovim embedding
- Full Neovim configuration support
- Advanced plugin ecosystem access
- Better performance for complex operations

## 🎯 Vim Workflow Integration

### 🔧 Extension Management

**Extension Priorities:**

```json
"extensions.experimental.affinity": {
  "asvetliakov.vscode-neovim": 1
}
```

This ensures optimal performance by loading Neovim extension in the main process.

### 🎨 Vim-Optimized Visual Settings

**Font Configuration:**

- **Primary**: `JetBrains Mono Nerd Font` (programming ligatures + icons)
- **Fallback**: `Martian Mono, Consolas, Courier New`
- **Size**: 18px (comfortable for extended coding sessions)
- **Ligatures**: Enabled for better code readability

**Editor Layout for Vim Users:**

- **Line Numbers**: Relative (essential for Vim navigation)
- **Minimap**: Disabled (Vim users prefer text-based navigation)
- **Glyph Margin**: Hidden for cleaner interface
- **Whitespace**: Not rendered (reduces visual clutter)

### ⚡ Performance Optimizations

**Startup Configuration:**

- **Startup Editor**: None (faster load times)
- **Auto Save**: After delay (preserves Vim editing flow)
- **Large File Threshold**: 50MB before confirmation

**File Handling:**

- **Explorer Confirmations**: Disabled for delete, drag-drop, paste
- **Smart Commit**: Enabled for streamlined Git workflow

## 🚀 Advanced Vim Usage Tips

### 🎯 **Essential Vim Commands in VS Code**

#### **Navigation & Movement:**

```vim
" Basic movement
h, j, k, l          " Left, Down, Up, Right
w, b, e             " Word forward, back, end
0, $                " Line start, end
gg, G               " File start, end

" Advanced movement
f{char}, F{char}    " Find character forward/backward
t{char}, T{char}    " To character forward/backward
s{char}{char}       " Sneak: jump to two characters (enabled)
```

#### **Editing Operations:**

```vim
" Text objects
ciw, caw            " Change in/around word
ci", ca"            " Change in/around quotes
ci{, ca{            " Change in/around braces

" Visual selections
v, V, Ctrl+v        " Character, line, block visual mode
gv                  " Reselect last visual selection
```

#### **VS Code Integration:**

```vim
" Command palette
:                   " Opens VS Code command palette

" File operations
:e filename         " Open file
:w                  " Save file
:q                  " Close editor

" Search and replace
/pattern            " Search forward
?pattern            " Search backward
:%s/old/new/g       " Global replace
```

### 🛠️ **Configuration Tips**

#### **Custom Vim Settings:**

```json
{
  "vim.sneak": true, // Two-character search
  "vim.sneakReplacesF": true, // Enhanced f/F navigation
  "vim.useSystemClipboard": true, // System clipboard integration
  "vim.useCtrlKeys": false // Preserve VS Code shortcuts
}
```

## 🔧 Context Conditions & Smart Behavior

The configuration includes intelligent context awareness:

- **`editorTextFocus`**: Keybindings only active when editing text
- **`vim.mode != 'Insert'`**: Commands disabled in Vim insert mode
- **`!suggestWidgetVisible`**: Disabled when autocomplete is shown
- **`canNavigateBack/Forward`**: Navigation only when possible

## 📝 Profile Settings

Settings marked with `workbench.settings.applyToAllProfiles` are synchronized across all VS Code profiles, ensuring consistent Vim experience regardless of the active profile.

---

## 🎓 **Quick Start Guide for Vim Users**

### **First Time Setup:**

1. **Choose Your Vim Extension**: Enable either `vscodevim.vim` OR `asvetliakov.vscode-neovim`
2. **Configure Basic Settings**: Ensure `vim.useSystemClipboard: true` for seamless copying
3. **Set Line Numbers**: Enable `"editor.lineNumbers": "relative"` for Vim navigation
4. **Font Setup**: Install `JetBrains Mono Nerd Font` for optimal experience

### **Daily Workflow:**

1. **Start with Normal Mode**: Extensions boot into Vim normal mode
2. **Use Vim Navigation**: `hjkl`, `w/b/e`, `gg/G` work as expected
3. **VS Code Integration**: `:` opens command palette, `Ctrl+P` for file search
4. **System Clipboard**: `"+y` and `"+p` work seamlessly with system

### **Troubleshooting:**

- **Conflicts**: If keybindings conflict, disable `vim.useCtrlKeys`
- **Performance**: Ensure Neovim extension has process affinity set
- **Modes**: Check extension status in status bar for current Vim mode

---

_Last updated: June 15, 2025_

> 🅥 **Vim Power User Tip**: This configuration transforms VS Code into a true Vim environment while preserving modern IDE features. The dual extension setup allows you to choose between traditional Vim emulation and full Neovim integration based on your workflow needs.

> 🚀 **Performance Note**: With relative line numbers, sneak navigation, and system clipboard integration, this setup provides a seamless transition from terminal Vim to VS Code without sacrificing muscle memory or efficiency.
