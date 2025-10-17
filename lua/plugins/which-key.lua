return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = { spelling = true },
      icons = { breadcrumb = "»", separator = "➜", group = "+" },
      win = { border = "rounded" },
    })

    -- Load ToggleTerm API
    local Terminal    = require("toggleterm.terminal").Terminal

    -- تعريف terminal خاص بـ Typst Watch (bottom split)
    local typst_watch = Terminal:new({
      hidden = true,
      direction = "horizontal", -- bottom split
      close_on_exit = false,
      auto_scroll = true,
      size = 15, -- ارتفاع الـ terminal بالأسطر
    })

    -- Typst which-key group
    local typst_keys  = {
      T = {
        name = "Typst",

        -- Compile once
        c = { function()
          local input_file = vim.fn.expand("%:p")
          local output_file = vim.fn.expand("%:p:r") .. ".pdf"

          if input_file == "" then
            print("⚠️ Save the file first! Typst needs a valid input file.")
            return
          end

          vim.cmd(string.format(':!typst c "%s" "%s"<CR>', input_file, output_file))
        end, "Compile" },

        -- Open PDF in Sioyek
        o = { function()
          local output_file = vim.fn.expand("%:p:r") .. ".pdf"
          vim.fn.jobstart({ "sioyek", output_file }, { detach = true })
        end, "Open PDF" },

        -- Watch with ToggleTerm
        w = { function()
          local input_file = vim.fn.expand("%:p")
          local output_file = vim.fn.expand("%:p:r") .. ".pdf"

          if input_file == "" then
            print("⚠️ Save the file first before watching!")
            return
          end

          typst_watch.cmd = string.format('typst w "%s" "%s"', input_file, output_file)
          typst_watch:toggle()
        end, "Watch" },

        -- Close terminal buffer (if needed)
        q = { ":bd!<CR>", "Quit Watch" },

        -- Format file using conform.nvim
        f = { function()
          require("conform").format({ async = true, lsp_fallback = true })
        end, "Format" },
      },
    }

    wk.register(typst_keys, { prefix = "<leader>" })


    -- Normal mode mappings
    wk.register({
      ["<leader>w"] = { ":w<cr>", "Save file" },
      ["<leader>c"] = { ":bd<cr>", "Close buffer" },
      ["<leader>q"] = { ":q<cr>", "Quit Neovim" },
      ["<leader>e"] = { ":Neotree toggle<cr>", "filesystem" },
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

    -- Rust group
    wk.register({
      r = {
        name = "Rust",
        a = { "<cmd>RustLsp codeAction<cr>", "Code Action" },
        r = { "<cmd>RustLsp runnables<cr>", "Run" },
        t = { "<cmd>RustLsp testables<cr>", "Test" },
        d = { "<cmd>RustLsp debuggables<cr>", "Debug" },
        e = { "<cmd>RustLsp expandMacro<cr>", "Expand Macro" },
        h = { "<cmd>RustLsp hover actions<cr>", "Hover Actions" },
        p = { "<cmd>RustLsp parentModule<cr>", "Parent Module" },
        c = { "<cmd>RustLsp openCargo<cr>", "Open Cargo.toml" },
      },
    }, { prefix = "<leader>", mode = "n" })

    -- Lazy.nvim group
    wk.register({
      L = {
        name = "Lazy",
        s = { "<cmd>Lazy sync<cr>", "Sync plugins" },
        u = { "<cmd>Lazy update<cr>", "Update plugins" },
        h = { "<cmd>Lazy health<cr>", "Health check" },
      },
    }, { prefix = "<leader>", mode = "n" })

    -- VimTeX / LaTeX group
    wk.register({
      l = {
        name = "LaTeX",
        r = { "<cmd>VimtexCompile<cr>", "Run/Compile" },
        v = { "<cmd>VimtexView<cr>", "View PDF" },
        s = { "<cmd>VimtexStop<cr>", "Stop Compilation" },
        c = { "<cmd>VimtexClean<cr>", "Clean" },
        t = { "<cmd>VimtexTocToggle<cr>", "Toggle ToC" },
        i = { "<cmd>VimtexInfo<cr>", "Info" },
        o = { ":copen<CR>", "Open quickfix" },
        x = { ":cclose<CR>", "Close quickfix" },
        w = { ":cwindow<CR>", "Toggle quickfix" },
        a = { function()
          local ls = require("luasnip"); local snippets = require("custom.snippets.latex"); ls.snip_expand(snippets[1])
        end, "Article Snippet" },
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
