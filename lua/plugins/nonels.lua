local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvimtools/none-ls-extras.nvim" }
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
      require("none-ls.diagnostics.eslint_d").with {
        condition = function(utils)
          return utils.root_has_file { ".eslintrc.json", ".eslintrc.js" }
        end,
      },
      require("none-ls.formatting.eslint_d").with {
        condition = function(utils)
          return utils.root_has_file { ".eslintrc.json", ".eslintrc.js" }
        end,
      },
      formatting.prettierd.with {
        extra_filetypes = { "toml", "astro" },
        -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        condition = function(utils)
          return utils.root_has_file {  ".prettierrc.json", ".prettierrc" }
        end,
      },

      -- diagnostics.selene,
      formatting.stylua,
      formatting.gofumpt,
      formatting.goimports,
      diagnostics.golangci_lint,

      formatting.black.with { extra_args = { "--fast" } },
      require("none-ls.diagnostics.flake8"),
    },
  }
end

return M
