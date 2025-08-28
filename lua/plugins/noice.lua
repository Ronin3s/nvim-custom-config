return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    -- Cmdline popup at bottom center
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      opts = {
        position = { row = "95%", col = "50%" },
        size = { width = "60%", height = "auto" },
      },
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = { icon = "󰥻" },
      },
    },

    -- Messages
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext",
    },

    -- Popupmenu
    popupmenu = {
      enabled = true,
      backend = "nui",
      kind_icons = {},
    },

    -- LSP
    lsp = {
      progress = {
        enabled = true,
        format = "lsp_progress",
        format_done = "lsp_progress_done",
        throttle = 1000 / 30,
        view = "mini",
      },
      hover = { enabled = true, silent = false, view = "hover", opts = {} },
      signature = {
        enabled = true,
        auto_open = { enabled = true, trigger = true, luasnip = true, throttle = 50 },
        view = nil,
        opts = {},
      },
      message = { enabled = true, view = "notify", opts = {} },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },

    -- Notify
    notify = { enabled = true, view = "notify" },

    -- Presets
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },

    -- Views
    views = {
      cmdline_popup = {
        position = { row = "95%", col = "50%" },
        size = { width = "60%", height = "auto" },
        border = { style = "rounded", padding = { 0, 1 } },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder",
            CursorLine = "Visual",
            Search = "None",
          },
        },
      },
    },

    -- Routes
    routes = {
      -- Show search count in cmdline popup
      {
        filter = { event = "msg_show", kind = "search_count" },
        view = "cmdline_popup",
      },
      -- Skip other unnecessary long search messages
      {
        filter = { event = "msg_show", min_height = 10 },
        view = "split",
      },
      -- Skip certain routine messages
      {
        filter = { event = "msg_show", kind = "echo" },
        opts = { skip = true },
      },
    },
  },
}
