-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig", -- Main plugin being configured
  event = { "BufReadPre", "BufNewFile" }, -- Load early
  dependencies = {
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
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
    },
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp", -- For LSP capabilities
    "folke/trouble.nvim", -- Used in your LspAttach keymaps
    "RRethy/vim-illuminate", -- For document highlighting
  },
  config = function()
    vim.lsp.set_log_level "debug"
    print("LSP log level set to debug. Log path: " .. vim.lsp.get_log_path())

    local lspconfig = require "lspconfig"
    local masonlsp = require "mason-lspconfig"
    local servers_list = require("utils.lsp.servers").servers

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local denylist = require "utils.lsp.illuminate-denylist"
    require("illuminate").configure(denylist)

    local get_icon = require("utils.icons").get_icon
    local signs = {
      { name = "DiagnosticSignError", text = get_icon("BoldError", 1) },
      { name = "DiagnosticSignWarn", text = get_icon("BoldWarning", 1) },
      { name = "DiagnosticSignHint", text = get_icon("BoldHint", 1) },
      { name = "DiagnosticSignInfo", text = get_icon("BoldInformation", 1) },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end

    vim.diagnostic.config {
      virtual_text = true,
      signs = { active = signs },
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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "single",
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("user_lsp_attach_config", { clear = true }),
      callback = function(event)
        local map_key = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
          return
        end

        print(
          "LSP client attached: " .. client.name .. " to buffer " .. event.buf .. ". Attaching keymaps and features."
        )

        map_key("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map_key("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map_key("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map_key("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map_key("gtd", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        map_key("K", vim.lsp.buf.hover, "Hover Documentation")
        map_key("gl", vim.diagnostic.open_float, "Float Diagnostic")

        map_key("<leader>la", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "v" })
        map_key("<leader>lr", vim.lsp.buf.rename, "[R]e[n]ame")

        map_key("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        map_key("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        map_key("<leader>]d", function()
          require("trouble").next { skip_groups = true, jump = true }
        end, "Next Diagnostic (Trouble)")
        map_key("<leader>[d", function()
          require("trouble").previous { skip_groups = true, jump = true }
        end, "Prev Diagnostic (Trouble)")

        vim.keymap.set(
          "n",
          "<leader>li",
          "<cmd>LspInfo<cr>",
          { buffer = event.buf, desc = "LSP: LspInfo (:checkhealth vim.lsp)" }
        )

        require("illuminate").on_attach(client)

        if client.name == "angularls" then
          client.server_capabilities.renameProvider = false
        end

        if client.server_capabilities.documentHighlightProvider then
          local highlight_augroup_name = "user_lsp_document_highlight_" .. event.buf
          vim.api.nvim_create_augroup(highlight_augroup_name, { clear = true })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup_name,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup_name,
            callback = vim.lsp.buf.clear_references,
          })
        end

        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map_key("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    -- Mason-Lspconfig: primarily for ensuring servers are installed
    masonlsp.setup {
      ensure_installed = servers_list,
      automatic_installation = true,
      automatic_enable = false, -- We call .setup() manually for each server below
      handlers = {
        -- Intentionally empty or for servers that need *mason-lspconfig specific handling*
        -- before lspconfig.setup() is called (rare).
        -- For clangd and jdtls, Mason installs them, but their dedicated plugins handle their lspconfig.setup().
      },
    }

    -- Manually iterate and setup LSP servers using lspconfig
    vim.notify("Starting manual LSP server setup loop...", vim.log.levels.INFO)
    for _, server_name in ipairs(servers_list) do
      vim.notify("[LSP Setup Loop] Processing: " .. server_name, vim.log.levels.INFO)

      if server_name == "jdtls" or server_name == "clangd" then
        vim.notify(
          "[LSP Setup Loop] Skipping lspconfig.setup for " .. server_name .. " (handled by dedicated plugin).",
          vim.log.levels.INFO
        )
        goto continue -- Lua's way to continue to next loop iteration
      end

      local effective_server_opts = {
        capabilities = capabilities, -- Base global capabilities
        -- The global LspAttach autocommand will handle on_attach logic
      }

      -- Determine the correct settings file name for this server
      local settings_file_to_load = server_name
      if server_name == "ts_ls" then
        -- Prefer settings/ts_ls.lua, fallback to settings/tsserver.lua with a warning
        local ts_ls_settings_path = vim.fn.stdpath "config" .. "/lua/settings/ts_ls.lua"
        local tsserver_settings_path = vim.fn.stdpath "config" .. "/lua/settings/tsserver.lua"
        if vim.uv.fs_stat(ts_ls_settings_path) then
          settings_file_to_load = "ts_ls"
        elseif vim.uv.fs_stat(tsserver_settings_path) then
          vim.notify(
            "[LSP Setup Loop] WARN: For 'ts_ls', using settings from 'lua/settings/tsserver.lua'. Consider renaming to 'lua/settings/ts_ls.lua'.",
            vim.log.levels.WARN
          )
          settings_file_to_load = "tsserver"
        else
          vim.notify(
            "[LSP Setup Loop] INFO: No specific settings file found for 'ts_ls' (checked 'ts_ls.lua' and 'tsserver.lua').",
            vim.log.levels.INFO
          )
        end
      end

      local has_custom_settings, custom_opts_from_file = pcall(require, "settings." .. settings_file_to_load)
      if has_custom_settings and type(custom_opts_from_file) == "table" then
        vim.notify(
          "[LSP Setup Loop] Found custom settings for "
            .. server_name
            .. " from 'settings."
            .. settings_file_to_load
            .. ".lua'. Merging.",
          vim.log.levels.INFO
        )

        local merged_capabilities = vim.deepcopy(capabilities) -- Start with global capabilities
        if custom_opts_from_file.capabilities and type(custom_opts_from_file.capabilities) == "table" then
          merged_capabilities = vim.tbl_deep_extend("force", merged_capabilities, custom_opts_from_file.capabilities)
        end

        effective_server_opts = vim.tbl_deep_extend("force", vim.deepcopy(effective_server_opts), custom_opts_from_file)
        effective_server_opts.capabilities = merged_capabilities -- Ensure capabilities are correctly merged
      elseif not has_custom_settings then
        local err_msg = custom_opts_from_file -- pcall returns error as second arg on failure
        -- Only notify if it's an error *within* an existing settings file, not just 'module not found'
        if not string.match(tostring(err_msg), "module 'settings." .. settings_file_to_load .. "' not found") then
          vim.notify(
            "[LSP Setup Loop] ERROR loading custom settings for "
              .. server_name
              .. " from 'settings."
              .. settings_file_to_load
              .. ".lua': "
              .. tostring(err_msg),
            vim.log.levels.ERROR
          )
        else
          vim.notify(
            "[LSP Setup Loop] INFO: No custom settings file found for "
              .. server_name
              .. " at 'settings."
              .. settings_file_to_load
              .. ".lua'.",
            vim.log.levels.INFO
          )
        end
      end

      -- Apply specific configurations (cmd, filetypes, init_options, etc.)
      if server_name == "intelephense" then
        effective_server_opts.init_options = effective_server_opts.init_options or {}
        effective_server_opts.init_options.licenceKey = "/home/tma/intelephense/licence.txt"
      elseif server_name == "emmet_ls" then
        effective_server_opts.filetypes = {
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
        }
      elseif server_name == "angularls" then
        local ng_lib_path =
          "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/lib/node_modules/@angular/language-server"
        local ng_bin_path = "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/bin/ngserver"
        effective_server_opts.cmd =
          { ng_bin_path, "--stdio", "--tsProbeLocations", ng_lib_path, "--ngProbeLocations", ng_lib_path }
        effective_server_opts.on_new_config = function(new_config, new_root_dir)
          new_config.cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations",
            ng_lib_path .. "," .. new_root_dir,
            "--ngProbeLocations",
            ng_lib_path .. "," .. new_root_dir,
          }
        end
      elseif server_name == "astro" then
        local astro_bin_path = "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/bin/astro-ls"
        effective_server_opts.cmd = { astro_bin_path, "--stdio" }
      end

      vim.notify("[LSP Setup Loop] Final options for " .. server_name .. ":", vim.log.levels.INFO)
      vim.print(effective_server_opts) -- Print to :messages for inspection

      if lspconfig[server_name] then
        lspconfig[server_name].setup(effective_server_opts)
        vim.notify("[LSP Setup Loop] Called lspconfig." .. server_name .. ".setup()", vim.log.levels.INFO)
      else
        vim.notify(
          "[LSP Setup Loop] ERROR: lspconfig." .. server_name .. " is nil! Cannot setup.",
          vim.log.levels.ERROR
        )
      end
      ::continue:: -- Lua goto label for loop continuation
    end
    vim.notify("Manual LSP server setup loop finished.", vim.log.levels.INFO)
  end, -- end of config function
} -- end of plugin spec
