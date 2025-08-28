-- ===============================
-- Notification filters
-- ===============================
local orig_notify = vim.notify
vim.notify = function(msg, level, opts)
  -- Ignore which-key warnings
  if msg:match("which%-key") and level == vim.log.levels.WARN then
    return
  end
  -- Ignore LSP deprecation warnings
  if msg:match("vim%.lsp%.buf_get_clients") and level == vim.log.levels.WARN then
    return
  end
  -- Otherwise show normally
  orig_notify(msg, level, opts)
end

-- ===============================
-- Load your configuration
-- ===============================
-- Load general options first
require("config.options")

-- Load plugin manager and plugins
require("config.lazy")

-- Load keymaps
require("config.keymaps")

-- Load autocommands
require("config.autocmds")
