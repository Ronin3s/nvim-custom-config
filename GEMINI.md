# Neovim Configuration

## Project Overview

This is a personalized Neovim configuration written in Lua. It uses the `lazy.nvim` plugin manager to extend the functionality of Neovim with a variety of plugins. The configuration is structured to be modular, with different settings, plugins, and custom code organized into separate files and directories.

### Main Technologies

- **Neovim**: The text editor.
- **Lua**: The primary configuration language.
- **lazy.nvim**: The plugin manager.

### Architecture

The configuration is loaded from `init.lua`, which in turn loads:

- **`lua/config/`**: Core editor settings, plugin manager configuration, keymaps, and autocommands.
- **`lua/plugins/`**: Individual plugin configurations.
- **`lua/custom/`**: Custom Lua modules, such as the `telescope-multigrep.lua` picker.

## Building and Running

To use this configuration, you need to have Neovim installed. The `lazy.nvim` plugin manager will automatically install the plugins when you first open Neovim.

1.  **Clone the repository:**

    ```bash
    git clone <repository-url> ~/.config/nvim
    ```

2.  **Start Neovim:**

    ```bash
    nvim
    ```

On the first run, `lazy.nvim` will bootstrap itself and install all the configured plugins.

## Development Conventions

- **Plugin Management**: All plugins are managed through `lazy.nvim`. Plugin specifications are located in the `lua/plugins/` directory.
- **Modularity**: The configuration is highly modular. Each plugin has its own configuration file, and core settings are separated into logical files in the `lua/config/` directory.
- **Keymaps**: Keymaps are defined in `lua/config/keymaps.lua` and in the individual plugin configuration files. The leader key is set to `<space>`.
- **Custom Code**: Custom functionality is placed in the `lua/custom/` directory.
