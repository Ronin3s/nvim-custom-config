return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          -- Keymaps and other buffer-local settings go here
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            checkOnSave = {
              -- run clippy on save
              command = "clippy"
            }
          }
        }
      },
      dap = {
        -- auto discover dap configurations
      }
    }
  end,
}

