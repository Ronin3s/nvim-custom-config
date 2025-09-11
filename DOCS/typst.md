# Typst Support

This configuration provides a comprehensive environment for editing Typst files within Neovim, including LSP support, formatting, and a dedicated menu for compiling and viewing documents.

## Features

- **LSP**: The `tinymist` language server is configured to provide real-time diagnostics and autocompletion for Typst files.
- **Formatting**: The `typstyle` formatter is integrated with `conform.nvim` to automatically format your `.typ` files.
- **Keybindings**: A dedicated menu for Typst commands has been created using `which-key` under the prefix `<leader>T`.

## Requirements

To use this functionality, you must have the following installed on your system:

- `typst`: The Typst compiler.
- `typstyle`: The Typst formatter.
- `sioyek`: A PDF viewer (used for opening the compiled PDF).

## Keybindings

A dedicated menu for Typst commands has been created using `which-key`.

- **Prefix**: Press `<leader>T` (Space, then Shift+T) in normal mode to open the Typst menu.

From this menu, you can use the following keys:

- `c`: **Compile** the document to generate the PDF.
- `o`: **Open** the generated PDF in Sioyek.
- `w`: **Watch** the file for changes and automatically recompile.
- `q`: **Quit** the watch process.
- `f`: **Format** the file.
