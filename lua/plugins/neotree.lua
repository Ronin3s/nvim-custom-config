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
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = false,
          never_show = { ".DS_Store", "thumbs.db" },
          always_show = {},
          always_show_by_pattern = {},
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        -- ✅ Fix: open Neo-tree at your current working dir, not Git root
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        bind_to_cwd = true,
        cwd_target = {
          sidebar = "global_cwd",
          current = "global_cwd",
        },
      },
    })

    -- Global keymaps
    -- vim.keymap.set("n", "<leader>e", ":Neotree toggle filesystem<CR>", { desc = "Toggle Neo-tree (filesystem)" })
    -- vim.keymap.set("n", "<leader>b", ":Neotree toggle buffers<CR>", { desc = "Toggle Neo-tree (buffers)" })

    -- 🔥 Reveal current file even if hidden
    vim.keymap.set("n", "<leader>R", function()
      local reveal_file = vim.fn.expand("%:p")
      local args = {
        source = "filesystem",
        -- position = "right",
        reveal_force_cwd = true,
        reveal_file = reveal_file,
      }
      require("neo-tree.command").execute(args)
    end, { desc = "Reveal " })
  end,
}
