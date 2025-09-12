return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "mason-org/mason.nvim",
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
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "folke/trouble.nvim",
    "RRethy/vim-illuminate",
  },
  config = function()
    local lspconfig = require "lspconfig"
    local masonlsp = require "mason-lspconfig"

    -- Require the server configurations and names from the utility file
    local servers_module = require "utils.lsp.servers"
    local lsp_servers_config = servers_module.get_lsp_configs()
    local server_names_for_mason = servers_module.get_all_server_names()

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local denylist = require "utils.lsp.illuminate-denylist"
    require("illuminate").configure(denylist)

    local get_icon = require("utils.icons").get_icon
    vim.diagnostic.config {
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = get_icon("BoldError", 1),
          [vim.diagnostic.severity.WARN] = get_icon("BoldWarning", 1),
          [vim.diagnostic.severity.HINT] = get_icon("BoldHint", 1),
          [vim.diagnostic.severity.INFO] = get_icon("BoldInformation", 1),
        },
        numhl = {
          "DiagnosticSignError",
          "DiagnosticSignWarn",
          "DiagnosticSignHint",
          "DiagnosticSignInfo",
        },
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "single",
        source = true,
        header = "",
        prefix = "",
        suffix = "",
      },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("tma_lsp_attach", { clear = true }),
      callback = function(event)
        local map_key = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
          return
        end

        map_key("gd", require("telescope.builtin").lsp_definitions, "[G]oto [d]efinition")
        map_key("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map_key("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map_key("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map_key("gtd", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype [D]efinition")
        map_key("gh", function()
          vim.lsp.buf.hover { border = "single" }
        end, "[G]oto [H]over Documentation")
        map_key("gl", vim.diagnostic.open_float, "Float Diagnostic")

        map_key("<leader>la", vim.lsp.buf.code_action, "[L]SP code [A]ction", { "n", "v" })
        map_key("<leader>lr", vim.lsp.buf.rename, "[L]SP [R]ename")

        map_key("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[L]SP document [S]ymbols")
        map_key(
          "<leader>lws",
          require("telescope.builtin").lsp_dynamic_workspace_symbols,
          "[L]SP [W]orkspace [S]ymbols"
        )

        map_key("<leader>]d", function()
          require("trouble").next { skip_groups = true, jump = true }
        end, "Next Diagnostic (Trouble)")
        map_key("<leader>[d", function()
          require("trouble").previous { skip_groups = true, jump = true }
        end, "Prev Diagnostic (Trouble)")

        vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", {
          buffer = event.buf,
          desc = "LSP: LspInfo (:checkhealth vim.lsp)",
        })

        require("illuminate").on_attach(client)

        if client.name == "angularls" then
          client.server_capabilities.renameProvider = false
        end

        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map_key("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    masonlsp.setup {
      ensure_installed = server_names_for_mason,
      automatic_installation = false,
      automatic_enable = false,
      handlers = {}, -- Manual loop below handles setup
    }

    for server_name, server_specific_config in pairs(lsp_servers_config) do
      -- Skip servers
      if server_name == "jdtls" or server_name == "clangd" then
        goto continue
      end

      -- Start with a deepcopy of the server-specific config from utils/lsp/servers.lua
      local effective_server_opts = vim.deepcopy(server_specific_config or {})
      -- Ensure global capabilities are merged correctly.
      -- Server-specific capabilities (if defined in server_specific_config.capabilities) will take precedence.
      effective_server_opts.capabilities =
        vim.tbl_deep_extend("force", vim.deepcopy(capabilities), effective_server_opts.capabilities or {})

      if lspconfig[server_name] then
        lspconfig[server_name].setup(effective_server_opts)
      end
      ::continue::
    end
  end,
}
