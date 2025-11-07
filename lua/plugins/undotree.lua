-- File: lua/plugins/undotree.lua
return {
  "jiaoshijie/undotree",
  config = function()
    require("undotree").setup({
      float_diff = true,
      window = {
        winblend = 30,
        border = "rounded",
      },
    })
  end,
  keys = {
    { "<leader>u", function() require("undotree").toggle() end, desc = "Toggle UndoTree" },
  },
}