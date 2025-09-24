return {
  "catppuccin/nvim",
  name = "catppuccin", -- so lazy.nvim recognizes it
  enabled = true,
  priority = 1000,     -- load before other plugins
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      integrations = {
        lualine = true,
        neotree = true,
      },
    })

    -- set colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
