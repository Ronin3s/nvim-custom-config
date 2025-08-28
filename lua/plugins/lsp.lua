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
    },
    config = function()
      -- Load completion capabilities
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- List of LSP servers
      local languages = {
        "lua_ls", -- Lua
        "bashls", -- Bash
        -- "pyright",    -- Python
        -- "tsserver",   -- TypeScript/JavaScript
      }

      for _, lsp in ipairs(languages) do
        require("lspconfig")[lsp].setup {
          capabilities = capabilities,
        }
      end

      -- Auto format on save for Lua & Bash
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if vim.bo.filetype == "lua" or vim.bo.filetype == "sh" then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
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
