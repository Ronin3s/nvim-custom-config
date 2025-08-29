# Neovim Configuration Memory

This file summarizes the Neovim configuration found in `/home/ronin/.config/nvim`.

## Core Configuration

- **`init.lua`**: The entry point of the configuration. It loads the other configuration files in a specific order.
- **`config/options.lua`**: Sets general Neovim options, such as `backup`, `swapfile`, `undofile`, `encoding`, UI settings, tabs, indentation, search, and clipboard settings.
- **`config/lazy.lua`**: Manages plugins using `lazy.nvim`. The leader key is set to `<space>`.
- **`config/keymaps.lua`**: Defines custom keybindings for window navigation, saving, closing buffers, and quitting Neovim.
- **`config/autocmds.lua`**: Contains autocommands for highlighting on yank and auto-reloading the configuration.

## Plugins

### `bufferline.nvim`
- **Purpose**: Provides a line with open buffers.
- **Configuration**: Shows LSP diagnostics, uses slanted separators, and has an offset for `neo-tree`.

### `catppuccin.nvim`
- **Purpose**: The colorscheme.
- **Configuration**: Uses the "mocha" flavor with a transparent background.

### `nvim-cmp`
- **Purpose**: Autocompletion.
- **Configuration**: Uses `nvim-lsp`, `luasnip`, and `buffer` as sources.

### `Comment.nvim`
- **Purpose**: Toggling comments.
- **Keymap**: `<leader>/` to toggle comments.

### `alpha.nvim`
- **Purpose**: A dashboard on startup.
- **Configuration**: Uses the `dashboard` theme with the MRU section from the `startify` theme.

### `indent-blankline.nvim`
- **Purpose**: Adds indentation guides.

### `nvim-lspconfig`
- **Purpose**: The Language Server Protocol (LSP) client.
- **Configuration**:
    - Configured for `lua_ls` and `bashls`.
    - Auto-formats Lua and Bash files on save.

### `lualine.nvim`
- **Purpose**: A feature-rich statusline.

### `neo-tree.nvim`
- **Purpose**: A file explorer.
- **Keymap**: `<leader>e` to toggle the filesystem view.

### `noice.nvim`
- **Purpose**: Replaces the default Neovim UI for messages, cmdline, and popups.

### `nvim-notify`
- **Purpose**: A notification manager.

### `project.nvim`
- **Purpose**: Project management.
- **Configuration**: Integrates with Telescope to list projects.

### `telescope.nvim`
- **Purpose**: A fuzzy finder.
- **Configuration**:
    - Uses `fzf-native` for performance.
    - Includes a custom multi-grep picker.

### `toggleterm.nvim`
- **Purpose**: Manages terminal windows.
- **Keymaps**:
    - `<leader>tt` to toggle a terminal.
    - `<leader>tg` to toggle a floating `lazygit` terminal.

### `nvim-treesitter`
- **Purpose**: Syntax highlighting and code parsing.
- **Configuration**:
    - A list of installed parsers.
    - Incremental selection and text objects are configured.

### `which-key.nvim`
- **Purpose**: Shows a popup with possible keybindings.

## Custom Code

### `custom/telescope-multigrep.lua`
- **Purpose**: A custom Telescope picker for live searching with `rg` using multiple patterns.
- **Keymap**: `<leader>fm` to trigger the multi-grep picker.
