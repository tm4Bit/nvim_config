local M = {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
  },
  opts = {
    ui = {
      border = "none",
      width = 0.8,
      height = 0.8,
      icons = {
        package_installed = "◍",
        package_pending = "◍",
        package_uninstalled = "◍",
      },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
  },
}

function M.config(_, opts)
  local status_ok, mason = pcall(require, "mason")
  if not status_ok then
    return
  end
	local servers = require("utils.servers").servers

  mason.setup(opts)
  require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_installation = true,
  }
end

return M
