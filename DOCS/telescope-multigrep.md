
# Telescope Multi-Grep

This is a custom Telescope picker that allows you to perform a multi-grep search.

## Installation

The picker is defined in `lua/custom/telescope-multigrep.lua`.

```lua
-- lua/custom/telescope-multigrep.lua
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require("telescope.config").values

local M = {}

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or (vim.uv or vim.loop).cwd()

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      -- Split on any whitespace instead of requiring double space
      local pieces = vim.split(prompt, "%s+")
      local args = { "rg" }

      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end
      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

M.setup = function()
  vim.keymap.set("n", "<leader>fm", live_multigrep, { desc = "Multi Grep" })
end

return M
```

## Keybindings

- **Normal Mode:**
  - `<leader>fm`: Opens the multi-grep picker.

## Usage

When the picker is open, you can type a search term and a file pattern separated by a space.

For example, to search for the term `my_function` in all `*.lua` files, you would type:

```
my_function *.lua
```
