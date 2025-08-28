
# Comment Plugin

This plugin provides functionality for commenting and uncommenting code.

## Installation

The plugin is installed using `lazy.nvim`.

```lua
-- File: lua/plugins/comment.lua
return {
  "numToStr/Comment.nvim",
  lazy = false,  -- load immediately
  config = function()
    -- Minimal setup for the plugin
    require("Comment").setup()

    -- Normal mode: toggle comment on current line
    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, { noremap = true, silent = true, desc = "Toggle comment line" })

    -- Visual mode: toggle comment on selected lines
    vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { noremap = true, silent = true, desc = "Toggle comment block" })
  end,
}
```

## Keybindings

- **Normal Mode:**
  - `<leader>/`: Toggles a comment on the current line.

- **Visual Mode:**
  - `<leader>/`: Toggles comments on the selected lines.
