local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  -- config = function()
  --   local highlight = {
  --     "IndentBlanklineIndent1",
  --     "IndentBlanklineIndent2",
  --     "IndentBlanklineIndent3",
  --     "IndentBlanklineIndent4",
  --     "IndentBlanklineIndent5",
  --   }
  --   local hooks = require "ibl.hooks"
  --   hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  --     vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#282828" })
  --     vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#4b4b4b" })
  --     vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { bg = "#858585" })
  --     vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { bg = "#d1ccf1" })
  --     vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { bg = "#bea17f" })
  --   end)
  --   require("ibl").setup {
  --     indent = { highlight = highlight, char = "" },
  --     whitespace = {
  --       highlight = highlight,
  --       remove_blankline_trail = false,
  --     },
  --     scope = { enabled = false },
  --   }
  -- end,
  config = function()
    require("ibl").setup {}
  end,
}

return M
