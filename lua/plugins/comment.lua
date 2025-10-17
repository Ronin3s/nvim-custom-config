-- File: lua/plugins/comment.lua
return {
  "numToStr/Comment.nvim",
  keys = {
    { "<leader>/", mode = "n", desc = "Toggle comment line" },
    { "<leader>/", mode = "v", desc = "Toggle comment block" },
  },
  config = function()
    -- Minimal setup for the plugin
    require("Comment").setup()

    -- Normal mode: toggle comment on current line
    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, { noremap = true, silent = true, desc = "Toggle comment line" })

    -- Visual mode: toggle comment on selected lines
    vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { noremap = true, silent = true, desc = "Toggle comment block" })
  end,
}
