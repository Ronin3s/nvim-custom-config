# Rust Development in Neovim

This guide provides an overview of how to use your Neovim configuration for Rust development, powered by the `rustaceanvim` plugin and `rust-analyzer`.

## How to Compile and Run Rust Code

There are two main ways to run Rust code, depending on whether you are working on a single file or a full Cargo project.

### Method 1: Single File (using `rustc`)

For quick experiments and single files (like `main.rs` without a `Cargo.toml`), you can compile and run directly. The keymap `<leader>rR` has been added to do this automatically for the current file.

### Method 2: Cargo Projects

For any project with multiple files or dependencies, you should use `cargo`, Rust's build tool.

1.  **Create a Project**: Start a new project with `cargo new my_project`.
2.  **Run with `rustaceanvim`**: Inside a cargo project, press `<leader>rr` to open a list of "runnables" (e.g., run the main binary, run examples). Select an option and press Enter to run it.

---

## Keymaps Cheatsheet

The `<leader>` key is `space`. These keymaps are available in Rust files.

### Rust-Specific Keymaps

| Key | Action | Description |
| :--- | :--- | :--- |
| `<leader>rR` | Run Single File | Compiles and runs the current file in a floating terminal. |
| `<leader>rr` | Runnables | **(Most Used)** Run the app, tests, or examples for a Cargo project. |
| `<leader>rt` | Test | Run the test at the current cursor position. |
| `<leader>ra` | Rust Code Action | Show Rust-specific code actions. |
| `<leader>rh` | Hover Actions | Show actions related to the hover popup. |
| `<leader>rc` | Open Cargo.toml | Quickly open the `Cargo.toml` for your project. |
| `<leader>re` | Expand Macro | Show the code that a macro expands to. |
| `<leader>rd` | Debuggables | Show and debug binaries/tests. |
| `<leader>rp` | Parent Module | Go to the parent module. |

### General LSP Keymaps

| Key | Action | Description |
| :--- | :--- | :--- |
| `K` | Hover | Show documentation for the symbol under the cursor. |
| `gd` | Go to Definition | Jump to where the symbol is defined. |
| `gr` | Find References | Show all places where the symbol is used. |
| `gi` | Go to Implementation | Jump to the implementation of a trait. |
| `gD` | Go to Declaration | Jump to the declaration of a symbol. |
| `gt` | Go to Type Definition | Jump to the type definition of a symbol. |
| `<leader>ca` | Code Action | Show a list of actions (e.g., fix error, refactor). |
| `<leader>rn` | Rename | Rename the symbol under the cursor across the project. |
| `<leader>f` | Format | Format the current file. |
| `[d` / `]d` | Diagnostics | Go to the previous/next error or warning. |

---

## A Simple Learning Workflow

1.  **Write Code**: Start writing your Rust code in a `.rs` file.
2.  **Get Hints**: As you type, `rust-analyzer` provides completions. When you save, `clippy` automatically checks your code.
3.  **Navigate Errors**: Use `]d` and `[d` to jump between errors and warnings.
4.  **Understand the Code**: Don't recognize something? Move your cursor over it and press `K` to read its documentation.
5.  **Get Fixes**: See a warning? Move your cursor to it and press `<leader>ca`. The LSP might offer an automatic fix.
6.  **Run Your Code**:
    *   For a single file, press `<leader>rR`.
    *   For a Cargo project, press `<leader>rr` and select `Run`.

---

## Configuration

The configuration for `rustaceanvim` is located in `lua/plugins/rustaceanvim.lua`.

- It automatically configures and starts the `rust-analyzer` language server.
- It is configured to use `clippy` for linting on save.

## Debugging (DAP)

Debugging for Rust is configured using `nvim-dap` with `codelldb`.

### Setup

1.  **Restart Neovim**: This will allow `lazy.nvim` to install the `nvim-dap`, `nvim-dap-ui`, `nvim-dap-virtual-text`, and `nvim-nio` plugins.
2.  **Install `codelldb`**: Ensure `codelldb` is installed via Mason. You can check by running `:Mason` and looking for `codelldb`. If not installed, run `:MasonInstall codelldb`.

### Usage

*   **Set Breakpoint**: Move your cursor to a line and press `<leader>b`.
*   **Launch Debug Session**: 
    *   Build your project first (e.g., `cargo build`).
    *   Run `:DapLaunch` and select a configuration (e.g., "Launch file" or "Launch current file").
*   **Control Debugging**:
    *   `<F5>`: Continue/Resume
    *   `<F10>`: Step Over
    *   `<F11>`: Step Into
    *   `<F12>`: Step Out
    *   `<leader>B`: Set Conditional Breakpoint
    *   `<leader>lp`: Set Logpoint
    *   `<leader>dr`: Toggle Debug REPL
    *   `<leader>dl`: Run Last Debug Session
    *   `<leader>ui`: Toggle DAP UI panels

---

## Keymaps Cheatsheet