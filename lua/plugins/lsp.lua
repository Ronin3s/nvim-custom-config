return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      -- Mason (LSP/DAP/Formatter manager)
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup({
            ensure_installed = {
              "stylua", -- Lua formatter
              "shfmt",  -- Shell formatter
              "codelldb",
            },
            PATH = "prepend",
          })
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },
      -- nvim-dap for debugging
      "mfussenegger/nvim-dap",
    },
    config = function()
      -- Capabilities for completion
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Deduplicate diagnostics at the handler level
      local original_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        function(err, result, ctx, config)
          -- Deduplicate diagnostics in result before processing
          if result and result.diagnostics then
            local seen = {}
            local unique = {}
            for _, diag in ipairs(result.diagnostics) do
              local key = string.format("%d:%d:%s:%s",
                diag.range.start.line,
                diag.range.start.character,
                diag.message,
                diag.code or "")
              if not seen[key] then
                seen[key] = true
                table.insert(unique, diag)
              end
            end
            result.diagnostics = unique
          end
          -- Call original handler with deduplicated diagnostics
          original_handler(err, result, ctx, config)
        end,
        {}
      )

      local servers = {
        "lua_ls",
        "bashls",
        "texlab",
        "tinymist",      -- Typst LSP
      }

      require('mason-lspconfig').setup({
        ensure_installed = servers,
        handlers = {
          -- Default handler for each server
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities,
            }
          end,
          -- Tinymist custom setup
          ["tinymist"] = function()
            require("lspconfig").tinymist.setup {
              capabilities = capabilities,
              settings = {
                exportPdf = "never", -- أو "onSave" لو عايز يعمل PDF كل save
              },
            }
          end,
        }
      })

      -- Standard LSP keymaps
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
      end

      map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', 'LSP: Go to Definition')
      map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', 'LSP: Go to Declaration')
      map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', 'LSP: Go to Implementation')
      map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'LSP: Go to Type Definition')
      map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', 'LSP: Find References')
      map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'LSP: Hover Documentation')
      map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP: Rename Symbol')
      map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'LSP: Code Action')
      map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', 'LSP: Format Document')
      map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Go to previous diagnostic')
      map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Go to next diagnostic')
    end,
  },

  -- Completion + Snippets
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true }
    },
  },
}
