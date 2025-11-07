-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

-- 🔄 Auto reload Neovim config when saving files inside ~/.config/nvim
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoReload", { clear = true }),
  pattern = vim.fn.stdpath("config") .. "/lua/**/*.lua",
  callback = function(args)
    -- get the module name from the file path
    local module_name = vim.fn.fnamemodify(args.file, ":r"):gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("/", ".")
    -- unload the module
    if package.loaded[module_name] then
      package.loaded[module_name] = nil
    end
    -- reload the module
    require(module_name)
    vim.notify("Reloaded " .. module_name, vim.log.levels.INFO)
  end,
})

