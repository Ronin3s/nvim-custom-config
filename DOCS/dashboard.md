
# Dashboard

This plugin provides a dashboard or startup screen for Neovim.

## Configuration

The configuration for `dashboard` is located in `lua/plugins/dashboard.lua`.

- **Theme**: The `hyper` theme is used.
- **Header**: A custom ASCII art header for "Ronin3s" is displayed.
- **Shortcuts**: The dashboard provides shortcuts for common actions:
  - `f`: Find files (Telescope)
  - `g`: Live grep (Telescope)
  - `r`: Recent files (Telescope)
  - `c`: Open the Neovim config
  - `u`: Update plugins
  - `q`: Quit Neovim
- **Project**: It shows a list of recent projects.
- **MRU**: It shows a list of most recently used files.

## Keybindings

- `<leader>d`: Open the dashboard.
