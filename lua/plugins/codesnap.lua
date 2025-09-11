return {
  'mistricky/codesnap.nvim',
  build = 'make',
  cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapCopy' },
  opts = {
    bg_x_padding = 122,
    bg_y_padding = 82,
    bg_padding = nil,
    watermark = 'Ronin3S',
    has_line_number = true,
    code_font_family = "JetBrainsMono Nerd Font",
    mac_window_bar = true,
    bg_theme = "grape",
    title = 'Code Snippet',
    show_breadcrumbs = true,
    save_path = '/home/ronin/CodeSnap',
  },
  config = function(_, opts)
    local codesnap = require("codesnap")
    codesnap.setup(opts)

    vim.api.nvim_create_user_command("CodeSnapCopy", function()
      codesnap.copy_into_clipboard()
    end, { range = true })

    vim.api.nvim_create_user_command("CodeSnapSave", function()
      codesnap.save_snapshot()
    end, { range = true })
  end,
}
