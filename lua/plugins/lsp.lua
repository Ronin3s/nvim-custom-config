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
      -- Add Mason and its lspconfig bridge
      {
        "williamboman/mason.nvim",
        config = function()
          -- Tell Mason to install formatters
          require("mason").setup({
            ensure_installed = {
              "stylua",
              "shfmt",
            },
            PATH = "prepend",
          })
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      -- Load completion capabilities
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Define the list of servers to be managed by Mason
      local servers = {
        "lua_ls",
        "bashls",
      }

      -- Configure mason-lspconfig to ensure servers are installed
      -- and to set up the handlers.
      require('mason-lspconfig').setup({
        ensure_installed = servers,
        handlers = {
          -- The default handler for each server
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities,
            }
          end,
        }
      })

      -- The old formatting autocmd has been removed.
      -- conform.nvim now handles formatting.
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