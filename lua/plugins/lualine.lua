return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { -- Use 'opts' instead of 'config' for lazy.nvim
    options = {
      theme = "auto",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "dashboard", "alpha", "starter" }
      },
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        {
          function()
            if vim.bo.filetype == 'toggleterm' then
              return ' '
            end
            local filename = vim.fn.expand('%:t')
            if filename == '' then return '[No Name]' end
            local path = vim.fn.expand('%:p:h:t')
            if path ~= '' and path ~= '.' then
              return path .. '/' .. filename
            end
            return filename
          end,
          symbols = { modified = " [+ episodic]", readonly = " [-]", unnamed = "[No Name]" }
        }
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {}
    },
  }
}
