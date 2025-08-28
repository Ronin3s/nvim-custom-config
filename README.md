
# Neovim Configuration

This is a personalized Neovim configuration. This document provides an overview of the plugins and keybindings used.

## Installation

1.  Clone the repository: `git clone https://github.com/Ronin3s/Dotfiles.git ~/.config/nvim`
2.  Install `lazy.nvim` by running Neovim. It should bootstrap itself.

## Plugins

Detailed documentation for each plugin can be found in the `DOCS` directory.

- [Bufferline](./DOCS/bufferline.md)
- [Catppuccin](./DOCS/catppuccin.md)
- [Dashboard](./DOCS/dashboard.md)
- [Lualine](./DOCS/lualine.md)
- [Neo-tree](./DOCS/neotree.md)
- [Telescope](./DOCS/telescope.md)
- [Toggleterm](./DOCS/terminal.md)
- [Which-key](./DOCS/which-key.md)

## Keybindings

### General

- `<leader>w`: Save file
- `<leader>c`: Close buffer
- `<leader>q`: Quit Neovim
- `<leader>Q`: Force close
- `<C-l>`: Go to next window
- `<C-h>`: Go to previous window
- `<Tab>`: Next buffer
- `<S-Tab>`: Previous buffer

### Telescope

- `<leader>ff`: Find files
- `<leader>fg`: Live grep
- `<leader>fb`: List buffers
- `<leader>fh`: Help tags
- `<leader>fm`: Custom multi-grep

### Neo-tree

- `<leader>e`: Toggle file explorer
- `<leader>b`: Toggle buffer explorer

### Toggleterm

- `<leader>tt`: Toggle terminal

### Dashboard

- `<leader>d`: Open dashboard
