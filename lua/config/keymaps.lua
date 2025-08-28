-- lua/config/keymaps.lua
-- Better window navigation with Ctrl + h/j/k/l
-- Cycle through windows with Ctrl-h / Ctrl-l
vim.keymap.set("n", "<C-l>", "<C-w>w", { desc = "Go to next window" })
vim.keymap.set("n", "<C-h>", "<C-w>W", { desc = "Go to previous window" })

-- Save current file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Close current buffer
vim.keymap.set("n", "<leader>c", ":bd<CR>", { desc = "Close buffer" })

-- Quit Neovim
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Quit Neovim" })

-- Force close current window without saving
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force close" })

-- Navigate buffers like tabs
-- Press <Tab> in normal mode to go to the next buffer
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- Press <Shift-Tab> in normal mode to go to the previous buffer
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

