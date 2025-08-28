return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local db = require('dashboard')

    -- ASCII art header
    local header = {
      '██████╗  ██████╗ ███╗   ██╗██╗███╗   ██╗██████╗ ██████╗ ',
      '██╔══██╗██╔═══██╗████╗  ██║██║████╗  ██║╚════██╗██╔════╝',
      '██████╔╝██║   ██║██╔██╗ ██║██║██╔██╗ ██║ █████╔╝███████╗',
      '██╔══██╗██║   ██║██║╚██╗██║██║██║╚██╗██║ ╚═══██╗╚════██║',
      '██║  ██║╚██████╔╝██║ ╚████║██║██║ ╚████║██████╔╝███████║',
      '╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝',
      "", "", "", -- spacing
    }

    db.setup({
      theme = 'hyper',
      config = {
        header = header,

        -- Shortcuts
        shortcut = {
          {
            icon = ' ',
            desc = 'Projects',
            group = 'Label',
            action = 'Telescope projects',
            key = 'p'
          },
          {
            icon = ' ',
            desc = 'Find Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f'
          },
          {
            icon = ' ',
            desc = 'Live Grep',
            group = 'String',
            action = 'Telescope live_grep',
            key = 'g'
          },
          {
            icon = ' ',
            desc = 'Recent Files',
            group = 'DiagnosticHint',
            action = 'Telescope oldfiles',
            key = 'r'
          },
          {
            icon = ' ',
            desc = 'Config',
            group = 'Constant',
            action = 'Telescope find_files cwd=~/.config/nvim',
            key = 'c'
          },
          {
            icon = ' ',
            desc = 'Update Plugins',
            group = 'Number',
            action = 'Lazy update',
            key = 'u'
          },
          {
            icon = ' ',
            desc = 'Quit',
            group = 'Error',
            action = 'qa',
            key = 'q'
          }
        },

        -- MRU (recent files)
        mru = {
          enable = true,
          limit = 15,
          icon = ' ',
          label = 'Recent:',
          cwd_only = false
        },

        project = { enable = false }, -- disable project section

        -- Dynamic footer (with emojis guaranteed to render)
        footer = function()
          local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
          local v = vim.version()
          local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

          return {
            "",
            datetime,
            version,
            "⚡Blazing Fast  | 󰓾  Efficient  | 󰑣  Productive"
          }
        end,
      },

      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },

      preview = {
        file_path = nil,
        file_height = 12,
        file_width = 80,
      }
    })

    -- Quick key to open Dashboard
    vim.api.nvim_set_keymap('n', '<leader>d', ':Dashboard<CR>', { noremap = true, silent = true })
  end
}
