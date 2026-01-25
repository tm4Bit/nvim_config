local M = {}

-- This table holds the configurations for each LSP server.
-- Keys are server names (as used by nvim-lspconfig).
-- Values are tables containing the specific options for that server.
M.configurations = {
  clangd = {},
  jdtls = {},
  lua_ls = require "utils.lsp.configs.lua_lsp",
  eslint = require "utils.lsp.configs.eslint_lsp",
  ts_ls = require "utils.lsp.configs.ts_lsp",
  intelephense = require "utils.lsp.configs.php_lsp",
  cssls = {},
  html = {},
  emmet_ls = require "utils.lsp.configs.emmet_lsp",
  tailwindcss = {},
  svelte = {},
  angularls = require "utils.lsp.configs.angular_lsp",
  astro = require "utils.lsp.configs.astro_lsp",
  templ = {},
  prismals = {},
  marksman = {},
  pyright = require "utils.lsp.configs.python_lsp",
  bashls = {},
  ruby_lsp = require "utils.lsp.configs.ruby_lsp",
  jsonls = {},
  yamlls = {},
  gopls = {},
  -- For servers needing only default lspconfig behavior + your global capabilities,
  -- an empty table `{}` is sufficient, e.g., `some_other_lsp = {},`
}

-- Function to get the server configurations table
function M.get_lsp_configs()
  return M.configurations
end

-- Function to get just the list of server names (for Mason's ensure_installed)
function M.get_all_server_names()
  local names = {}

  for server_name, _ in pairs(M.configurations) do
    table.insert(names, server_name)
  end

  return names
end

return M
