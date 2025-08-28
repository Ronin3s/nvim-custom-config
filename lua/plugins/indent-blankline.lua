return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
  config = function()
    require("ibl").setup({
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "trouble",
          "lazy",
          "mason",
          "terminal",
          "toggleterm",
        },
        buftypes = { "terminal" },
      },
      scope = { enabled = false },
    })
  end,
}
