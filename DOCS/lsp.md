# LSP: Language Server Protocol

This Neovim configuration uses `nvim-lspconfig` to integrate with language servers, providing features like code completion, diagnostics, and go-to-definition.

## The "Missing" Piece: Installing Language Servers

A common point of confusion is that `nvim-lspconfig` **configures** the connection to language servers, but it does **not install them**. You must install the language servers for the languages you want to use on your system separately.

### Example: Lua Language Server

In a previous step, you installed the `lua-language-server`. This was necessary because the `lua/plugins/lsp.lua` file configures Neovim to use it, but it was missing from your system.

You can install language servers using your system's package manager. For example, on a Debian/Ubuntu system, you would install the Lua language server with:

```bash
sudo apt-get install lua-language-server
```

### How it Works

1.  **Configuration**: The `lua/plugins/lsp.lua` file tells Neovim which language servers to use for which file types.
2.  **Installation**: You install the language servers on your system.
3.  **Activation**: When you open a file of a supported language, Neovim starts the corresponding language server and connects to it.

This separation of concerns allows you to manage the installation of language servers in a way that is best for your system, while keeping the Neovim configuration focused on editor integration.
