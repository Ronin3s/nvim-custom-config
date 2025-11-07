# Rust Support (rustaceanvim)

This plugin provides a comprehensive Rust development environment inside Neovim, powered by `rust-analyzer`.

## Configuration

The configuration for `rustaceanvim` is located in `lua/plugins/rustaceanvim.lua`.

- It automatically configures and starts the `rust-analyzer` language server.
- It integrates with `nvim-dap` for debugging, using the `codelldb` adapter (which is installed via Mason).
- It is configured to use `clippy` for linting on save, providing real-time feedback on your code.

## Keybindings

The following keybindings are available once the language server is attached to a Rust buffer:

### Rust Commands

- `<leader>ra`: Show available code actions
- `<leader>rr`: Show and run binaries/examples
- `<leader>rt`: Show and run tests
- `<leader>rd`: Show and debug binaries/tests
- `<leader>re`: Expand a macro under the cursor
- `<leader>rh`: Show hover actions
- `<leader>rp`: Go to the parent module
- `<leader>rc`: Open the `Cargo.toml` for the current crate

### Standard LSP Commands

These are also configured in the `rustaceanvim` plugin file but will work for other language servers too:

- `gd`: Go to Definition
- `gr`: Go to References
- `K`: Hover to show documentation
- `<leader>rn`: Rename symbol
