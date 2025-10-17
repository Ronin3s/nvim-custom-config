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
    },
    config = function()
      -- Capabilities for completion
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- List of servers
      local servers = {
        "lua_ls",
        "bashls",
        "texlab",
        "tinymist", -- Typst LSP
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
