return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "rcarriga/nvim-notify",
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-x>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
              -- ["<C-t>"] = require("telescope.actions").select_tab,
            },
            n = {
              ["<C-x>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
              -- ["<C-t>"] = require("telescope.actions").select_tab,
            },
          },
        },
        extensions = {
        },
      })

      -- Load extensions
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "notify")

      -- Custom multi-grep
      require("custom.telescope-multigrep").setup()
    end,
  },
}
