local M = {
  "stevearc/conform.nvim",
  opts = {},
}

M.config = function()
  local conform = require "conform"
  conform.setup {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "black" },
      -- Conform will run the first available formatter
      javascript = { "prettierd", stop_after_first = true },
      typescript = { "prettierd", stop_after_first = true },
      html = { "prettierd", stop_after_first = true },
      css = { "prettierd", stop_after_first = true },
      scss = { "prettierd", stop_after_first = true },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  }
end

return M
