# 🛠️ Resolving Vim Plugin Conflicts with VS Code Keybindings

This guide explains how to resolve conflicts between Vim plugins and VS Code's default keybindings like `Ctrl+P`, `Ctrl+W`, etc.

## 🎯 **The Problem**

VS Code Vim extensions can override important VS Code keybindings, causing conflicts with:

- `Ctrl+P` - Quick Open (File search)
- `Ctrl+W` - Close tab
- `Ctrl+F` - Find in file
- `Ctrl+N` - New file
- And many others...

## ⚙️ **Current Configuration Issue**

Your current settings show a conflict:

- **Global settings**: `"vim.useCtrlKeys": true`
- **Profile settings**: `"vim.useCtrlKeys": false`

This inconsistency can cause unpredictable behavior.

## 🔧 **Solutions**

### **Solution 1: Disable Vim Ctrl Keys (Recommended)**

**For VSCodeVim Extension:**

```json
{
  "vim.useCtrlKeys": false,
  "vim.useSystemClipboard": true,
  "vim.handleKeys": {
    "<C-p>": false,
    "<C-f>": false,
    "<C-w>": false,
    "<C-n>": false,
    "<C-s>": false,
    "<C-z>": false,
    "<C-y>": false,
    "<C-a>": false,
    "<C-c>": false,
    "<C-v>": false,
    "<C-x>": false
  }
}
```

### **Solution 2: Selective Key Handling**

Keep some Vim Ctrl keys but disable problematic ones:

```json
{
  "vim.useCtrlKeys": true,
  "vim.handleKeys": {
    "<C-p>": false, // Allow VS Code Quick Open
    "<C-w>": false, // Allow VS Code Close Tab
    "<C-f>": false, // Allow VS Code Find
    "<C-n>": false, // Allow VS Code New File
    "<C-s>": false, // Allow VS Code Save
    "<C-z>": false, // Allow VS Code Undo
    "<C-o>": true, // Keep Vim jump back
    "<C-i>": true, // Keep Vim jump forward
    "<C-d>": true, // Keep Vim half-page down
    "<C-u>": true, // Keep Vim half-page up
    "<C-b>": true, // Keep Vim page up
    "<C-r>": true // Keep Vim redo
  }
}
```

### **Solution 3: Alternative Vim Keybindings**

Use leader keys or alternative mappings:

```json
{
  "vim.useCtrlKeys": false,
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": ["<leader>", "p"],
      "commands": ["workbench.action.quickOpen"]
    },
    {
      "before": ["<leader>", "f"],
      "commands": ["actions.find"]
    },
    {
      "before": ["<leader>", "w"],
      "commands": ["workbench.action.closeActiveEditor"]
    }
  ],
  "vim.leader": "<space>"
}
```

### **Solution 4: Neovim Extension Configuration**

For the Neovim extension, create a separate nvim config:

```json
{
  "vscode-neovim.neovimExecutablePaths.linux": "/usr/bin/nvim",
  "vscode-neovim.neovimInitVimPaths.linux": "~/.config/nvim/init.vim"
}
```

Then in your `~/.config/nvim/init.vim`:

```vim
" Only remap keys that don't conflict with VS Code
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use leader for VS Code commands
let mapleader = " "
nnoremap <leader>p :call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <leader>f :call VSCodeNotify('actions.find')<CR>
```

## 🎯 **Recommended Configuration**

Based on your setup, here's the optimal configuration:

```json
{
  // Global Vim settings (apply to all profiles)
  "vim.useCtrlKeys": false,
  "vim.useSystemClipboard": true,
  "vim.sneak": true,
  "vim.sneakReplacesF": true,
  "vim.leader": "<space>",

  // Selective key handling - keep useful Vim keys
  "vim.handleKeys": {
    "<C-o>": true, // Vim: Jump back (matches your keybindings.json)
    "<C-i>": true, // Vim: Jump forward (matches your keybindings.json)
    "<C-d>": true, // Vim: Half page down
    "<C-u>": true, // Vim: Half page up
    "<C-f>": false, // VS Code: Find in file
    "<C-p>": false, // VS Code: Quick Open
    "<C-w>": false, // VS Code: Close tab
    "<C-n>": false, // VS Code: New file
    "<C-s>": false, // VS Code: Save
    "<C-a>": false, // VS Code: Select all
    "<C-c>": false, // VS Code: Copy
    "<C-v>": false, // VS Code: Paste
    "<C-x>": false, // VS Code: Cut
    "<C-z>": false // VS Code: Undo
  },

  // Leader-based mappings for common actions
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": ["<leader>", "p"],
      "commands": ["workbench.action.quickOpen"]
    },
    {
      "before": ["<leader>", "f"],
      "commands": ["actions.find"]
    },
    {
      "before": ["<leader>", "w"],
      "commands": ["workbench.action.closeActiveEditor"]
    },
    {
      "before": ["<leader>", "s"],
      "commands": ["workbench.action.files.save"]
    }
  ]
}
```

## 🔄 **Implementation Steps**

### **Step 1: Update Global Settings**

```bash
# Edit your main settings file
code ~/.config/Code/User/settings.json
```

### **Step 2: Fix the Conflict**

Change your global settings from:

```json
"vim.useCtrlKeys": true,
```

To:

```json
"vim.useCtrlKeys": false,
```

### **Step 3: Add Selective Key Handling**

Add the `vim.handleKeys` configuration shown above.

### **Step 4: Test the Configuration**

1. Restart VS Code
2. Test `Ctrl+P` (should open Quick Open)
3. Test `Ctrl+F` (should open Find)
4. Test `Ctrl+O` and `Ctrl+I` (should work as Vim navigation)

## 🎯 **Key Benefits of This Approach**

✅ **VS Code Integration**: All important VS Code shortcuts work normally
✅ **Vim Navigation**: Essential Vim navigation commands are preserved
✅ **Leader Key Access**: Quick access to VS Code features via `<Space>` leader
✅ **No Conflicts**: Clean separation between Vim and VS Code keybindings
✅ **Muscle Memory**: Familiar shortcuts work as expected

## 🐛 **Troubleshooting**

### **If Ctrl+P Still Doesn't Work:**

1. Check if there are conflicting keybindings in `keybindings.json`
2. Restart VS Code completely
3. Disable and re-enable the Vim extension

### **If Vim Navigation Breaks:**

1. Ensure `vim.handleKeys` has the correct Vim keys set to `true`
2. Check that the Vim extension is active (look for mode indicator)

### **Profile-Specific Issues:**

Make sure all profiles have consistent Vim settings, or use the `workbench.settings.applyToAllProfiles` array to sync them.

---

_This configuration provides the best of both worlds: powerful Vim editing with full VS Code integration._
