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

#### **Comprehensive Vim Configuration:**

Based on the official [VSCodeVim README](https://github.com/VSCodeVim/Vim), this configuration includes all recommended settings for optimal Vim experience:

**Core Vim Settings:**

- `vim.useSystemClipboard: true` - Seamless system clipboard integration
- `vim.useCtrlKeys: true` - Enable Vim control keys while preserving essential VS Code shortcuts
- `vim.leader: "<space>"` - Space as leader key for easier access
- `vim.textwidth: 80` - Standard text width for formatting
- `vim.foldfix: true` - Fix fold navigation issues

**Enhanced Search & Navigation:**

- `vim.incsearch: true` - Incremental search as you type
- `vim.hlsearch: true` - Highlight all search matches
- `vim.smartcase: true` - Smart case sensitivity in searches
- `vim.ignorecase: true` - Case-insensitive search by default

**Visual Feedback:**

- `vim.highlightedyank.enable: true` - Highlight yanked text
- `vim.highlightedyank.color: "rgba(250, 240, 170, 0.5)"` - Custom highlight color
- `vim.highlightedyank.duration: 200` - Highlight duration in milliseconds

**Emulated Vim Plugins:**

- `vim.easymotion: true` - Quick two-character navigation
- `vim.sneak: true` - Enhanced f/F character search
- `vim.sneakUseIgnorecaseAndSmartcase: true` - Smart case for sneak
- `vim.surround: true` - Surround text objects with brackets, quotes, etc.
- `vim.camelCaseMotion.enable: true` - Navigate through camelCase words
- `vim.replaceWithRegister: true` - Replace text with register contents

**Advanced Vim Features:**

- `vim.statusBarColorControl: false` - Disable status bar color changes for performance

### 🎨 Vim-Optimized UI Settings

**Editor Enhancements for Vim Users:**

- **Font**: `JetBrains Mono Nerd Font` with ligatures enabled
- **Font Size**: 18px for comfortable reading
- **Line Numbers**: `"relative"` - Essential for Vim navigation and jump commands
- **Cursor Surrounding Lines**: 8 lines of context above/below cursor
- **Scroll Beyond Last Line**: Disabled for traditional Vim behavior
- **Minimap**: Disabled (Vim users prefer text-based navigation)
- **Glyph Margin**: Disabled for cleaner interface
- **Whitespace Rendering**: None (cleaner view)
- **Horizontal Scrollbar**: Hidden for minimal interface

**Workbench Optimizations:**

- **Startup Editor**: None (faster startup)
- **Large File Confirmation**: 50MB threshold
- **Icon Theme**: Material Icon Theme for better file recognition
- **Automatic Keyboard Navigation**: Disabled to prevent conflicts with Vim navigation
- **Keyboard Dispatch**: `"keyCode"` for better key handling with Vim

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

### ⌨️ Custom Keybindings

### 🧭 Navigation History (Vim-Compatible)

The keybinding configuration focuses on essential navigation while preserving comprehensive Vim functionality:

| Keybinding | Command          | Description             | Vim Context                         |
| ---------- | ---------------- | ----------------------- | ----------------------------------- |
| `Ctrl+O`   | Navigate Back    | Go to previous location | Matches Vim's `Ctrl+O` jump back    |
| `Ctrl+I`   | Navigate Forward | Go to next location     | Matches Vim's `Ctrl+I` jump forward |

### 🪟 **Vim-Style View Pane Navigation**

Complete Vim-style window and pane management using `Ctrl+W` prefix (traditional Vim pattern):

#### **Editor Group Navigation:**

| Keybinding      | Command                   | Description                    |
| --------------- | ------------------------- | ------------------------------ |
| `Ctrl+W H`      | Focus Previous Group      | Focus left editor group        |
| `Ctrl+W L`      | Focus Next Group          | Focus right editor group       |
| `Ctrl+W J`      | Focus Below Group         | Focus editor group below       |
| `Ctrl+W K`      | Focus Above Group         | Focus editor group above       |
| `Ctrl+W Ctrl+W` | Focus Active Editor Group | Return to editor from any view |

#### **Sidebar & Panel Navigation:**

| Keybinding       | Command          | Description               |
| ---------------- | ---------------- | ------------------------- |
| `Ctrl+W E`       | Focus Explorer   | Open/focus file explorer  |
| `Ctrl+W Shift+E` | Toggle Sidebar   | Show/hide sidebar         |
| `Ctrl+W T`       | Focus Terminal   | Focus terminal panel      |
| `Ctrl+W Shift+T` | Toggle Panel     | Show/hide bottom panel    |
| `Ctrl+W P`       | Focus Problems   | Focus problems panel      |
| `Ctrl+W O`       | Focus Output     | Focus output panel        |
| `Ctrl+W G`       | Focus Git/SCM    | Focus source control view |
| `Ctrl+W D`       | Focus Debug      | Focus debug view          |
| `Ctrl+W X`       | Focus Extensions | Focus extensions view     |

#### **Editor Management:**

| Keybinding       | Command                | Description                  |
| ---------------- | ---------------------- | ---------------------------- |
| `Ctrl+W S`       | Split Editor Down      | Split editor horizontally    |
| `Ctrl+W V`       | Split Editor Right     | Split editor vertically      |
| `Ctrl+W Q`       | Close Active Editor    | Close current editor         |
| `Ctrl+W Shift+Q` | Close Editors in Group | Close all editors in group   |
| `Ctrl+W N`       | Next Editor            | Next tab in editor group     |
| `Ctrl+W Shift+N` | Previous Editor        | Previous tab in editor group |

#### **Resize Editor Groups:**

| Keybinding       | Command              | Description          |
| ---------------- | -------------------- | -------------------- |
| `Ctrl+W Shift+H` | Decrease View Width  | Make editor narrower |
| `Ctrl+W Shift+L` | Increase View Width  | Make editor wider    |
| `Ctrl+W Shift+J` | Decrease View Height | Make editor shorter  |
| `Ctrl+W Shift+K` | Increase View Height | Make editor taller   |

#### **Move Editors Between Groups:**

| Keybinding           | Command                       | Description               |
| -------------------- | ----------------------------- | ------------------------- |
| `Ctrl+W Shift+Right` | Move Editor to Next Group     | Move current editor right |
| `Ctrl+W Shift+Left`  | Move Editor to Previous Group | Move current editor left  |

#### **Maximize & Layout:**

| Keybinding       | Command                | Description             |
| ---------------- | ---------------------- | ----------------------- |
| `Ctrl+W M`       | Toggle Maximized Panel | Maximize/restore panel  |
| `Ctrl+W Shift+M` | Toggle Editor Widths   | Maximize/restore editor |

### **🎯 Vim Window Management Benefits:**

This comprehensive keybinding system provides:

1. **Familiar Vim Pattern**: Uses `Ctrl+W` prefix exactly like traditional Vim
2. **Complete Keyboard Control**: Navigate entire VS Code interface without mouse
3. **Logical Mnemonics**:
   - `E` for Explorer, `T` for Terminal, `G` for Git
   - `H/J/K/L` for directional movement (Vim standard)
   - `S/V` for horizontal/vertical splits (Vim standard)
   - `Q` for quit/close operations (Vim standard)
4. **Context Awareness**: Most commands only work when editor has focus
5. **Consistent Workflow**: Maintains muscle memory from terminal Vim

### **🚀 Example Workflow:**

```vim
# Start in editor, want to check git status and run tests
Ctrl+W G          # Switch to Git view
# Review changes, then need terminal
Ctrl+W T          # Switch to terminal
# Run tests, then back to code
Ctrl+W Ctrl+W     # Return to editor
# Need to split for comparison
Ctrl+W V          # Vertical split
# Navigate between splits
Ctrl+W L          # Focus right split
Ctrl+W H          # Focus left split
```

### 🅥 Advanced Vim Key Bindings

**Smart Key Handling Configuration:**

```json
"vim.handleKeys": {
  "<C-o>": true,   // Vim: Jump back
  "<C-i>": true,   // Vim: Jump forward
  "<C-d>": true,   // Vim: Half page down
  "<C-u>": true,   // Vim: Half page up
  "<C-f>": false,  // VS Code: Find in file
  "<C-p>": false,  // VS Code: Quick Open
  "<C-w>": false,  // VS Code: Close tab
  "<C-n>": false,  // VS Code: New file
  "<C-s>": false,  // VS Code: Save
  "<C-a>": false,  // VS Code: Select all
  "<C-c>": false,  // VS Code: Copy
  "<C-v>": false,  // VS Code: Paste
  "<C-x>": false,  // VS Code: Cut
  "<C-z>": false   // VS Code: Undo
}
```

**Insert Mode Key Bindings:**

| Keybinding | Action  | Description                 |
| ---------- | ------- | --------------------------- |
| `jj`       | `<Esc>` | Quick escape to normal mode |

**Normal Mode Leader Commands:**

| Keybinding  | Command         | Description               |
| ----------- | --------------- | ------------------------- |
| `<leader>d` | `dd`            | Delete current line       |
| `<leader>w` | Save File       | Save current file         |
| `<leader>f` | Quick Open      | Open file picker          |
| `<leader>p` | Command Palette | Show VS Code commands     |
| `<C-n>`     | `:nohl`         | Clear search highlighting |

**Enhanced Navigation Commands:**

| Keybinding | VS Code Command      | Description               |
| ---------- | -------------------- | ------------------------- |
| `gd`       | Go to Definition     | Jump to symbol definition |
| `gh`       | Show Hover           | Display hover information |
| `gi`       | Go to Implementation | Jump to implementation    |
| `gr`       | Go to References     | Show all references       |

**Visual Mode Enhancements:**

| Keybinding | Action        | Description                       |
| ---------- | ------------- | --------------------------------- |
| `>`        | Indent Lines  | Indent selected lines             |
| `<`        | Outdent Lines | Unindent selected lines           |
| `p`        | Smart Paste   | Paste without overriding register |

## 🎩 **VSCodeVim Tricks!**

### **🎯 VS Code Integration Commands:**

VS Code has a lot of nifty tricks and we try to preserve some of them:

- **`gd`** - Jump to definition. Navigate directly to where a symbol is defined.

- **`gq`** - On a visual selection, reflow and wordwrap blocks of text, preserving commenting style. Great for formatting documentation comments.

- **`gb`** - Adds another cursor on the next word it finds which is the same as the word under the cursor. Perfect for multi-cursor editing.

- **`af`** - Visual mode command which selects increasingly large blocks of text. For example, if you had `"blah (foo [bar 'ba|z'])"` then it would select `'baz'` first. If you pressed `af` again, it'd then select `[bar 'baz']`, and if you did it a third time it would select `"(foo [bar 'baz'])"`.

- **`gh`** - Equivalent to hovering your mouse over wherever the cursor is. Handy for seeing types and error messages without reaching for the mouse!

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

Based on the official VSCodeVim README, this configuration includes all recommended settings:

```json
{
  // Core Vim functionality
  "vim.useSystemClipboard": true,
  "vim.useCtrlKeys": true,
  "vim.leader": "<space>",
  "vim.textwidth": 80,
  "vim.foldfix": true,

  // Enhanced search
  "vim.incsearch": true,
  "vim.hlsearch": true,
  "vim.smartcase": true,
  "vim.ignorecase": true,

  // Visual feedback
  "vim.highlightedyank.enable": true,
  "vim.highlightedyank.color": "rgba(250, 240, 170, 0.5)",
  "vim.highlightedyank.duration": 200,

  // Emulated plugins
  "vim.easymotion": true,
  "vim.sneak": true,
  "vim.sneakUseIgnorecaseAndSmartcase": true,
  "vim.surround": true,
  "vim.camelCaseMotion.enable": true,
  "vim.replaceWithRegister": true,

  // Performance and compatibility
  "vim.statusBarColorControl": false,

  // Smart key handling
  "vim.handleKeys": {
    "<C-o>": true,
    "<C-i>": true,
    "<C-d>": true,
    "<C-u>": true,
    "<C-f>": false,
    "<C-p>": false,
    "<C-w>": false,
    "<C-n>": false,
    "<C-s>": false,
    "<C-a>": false,
    "<C-c>": false,
    "<C-v>": false,
    "<C-x>": false,
    "<C-z>": false
  },

  // Custom key bindings
  "vim.insertModeKeyBindings": [{ "before": ["j", "j"], "after": ["<Esc>"] }],

  "vim.normalModeKeyBindingsNonRecursive": [
    { "before": ["<leader>", "d"], "after": ["d", "d"] },
    { "before": ["<C-n>"], "commands": [":nohl"] },
    {
      "before": ["<leader>", "w"],
      "commands": ["workbench.action.files.save"]
    },
    { "before": ["<leader>", "f"], "commands": ["workbench.action.quickOpen"] },
    {
      "before": ["<leader>", "p"],
      "commands": ["workbench.action.showCommands"]
    },
    { "before": ["g", "d"], "commands": ["editor.action.revealDefinition"] },
    { "before": ["g", "h"], "commands": ["editor.action.showHover"] },
    { "before": ["g", "i"], "commands": ["editor.action.goToImplementation"] },
    { "before": ["g", "r"], "commands": ["editor.action.goToReferences"] }
  ],

  "vim.visualModeKeyBindingsNonRecursive": [
    { "before": [">"], "commands": ["editor.action.indentLines"] },
    { "before": ["<"], "commands": ["editor.action.outdentLines"] },
    { "before": ["p"], "after": ["p", "g", "v", "y"] }
  ]
}
```

## 🔧 Context Conditions & Smart Behavior

The configuration includes intelligent context awareness:

- **`editorTextFocus`**: Keybindings only active when editing text
- **`vim.mode != 'Insert'`**: Commands disabled in Vim insert mode
- **`!suggestWidgetVisible`**: Disabled when autocomplete is shown
- **`canNavigateBack/Forward`**: Navigation only when possible

## 📝 Profile Settings

Settings marked with `workbench.settings.applyToAllProfiles` ensure consistent Vim experience across all VS Code profiles. The comprehensive list includes:

### **Vim Core Settings (Applied to All Profiles):**

- `vim.highlightedyank.enable`, `vim.highlightedyank.color`, `vim.highlightedyank.duration`
- `vim.easymotion`, `vim.incsearch`, `vim.hlsearch`, `vim.smartcase`, `vim.ignorecase`
- `vim.sneak`, `vim.sneakUseIgnorecaseAndSmartcase`, `vim.surround`
- `vim.camelCaseMotion.enable`, `vim.replaceWithRegister`
- `vim.textwidth`, `vim.leader`, `vim.foldfix`
- `vim.useCtrlKeys`, `vim.useSystemClipboard`, `vim.handleKeys`
- `vim.statusBarColorControl`

### **Vim Key Bindings (Applied to All Profiles):**

- `vim.insertModeKeyBindings`
- `vim.normalModeKeyBindingsNonRecursive`
- `vim.visualModeKeyBindingsNonRecursive`

### **Editor Settings for Vim (Applied to All Profiles):**

- `editor.lineNumbers`, `editor.cursorSurroundingLines`
- `editor.scrollBeyondLastLine`, `editor.scrollbar.horizontal`
- `workbench.list.automaticKeyboardNavigation`, `keyboard.dispatch`

### **Additional Cross-Profile Settings:**

- All GitHub Copilot settings
- Editor formatting and display settings
- Workbench theme and layout settings
- Terminal and chat configurations

---

## 🎓 **Quick Start Guide for Vim Users**

### **First Time Setup:**

1. **VSCodeVim Extension**: Ensure `vscodevim.vim` is installed and enabled
2. **Performance Configuration**: Extension affinity is set to main process for optimal performance
3. **System Integration**: `vim.useSystemClipboard: true` enables seamless copying between Vim and system
4. **Leader Key**: Configured as `<space>` for easy access to custom commands
5. **Font Setup**: Install `JetBrains Mono Nerd Font` for optimal display
6. **Line Numbers**: Relative line numbers are enabled for Vim-style navigation

### **Essential Features Available:**

#### **Immediate Vim Experience:**

- **All Vim motions**: `hjkl`, `w/b/e`, `gg/G`, `0/$`, etc.
- **Text objects**: `ciw`, `ci"`, `ca{`, etc. work perfectly
- **Visual modes**: `v`, `V`, `Ctrl+v` with enhanced functionality
- **Search**: `/pattern` with incremental highlighting
- **Registers**: Full register support with system clipboard integration

#### **Enhanced Plugin Features:**

- **EasyMotion**: `<leader><leader>s{char}` for quick navigation
- **Sneak**: `s{char}{char}` for two-character search
- **Surround**: `cs"'` (change), `ds"` (delete), `ys<motion>"` (add)
- **CamelCase**: `<leader>w/b/e` for programming navigation
- **Replace Register**: `gr<motion>` for register replacement

#### **VS Code Integration:**

- **Go to Definition**: `gd` - Jump to symbol definition
- **Show Hover**: `gh` - Display documentation
- **Command Access**: `<leader>p` for command palette
- **Quick Save**: `<leader>w` to save files
- **File Opening**: `<leader>f` for quick file access

### **Daily Workflow:**

1. **Start in Normal Mode**: Extension boots directly into Vim normal mode
2. **Navigate with Relative Numbers**: Use `5j`, `10k` with visible line numbers
3. **Quick Mode Switching**: `jj` in insert mode returns to normal mode
4. **Smart Search**: Use `/` with automatic case sensitivity and highlighting
5. **Efficient Editing**: Leverage text objects and surround operations
6. **VS Code Features**: Access through leader commands or `g` prefixed shortcuts

### **Performance Tips:**

- **Extension Affinity**: Configured for main process execution
- **Optimized Key Handling**: Smart delegation between Vim and VS Code
- **Fold Fixes**: Enabled to prevent navigation issues
- **Status Bar**: Color control disabled for better performance

### **Troubleshooting:**

- **Key Conflicts**: Configuration preserves essential VS Code shortcuts (Ctrl+S, Ctrl+C, etc.)
- **Performance**: Extension affinity ensures smooth operation
- **Mode Issues**: Status bar shows current Vim mode
- **Search Highlighting**: `<C-n>` clears search highlights
- **Line Numbers**: Relative numbers help with Vim jump commands

---

_Last updated: June 15, 2025_

> 🅥 **Vim Power User Tip**: This configuration implements the complete VSCodeVim experience based on the official README recommendations. With all emulated plugins enabled (EasyMotion, Sneak, Surround, CamelCase, ReplaceWithRegister), enhanced search capabilities, and smart key handling, this setup provides a seamless transition from terminal Vim to VS Code without sacrificing any functionality.

> 🚀 **Performance Note**: With optimized extension affinity, relative line numbers, comprehensive key bindings, and cross-profile consistency, this setup delivers maximum Vim efficiency while maintaining VS Code's powerful IDE features. The configuration ensures that all 50+ Vim-related settings are synchronized across all profiles for a consistent experience.

> ⚡ **Feature Complete**: This configuration includes every major Vim feature from the VSCodeVim project - from basic navigation to advanced text objects, plugin emulations, and VS Code integrations. It's designed for users who want the full Vim experience without any compromises.
