-- lua/config/options.lua
local opt = vim.opt

-- General
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.fileencoding = "utf-8"
opt.encoding = "utf-8"

-- opt.cmdheight = 0 -- hides command line unless needed (Neovim 0.8+)

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.wrap = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Tabs & Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Completion
opt.completeopt = { "menuone", "noselect" }

-- Performance
opt.updatetime = 300
opt.timeoutlen = 500

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Clipboard
opt.clipboard = "unnamedplus" -- use system clipboard
