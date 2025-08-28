
# Project Plugin

This plugin provides project management functionalities.

## Installation

The plugin is installed using `lazy.nvim`.

```lua
-- File: lua/plugins/project.lua
return {
  "ahmedkhalf/project.nvim",
  event = "VimEnter",
  config = function()
    require("project_nvim").setup({
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "Makefile", "package.json", "pyproject.toml", "go.mod" },
      show_hidden = true,
      silent_chdir = true,
      datapath = vim.fn.stdpath("data"),
    })
    require("telescope").load_extension("projects")
  end
}
```

## Features

- **Project Detection:** Automatically detects projects based on `lsp` and `pattern` methods.
- **Telescope Integration:** Integrates with `telescope.nvim` to provide a list of projects that can be easily switched between.
