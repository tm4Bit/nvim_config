local M = {
  "github/copilot.vim",
  enabled = false,
  event = "InsertEnter",
}

M.config = function()
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.keymap.set("i", "<C-]", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
  })
  -- FIXME: This doesn't work for some reason
  vim.keymap.set("i", "<M-]>", "<Plug>(copilot-suggest)")
end

return M
