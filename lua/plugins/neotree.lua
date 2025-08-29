return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    require("neo-tree").setup({
      window = {
        width = 25,
        position = "left",
        popup = {
          size = { height = "80%", width = "50%" },
          position = "50%",
        },
        mappings = {
          ["l"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          -- 🔥 شيلنا الـ "H" عشان مايبقاش فيه toggle hidden
        },
      },

      source_selector = {
        winbar = true,
        statusline = false,
        content_layout = "center",
        tabs_layout = "equal",
      },

      sources = { "filesystem", "buffers" },

      filesystem = {
        filtered_items = {
          hide_dotfiles = true, -- dotfiles always hidden
          hide_gitignored = true,
          hide_hidden = false,
          never_show = { ".DS_Store", "thumbs.db" },
          always_show = {},
          always_show_by_pattern = {}, -- مهم: سيبها فاضية
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
    })

    -- Global keymaps
    vim.keymap.set("n", "<leader>e", ":Neotree toggle filesystem<CR>", { desc = "Toggle Neo-tree (filesystem)" })
    vim.keymap.set("n", "<leader>b", ":Neotree toggle buffers<CR>", { desc = "Toggle Neo-tree (buffers)" })

    -- 🔥 Reveal current file even if hidden
    vim.keymap.set("n", "<leader>r", function()
      local reveal_file = vim.fn.expand("%:p")
      local args = {
        source = "filesystem",
        position = "left",
        reveal_force_cwd = true,
        reveal_file = reveal_file,
      }
      require("neo-tree.command").execute(args)
    end, { desc = "Reveal " })
  end,
}
