return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- ASCII art header
    dashboard.section.header.val = {
      '██████╗  ██████╗ ███╗   ██╗██╗███╗   ██╗██████╗ ██████╗ ',
      '██╔══██╗██╔═══██╗████╗  ██║██║████╗  ██║╚════██╗██╔════╝',
      '██████╔╝██║   ██║██╔██╗ ██║██║██╔██╗ ██║ █████╔╝███████╗',
      '██╔══██╗██║   ██║██║╚██╗██║██║██║╚██╗██║ ╚═══██╗╚════██║',
      '██║  ██║╚██████╔╝██║ ╚████║██║██║ ╚████║██████╔╝███████║',
      '╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝',
      "",
      "",
      "", -- spacing
    }

    -- Shortcuts
    dashboard.section.buttons.val = {
      dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
      dashboard.button("f", "  Find Files", ":Telescope find_files<CR>"),
      dashboard.button("g", "  Live Grep", ":Telescope live_grep<CR>"),
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "  Config", ":Telescope find_files cwd=~/.config/nvim<CR>"),
      dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- MRU (recent files)
    dashboard.section.mru.val = 15

    -- Footer
    dashboard.section.footer.val = function()
      local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
      local v = vim.version()
      local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

      return {
        "",
        datetime,
        version,
        "⚡Blazing Fast  | 󰓾  Efficient  | 󰑣  Productive",
      }
    end

    dashboard.opts.layout = {
        { type = "padding", val = 1 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.mru,
        { type = "padding", val = 1 },
        dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)

    -- Quick key to open Dashboard
    vim.api.nvim_set_keymap('n', '<leader>d', ':Alpha<CR>', { noremap = true, silent = true })
  end,
}
