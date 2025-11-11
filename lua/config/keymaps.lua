-- lua/config/keymaps.lua
-- Better window navigation with Ctrl + h/j/k/l
-- Cycle through windows with Ctrl-h / Ctrl-l
-- vim.keymap.set("n", "<C-l>", "<C-w>w", { desc = "Go to next window" })
-- vim.keymap.set("n", "<C-h>", "<C-w>W", { desc = "Go to previous window" })

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

-- -- Search/Find keymaps
-- vim.keymap.set("n", "<leader>sw", function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") }) end, { desc = "Search word under cursor" })
-- vim.keymap.set("n", "<leader>sf", function() require("telescope.builtin").current_buffer_fuzzy_find() end, { desc = "Search in current file" })
-- vim.keymap.set("n", "<leader>sg", function() require("telescope.builtin").live_grep() end, { desc = "Global grep search" })
--
-- Format current file with conform.nvim
-- vim.keymap.set({"n", "v"}, "<leader>Cf", function()
--   require("conform").format({ async = true, lsp_fallback = true })
-- end, { desc = "Format file" })

-- Temporary debug keymap
-- vim.keymap.set("n", "<leader>di", function()
--   print("--- Active LSP Clients ---")
--   local clients = vim.lsp.get_clients({ bufnr = 0 })
--   if #clients == 0 then
--     print("None")
--   end
--   for _, client in ipairs(clients) do
--     print(string.format("- %s (id: %d)", client.name, client.id))
--   end
--
--   print("\n--- Diagnostics for current buffer ---")
--   local diagnostics = vim.diagnostic.get(0)
--   if #diagnostics == 0 then
--     print("None")
--   end
--   for i, diag in ipairs(diagnostics) do
--     print(string.format("%d. [%s] %s", i, diag.source or "unknown", diag.message))
--   end
-- end, { desc = "Debug: Show LSP clients and diagnostics" })

-- Debug: Show diagnostic info (useful for debugging duplicates)
-- vim.keymap.set("n", "<leader>dd", function()
--   local clients = vim.lsp.get_clients()
--   print("=== Active LSP Clients ===")
--   for _, client in ipairs(clients) do
--     print(string.format("  - %s (id: %d)", client.name, client.id))
--   end
--
--   local diagnostics = vim.diagnostic.get(0)
--   local by_line = {}
--
--   for _, diag in ipairs(diagnostics) do
--     local line = diag.lnum + 1
--     if not by_line[line] then by_line[line] = {} end
--     table.insert(by_line[line], {
--       source = diag.source or "unknown",
--       message = diag.message:sub(1, 60)
--     })
--   end
--
--   print("\n=== Lines with multiple diagnostics ===")
--   for line, diags in pairs(by_line) do
--     if #diags > 1 then
--       print(string.format("Line %d (%d diagnostics):", line, #diags))
--       for i, d in ipairs(diags) do
--         print(string.format("  %d. [%s] %s", i, d.source, d.message))
--       end
--     end
--   end
-- end, { desc = "Debug: Show diagnostic sources" })
