return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal", -- bottom split
      size = 15,
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,
      float_opts = {
        border = "curved",
      },
    })

    -- Toggle terminal with <leader>tt
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

    -- Exit insert mode in terminal with Ctrl-Shift-n
    vim.keymap.set("t", "<C-n>", [[<C-\><C-n>]], { desc = "Terminal Normal Mode" })

    -- Lazygit terminal
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
    })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>",
      { noremap = true, silent = true, desc = "Toggle lazygit" })

    -- Which-key group for terminal
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.register({
        t = {
          name = "+terminal",
          t = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },
          g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        },
      }, { prefix = "<leader>" })
    end
  end,
}
