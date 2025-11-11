return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        cmd = function()
          local cargo_bin = vim.fn.expand('~/.cargo/bin/rust-analyzer')
          if vim.fn.filereadable(cargo_bin) == 1 then
            return { cargo_bin }
          end
          return { 'rust-analyzer' }
        end,

        on_attach = function(client, bufnr)
          -- Only rust-analyzer diagnostics
          vim.diagnostic.config({
            virtual_text = {
              prefix = '●',
              source = true,
            },
            signs = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
              focusable = false,
              style = "minimal",
              border = "rounded",
              source = "always",
              header = "",
              prefix = "",
            },
          })

          -- LSP Keymaps (the global ones from lsp.lua will be used for the standard keys)
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
          end

          -- Rust tools
          local Terminal = require('toggleterm.terminal').Terminal
          local rust_runner = Terminal:new({
            cmd = "",
            direction = "float",
          })

          map('n', '<leader>ra', '<cmd>RustLsp codeAction<CR>', 'Rust Code Action')
          map('n', '<leader>rr', '<cmd>RustLsp runnables<CR>', 'Rust Runnables')
          map('n', '<leader>rt', '<cmd>Cargo test<CR>', 'Rust Test')
          map('n', '<leader>rd', '<cmd>RustLsp debuggables<CR>', 'Rust Debuggables')
          map('n', '<leader>re', '<cmd>RustLsp expandMacro<CR>', 'Rust Expand Macro')
          map('n', '<leader>rh', '<cmd>RustLsp hoverActions<CR>', 'Rust Hover Actions')
          map('n', '<leader>rp', '<cmd>RustLsp parentModule<CR>', 'Rust Parent Module')
          map('n', '<leader>rc', '<cmd>RustLsp openCargo<CR>', 'Open Cargo.toml')
          vim.keymap.set('n', '<leader>rR', function()
            local file = vim.fn.expand('%')
            local exe = vim.fn.expand('%:r')
            rust_runner.cmd = string.format('rustc "%s" && "./%s"', file, exe)
            rust_runner:open()
          end, { silent = true, buffer = bufnr, desc = 'Rust: Compile & Run Single File' })
        end,

        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = false,
              buildScripts = { enable = true },
            },
            check = {
              command = "clippy", -- use only rust-analyzer checks (no cargo/rustc duplication)
            },
            diagnostics = {
              disabled = { "unresolved-proc-macro" },
            },
          },
        },
      },

      -- Disable automatic cargo/rustc checks to prevent duplicate diagnostics
      -- tools = {
      --   executor = "termopen",
      --   reload_workspace_from_cargo_toml = true,
      --   enable_clippy = false,
      --   runnables = { use_telescope = true },
      --   checkOnSave = false, -- important: stop extra cargo runs
      -- },
      tools = nil,

      dap = {},
    }
  end,
}
