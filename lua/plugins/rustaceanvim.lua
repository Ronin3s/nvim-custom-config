return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          -- Keymaps and other buffer-local settings go here
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
          end

          -- Rust-specific keymaps
          map('n', '<leader>ra', '<cmd>RustLsp codeAction<CR>', 'Rust: Code Action')
          map('n', '<leader>rr', '<cmd>RustLsp runnables<CR>', 'Rust: Runnables')
          map('n', '<leader>rt', '<cmd>RustLsp test<CR>', 'Rust: Test')
          map('n', '<leader>rd', '<cmd>RustLsp debuggables<CR>', 'Rust: Debuggables')
          map('n', '<leader>re', '<cmd>RustLsp expandMacro<CR>', 'Rust: Expand Macro')
          map('n', '<leader>rh', '<cmd>RustLsp hoverActions<CR>', 'Rust: Hover Actions')
          map('n', '<leader>rp', '<cmd>RustLsp parentModule<CR>', 'Rust: Parent Module')
          map('n', '<leader>rc', '<cmd>RustLsp openCargo<CR>', 'Rust: Open Cargo.toml')

          -- Standard LSP keymaps
          map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', 'LSP: Go to Definition')
          map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', 'LSP: Find References')
          map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'LSP: Hover Documentation')
          map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP: Rename Symbol')
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

