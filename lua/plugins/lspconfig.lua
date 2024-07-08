local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
  },
}

function M.config()
  -- lspconfig
  local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status_ok then
    return
  end
  -- cmp
  local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not cmp_nvim_lsp_status_ok then
    return
  end

  -- utils
  local get_icon = require("utils.icons").get_icon
  local servers = require("utils.servers").servers
  local on_attach = require("utils.lsp.utils").on_attach

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

  for _, server in pairs(servers) do
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    server = vim.split(server, "@")[1]

    -- create a folder `lua.settings.server_name` and return a table with the
    -- apropiate configuration
    local require_ok, conf_opts = pcall(require, "settings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    -- Jump angularls config
    if server == "angularls" then
      goto continue
    end

    -- Jump clang config
    if server == "clangd" then
      goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
  end

  -- Attach Angular LSP
  local tsLib = "/home/tma/.local/share/nvim/mason/packages/angular-language-server/node_modules"
	local ngLib = "/home/tma/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/node_modules"
  local cmd = {"ngserver", "--stdio", "--tsProbeLocations", tsLib , "--ngProbeLocations", ngLib}

  require("lspconfig").angularls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = cmd,
    on_new_config = function(new_config,new_root_dir)
			-- new_config.cmd = cmd
      new_config.cmd = {
				"ngserver",
				"--stdio",
				"--tsProbeLocations",
				-- tsLib .. "," .. new_root_dir .. "/node_modules",
				tsLib .. "," .. new_root_dir,
				"--ngProbeLocations",
				-- ngLib .. "," .. new_root_dir .. "/node_modules",
				ngLib .. "," .. new_root_dir,
			}
    end,
  }

  -- Attach Astro LSP
  require("lspconfig").astro.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  local signs = {
    { name = "DiagnosticSignError", text = get_icon "BoldError" },
    { name = "DiagnosticSignWarn", text = get_icon "BoldWarning" },
    { name = "DiagnosticSignHint", text = get_icon "BoldHint" },
    { name = "DiagnosticSignInfo", text = get_icon "BoldInformation" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "single",
      source = "always",
      header = "",
      prefix = "",
      suffix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
  })
end

return M
