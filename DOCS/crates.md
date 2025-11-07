# Crates.nvim

This plugin is a helper for managing dependencies in your `Cargo.toml` file.

## Configuration

The configuration for `crates.nvim` is located in `lua/plugins/crates.lua`.

- The plugin is configured to load automatically when you open a `Cargo.toml` file.

## Features

When you are editing your `Cargo.toml` file, `crates.nvim` provides:

- **Completion**: Automatically completes crate names and versions.
- **Version Information**: Shows the latest available versions of your dependencies as virtual text.
- **Feature Display**: Shows available features for a crate.

There are no specific keybindings for this plugin; it enhances the editing experience directly within `Cargo.toml` files.
