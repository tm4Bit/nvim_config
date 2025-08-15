local M = {}

-- This table holds the configurations for each LSP server.
-- Keys are server names (as used by nvim-lspconfig).
-- Values are tables containing the specific options for that server.
M.configurations = {
  -- Servers handled by dedicated plugins (listed here so Mason can install them)
  clangd = {
    -- No lspconfig.setup options here; clangd_extensions.nvim handles it.
    -- Mason will ensure it's installed if it's in the list passed to ensure_installed.
  },
  jdtls = {
    -- No lspconfig.setup options here; nvim-jdtls handles it.
  },

  -- Lua
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim", "spec" } },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.stdpath "config" .. "/lua"] = true,
          },
          checkThirdParty = false,
        },
        telemetry = { enable = false },
        hint = {
          enable = true,
          arrayIndex = "Disable", -- Copied from your lua/settings/lua_ls.lua
          await = true,
          paramName = "All",
          paramType = false,
          semicolon = "All",
          setType = false,
        },
        format = { enable = false }, -- From your lua/settings/lua_ls.lua
      },
    },
  },

  -- TypeScript / JavaScript
  ts_ls = {
    -- Content from your previous lua/settings/ts_ls.lua (formerly tsserver.lua)
    settings = {
      typescript = {
        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = true, showOnAllFunctions = true },
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = false,
        },
      },
      javascript = {
        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = true, showOnAllFunctions = true },
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = false,
        },
      },
    },
  },

  -- PHP
  intelephense = {
    init_options = {
      licenceKey = "/home/tma/intelephense/licence.txt", -- Your specific path
    },
  },

  -- Web Development Servers
  cssls = {}, -- Uses defaults + global capabilities
  html = {}, -- Uses defaults + global capabilities
  emmet_ls = {
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
      "blade",
    },
  },
  tailwindcss = {
    -- Example: If you had specific settings for tailwindcss
    -- settings = { tailwindCSS = { includeLanguages = { plaintext = "html" } } }
  },
  svelte = {},
  angularls = {
    cmd = {
      "/home/tma/.asdf/installs/nodejs/22.16.0/bin/ngserver",
      "--stdio",
      "--tsProbeLocations",
      "/home/tma/.asdf/installs/nodejs/22.16.0/lib/node_modules/@angular/language-server",
      "--ngProbeLocations",
      "/home/tma/.asdf/installs/nodejs/22.16.0/lib/node_modules/@angular/language-server",
    },
    on_new_config = function(new_config, new_root_dir)
      local ng_lib_path = "/home/tma/.asdf/installs/nodejs/22.16.0/lib/node_modules/@angular/language-server"
      new_config.cmd = {
        "ngserver",
        "--stdio",
        "--tsProbeLocations",
        ng_lib_path .. "," .. new_root_dir,
        "--ngProbeLocations",
        ng_lib_path .. "," .. new_root_dir,
      }
    end,
  },
  astro = {
    cmd = { "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/bin/astro-ls", "--stdio" },
  },
  templ = {},

  -- Other Languages & Tools
  prismals = {},
  marksman = {},
  pyright = {
    -- Content from your previous lua/settings/pyright.lua
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
        },
      },
    },
  },
  bashls = {},
  solargraph = {},
  jsonls = {
    -- Example if you want to enable schema download for jsonls
    -- settings = {
    --   json = {
    --     schemas = require('schemastore').json.schemas(),
    --     validate = { enable = true },
    --   },
    -- },
  },
  yamlls = {},
  gopls = {},
  -- Add all other servers from your original list.
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
