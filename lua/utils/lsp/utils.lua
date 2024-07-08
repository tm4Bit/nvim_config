local M = {}

M.map = function(bufnr, map, cmd, desc)
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", map, cmd, { noremap = true, silent = true, desc = desc })
end

M.on_attach = function(client, bufnr)
	M.map(bufnr, "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "GoTo declaration")
	M.map(bufnr, "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "GoTo definition")
  M.map(bufnr, "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
  M.map(bufnr, "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", "GoTo implementation")
  M.map(bufnr, "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "GoTo references")
  M.map(bufnr, "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", "Float diagnostic")
  M.map(bufnr, "<leader>li", "<cmd>LspInfo<cr>", "Lsp info")
  M.map(bufnr, "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action")
  M.map(bufnr, "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next diagnostic")
  M.map(bufnr, "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous diagnostic")
  M.map(bufnr, "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
  M.map(bufnr, "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help")
  M.map(bufnr, "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", "Setloclist")

  require("illuminate").on_attach(client)
end

return M
