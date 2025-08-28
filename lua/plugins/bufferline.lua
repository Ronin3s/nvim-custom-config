return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",   -- show LSP diagnostics in tabs
        separator_style = "slant",  -- nice slanted separators
        show_close_icon = false,
        show_buffer_close_icons = true,
        always_show_bufferline = true,

        -- 👇 This is the important part to avoid overlapping Neo-tree
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer", -- text to show at the top of Neo-tree
            highlight = "Directory",
            text_align = "left",
            separator = true, -- adds a separator line between Neo-tree and buffers
          },
        },
      },
    })
  end,
}
