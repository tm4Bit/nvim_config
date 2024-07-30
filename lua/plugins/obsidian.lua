local M = {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/obsidian_vault/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/obsidian_vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/obsidian_vault/",
      },
    },
    mappings = nil,
  },
}

return M
