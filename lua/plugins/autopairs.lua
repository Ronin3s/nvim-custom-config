return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local npairs = require('nvim-autopairs')
    npairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        java = false,
      },
      disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
      -- The following line is for better integration with nvim-cmp,
      -- ensuring autopairs works correctly when confirming completions.
      con_check_fn = require('nvim-autopairs.utils').cmp_con_check,
    })

    -- nvim-cmp integration
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}