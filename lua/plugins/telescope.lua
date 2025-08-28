-- lua/plugins/telescope.lua
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
        },
      })

      -- Load fzf extension
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "notify")

      -- Load custom multi grep module
      require("custom.telescope-multigrep").setup()
    end,
  },
}

