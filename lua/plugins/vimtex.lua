return {
  "lervag/vimtex",
  lazy = false, -- Vimtex is a filetype plugin and manages its own loading.
  init = function()
    -- Set global options here
    vim.g.vimtex_view_method = "sioyek"
    vim.g.vimtex_view_general_viewer = "okular"
    vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
    vim.g.vimtex_quickfix_method = "latexlog"
    vim.g.vimtex_scan_recurse = 1
  end,
}
