return {
  "ahmedkhalf/project.nvim",
  event = "VimEnter",
  config = function()
    require("project_nvim").setup({
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "Makefile", "package.json", "pyproject.toml", "go.mod" },
      show_hidden = true,
      silent_chdir = true,
      datapath = vim.fn.stdpath("data"),
    })
    require("telescope").load_extension("projects")
  end
}

