vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("tma-lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    map("gtd", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    map("<leader>]d", require("trouble").next { skip_groups = true, jump = true }, "Next diagnostic")
    map("<leader>[d", require("trouble").previous { skip_groups = true, jump = true }, "Previous diagnostic")
    map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    map("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    map("<leader>lr", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<leader>la", vim.lsp.buf.code_action, "[C]ode [A]ction")
    map("<leader>li", "<cmd>LspInfo<cr>", "Lsp info")
    map("gh", vim.lsp.buf.hover, "Hover Documentation")
    map("gl", vim.lsp.diagnostic.open_float, "Float diagnostic")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup("tma-lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("tma-lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = "tma-lsp-highlight", buffer = event2.buf }
        end,
      })
    end

    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      map("<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, "[T]oggle Inlay [H]ints")
    end
  end,
})
