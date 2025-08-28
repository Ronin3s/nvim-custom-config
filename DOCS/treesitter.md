
# Treesitter Plugin

This plugin provides advanced syntax highlighting and other language-aware features using tree-sitter parsers.

## Installation

The plugin is installed using `lazy.nvim`.

```lua
-- File: lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- Parsers to install
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "javascript", "typescript", "rust" , "bash" },
        
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },

        -- Incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            node_decremental = "grm",
            scope_incremental = "grc",
          },
        },

        -- Text objects (select/jump functions, classes, loops)
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- jump forward to textobj
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
          },
        },

        -- Refactor support (optional)
        refactor = {
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = false },
        },
      }
    end,
  }
}
```

## Features

- **Syntax Highlighting:** Provides rich and accurate syntax highlighting.
- **Incremental Selection:** Allows for incrementally selecting larger syntax nodes.
- **Text Objects:** Provides text objects for functions, classes, loops, etc., for selection and movement.
- **Auto Installation:** Automatically installs missing parsers.
