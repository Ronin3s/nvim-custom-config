
# Telescope

This plugin provides a fuzzy finder for files, buffers, and more.

## Configuration

The configuration for `telescope` is located in `lua/plugins/telescope.lua`.

- **FZF Native**: The `fzf-native` extension is used for better performance.
- **Custom Multi Grep**: A custom multi-grep function is loaded from `lua/custom/telescope-multigrep.lua`.

## Keybindings

- `<leader>ff`: Find files
- `<leader>fg`: Live grep
- `<leader>fb`: List buffers
- `<leader>fh`: Help tags
- `<leader>fm`: Custom multi-grep
