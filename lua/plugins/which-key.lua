return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = { spelling = true },
      icons = { breadcrumb = "»", separator = "➜", group = "+" },
      win = { border = "rounded" },
    })

    -- Normal mode mappings
    wk.register({
      ["<leader>w"] = { ":w<cr>", "Save file" },
      ["<leader>c"] = { ":bd<cr>", "Close buffer" },
      ["<leader>q"] = { ":q<cr>", "Quit Neovim" },
      ["<leader>e"] = { ":Neotree toggle<cr>", "Neo filesystem" },
      ["<leader>b"] = { ":Telescope buffers<cr>", "Buffers" },
    }, { mode = "n" })

    -- Telescope group
    wk.register({
      f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        n = { "<cmd>Telescope notify<cr>", "Notification History" },
      },
    }, { prefix = "<leader>", mode = "n" })

    -- Lazy.nvim group
    wk.register({
      l = {
        name = "Lazy",
        s = { "<cmd>Lazy sync<cr>", "Sync plugins" },
        u = { "<cmd>Lazy update<cr>", "Update plugins" },
        h = { "<cmd>Lazy health<cr>", "Health check" },
      },
    }, { prefix = "<leader>", mode = "n" })

    -- VimTeX / LaTeX group
    wk.register({
      L = {
        name = "LaTeX",
        r = { "<cmd>VimtexCompile<cr>", "Run/Compile" },
        v = { "<cmd>VimtexView<cr>", "View PDF" },
        s = { "<cmd>VimtexStop<cr>", "Stop Compilation" },
        c = { "<cmd>VimtexClean<cr>", "Clean" },
        t = { "<cmd>VimtexTocToggle<cr>", "Toggle ToC" },
        i = { "<cmd>VimtexInfo<cr>", "Info" },
      },
    }, { prefix = "<leader>", mode = "n" })

    -- Format group
    wk.register({
      C = {
        name = "Format",
        f = { function() require("conform").format({ async = true, lsp_fallback = true }) end, "Format File" },
      }
    }, { prefix = "<leader>", mode = "n" })

    wk.register({
      C = {
        name = "Format",
        f = { function() require("conform").format({ async = true, lsp_fallback = true }) end, "Format File" },
      }
    }, { prefix = "<leader>", mode = "v" })

    -- CodeSnap group
    wk.register({
      s = {
        name = "Snapshot",
        c = { ":'<,'>CodeSnap<CR>", "Copy Snapshot to Clipboard" },
        s = { ":'<,'>CodeSnapSave<CR>", "Save Snapshot to Disk" },
      },
    }, { prefix = "<leader>", mode = "v" })
  end,
  lazy = false,
}