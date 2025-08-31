# VimTeX

This plugin provides a comprehensive and modern environment for editing LaTeX files within Neovim.

## Configuration

The main configuration for `VimTeX` is located in `lua/plugins/vimtex.lua`.

- **Viewer**: It is configured to use `zathura` as the PDF viewer.
- **Compiler**: It uses `latexmk` as the default compiler, which automates the build process.
- **Lazy Loading**: The plugin is set to `lazy = false` to ensure all features, like inverse search from the PDF viewer, work correctly.

## Language Server (LSP)

For features like diagnostics (errors and warnings) and better autocompletion, the `texlab` language server is used.

- It is configured in `lua/plugins/lsp.lua` and will be automatically installed by `mason.nvim`.
- **Important**: You must have a working LaTeX distribution (like TeX Live, MiKTeX) installed on your system for `VimTeX` and `texlab` to function.

## Keybindings

A dedicated menu for LaTeX commands has been created using `which-key`.

- **Prefix**: Press `<leader>L` (Space, then Shift+L) in normal mode to open the LaTeX menu.

From this menu, you can use the following keys:

- `r`: **Run/Compile** the document to generate the PDF.
- `v`: **View** the generated PDF, with automatic refresh.
- `s`: **Stop** the current compilation process.
- `c`: **Clean** up auxiliary files created during compilation.
- `t`: **Toggle** the table of contents for quick navigation.
- `i`: Show **Info** and statistics about the document.
