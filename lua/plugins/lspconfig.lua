local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "folke/trouble.nvim",
    "RRethy/vim-illuminate",
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

  -- illuminate setup
  local denylist = require "utils.lsp.illuminate-denylist"
  require("illuminate").configure(denylist)

  -- utils
  local get_icon = require("utils.icons").get_icon
  local servers = require("utils.servers").servers
  local on_attach = require("utils.lsp.utils").on_attach

  -- capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

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

    -- Jump emmet-ls config
    if server == "emmet_ls" then
      goto continue
    end

    -- Jump java-language-server config
    if server == "jdtls" then
      goto continue
    end

    -- Jump clang config
    if server == "clangd" then
      goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
  end

  -- Blade LSP setup
  local configs = require "lspconfig.configs"

  -- Configure it
  if not configs.blade then
    configs.blade = {
      default_config = {
        -- Path to the executable: laravel-dev-generators
        cmd = { "/home/tma/laravel-dev-tools/builds/laravel-dev-tools", "lsp", "-vvv" },
        filetypes = { "blade" },
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname)
        end,
        settings = {},
      },
    }
  end

  -- Set it up
  lspconfig.blade.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- Attach emmet_ls
  lspconfig.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "astro",
      "handlebars",
      "css",
      "eruby",
      "html",
      "htmldjango",
      "javascriptreact",
      "less",
      "pug",
      "sass",
      "scss",
      "svelte",
      "typescriptreact",
      "vue",
      "htmlangular",
      "php",
    },
  }

  -- Phpactor
  require("lspconfig").phpactor.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      ["language_server_phpstan.enabled"] = false,
      ["language_server_psalm.enabled"] = false,
    },
  }
  -- Attach Angular LSP
  local ng_lib =
    "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/lib/node_modules/@angular/language-server"
  local ng_bin = "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/bin/ngserver"
  local cmd = { ng_bin, "--stdio", "--tsProbeLocations", ng_lib, "--ngProbeLocations", ng_lib }

  require("lspconfig").angularls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
      -- new_config.cmd = cmd
      new_config.cmd = {
        "ngserver",
        "--stdio",
        "--tsProbeLocations",
        ng_lib .. "," .. new_root_dir,
        "--ngProbeLocations",
        ng_lib .. "," .. new_root_dir,
      }
    end,
  }

  -- Attach Astro LSP
  local astro_bin = "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/bin/astro-ls"
  local astro_cmd = { astro_bin, "--stdio" }

  require("lspconfig").astro.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = astro_cmd,
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
