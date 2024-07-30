local M = {}

M.map = function(bufnr, map, cmd, desc)
	local keymap = vim.keymap.set
	keymap("n", map, cmd, { buffer = bufnr, desc = desc })
end

M.on_attach = function(client, bufnr)
	M.map(bufnr, "gh", vim.lsp.buf.hover, "[LSP]:Hover")
	M.map(bufnr, "gl", vim.diagnostic.open_float, "[LSP]:Float diagnostic")
	M.map(bufnr, "gd", require("telescope.builtin").lsp_definitions, "[LSP]:GoTo definition")
	M.map(bufnr, "gi", require("telescope.builtin").lsp_implementations, "[LSP]:GoTo implementation")
	M.map(bufnr, "gr", require("telescope.builtin").lsp_references, "[LSP]:GoTo references")
	M.map(bufnr, "<leader>ls", require("telescope.builtin").lsp_document_symbols, "[LSP]:Signature help")
	M.map(bufnr, "<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[LSP]:Workspace symbols")
	M.map(bufnr, "<leader>]d", vim.diagnostic.goto_next, "[LSP]:Next diagnostic")
	M.map(bufnr, "<leader>[d", vim.diagnostic.goto_prev, "[LSP]:Previous diagnostic")
	M.map(bufnr, "<leader>li", "<cmd>LspInfo<cr>", "[LSP]:Lsp info")
	M.map(bufnr, "<leader>la", vim.lsp.buf.code_action, "[LSP]:Code action")
	M.map(bufnr, "<leader>lr", vim.lsp.buf.rename, "[LSP]:Rename")
	-- M.map(bufnr, "<leader>lf", vim.lsp.buf.format { async = true }, "Format file")

	-- FIX: When creating a new file throws a error in `script/core/hint.lua` Error: attempt to index a nil value (local "last")
	-- Itsn't very helpful. Make the code a lot more dirty and you can get the same information from the old and nice `gh`
	--[[
	if client.supports_method "textDocument/inlayHint" then
		vim.lsp.inlay_hint.enable(true, nil)
		M.map(bufnr, "<leader>lti", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "Toggle inlay hint")
	end 
	]]

	require("illuminate").on_attach(client)
end

return M
