local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
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
      auto_trigger = false,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = "<C-Down>",
        accept_word = "<C-Up>",
        accept_line = "<C-Right>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
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
