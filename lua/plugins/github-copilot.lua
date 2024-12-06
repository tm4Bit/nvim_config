local M = {
  "github/copilot.vim",
  event = "InsertEnter",
}

-- create a function to sum two numbers

M.config = function()
  -- Copilot setup.
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  -- Accept the current completion with Ctrl-].
  vim.keymap.set("i", "<C-]>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
  })
  -- Accept the current completion word with Ctrl-\.
  vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-accept-word)")
  -- Accept the current completion line with Ctrl-|.
  vim.keymap.set("i", "<C-|>", "<Plug>(copilot-accept-line)")
  -- Request a suggestion with Ctrl-.
  vim.keymap.set("i", "<C-[>", "<Plug>(copilot-suggest)")
end

return M
