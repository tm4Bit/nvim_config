local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
}

M.config = function()
  require("copilot").setup {
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "bottom", -- | top | left | right | horizontal | vertical
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = true,
      debounce = 15,
      trigger_on_accept = true,
      keymap = {
        accept = "<C-Down>",
        accept_word = "<C-Up>",
        accept_line = "<C-Right>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    nes = {
      enabled = false, -- requires copilot-lsp as a dependency
      auto_trigger = true,
      keymap = {
        accept_and_goto = "<C-Left>",
        accept = false,
        dismiss = false,
      },
    },
    auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"
    logger = {
      file = vim.fn.stdpath "log" .. "/copilot-lua.log",
      file_log_level = vim.log.levels.OFF,
      print_log_level = vim.log.levels.WARN,
      trace_lsp = "off", -- "off" | "debug" | "verbose"
      trace_lsp_progress = false,
      log_lsp_messages = false,
    },
    workspace_folders = {},
    copilot_model = "",
    disable_limit_reached_message = false,
    filetypes = {
      yaml = false,
      markdown = true,
      help = false,
      gitcommit = true,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 18.x
    server_opts_overrides = {},
  }

  -- keymaps
  local map = require("utils.map").map
  map("n", "<localleader>tc", function()
    if not vim.g.copilot_auto_trigger then
      Snacks.notify "Copilot auto suggestion ON!"
      vim.g.copilot_auto_trigger = true
    else
      Snacks.notify "Copilot auto suggestion OFF!"
      vim.g.copilot_auto_trigger = false
    end
    require("copilot.suggestion").toggle_auto_trigger()
  end, { desc = "[COPILOT]: Toggle auto trigger" })
end

return M
