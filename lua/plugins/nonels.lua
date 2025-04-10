local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
}

function M.config()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    return
  end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      -- require("none-ls.diagnostics.eslint_d").with {
      --   condition = function(utils)
      --     return utils.root_has_file { ".eslintrc.json", ".eslintrc.js", "eslint.config.js" }
      --   end,
      -- },
      -- require("none-ls.formatting.eslint_d").with {
      --   condition = function(utils)
      --     return utils.root_has_file { ".eslintrc.json", ".eslintrc.js", "eslint.config.js" }
      --   end,
      -- },
      formatting.prettierd.with {
        extra_filetypes = { "toml", "astro", "blade" },
      },
      -- formatting.blade_formatter,

      -- Lua
      formatting.stylua,

      -- Php
      formatting.phpcsfixer,

      -- Golang
      formatting.gofumpt,
      formatting.goimports,
      diagnostics.golangci_lint,

      -- Python
      formatting.black.with { extra_args = { "--fast" } },
      require "none-ls.diagnostics.flake8",
    },
  }
end

return M
