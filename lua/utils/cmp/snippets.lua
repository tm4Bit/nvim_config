local M = {}

M.execute = function()
  local luasnip_status_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_status_ok then
    return
  end

  -- Keymaps
  vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    end
  end, { silent = true, desc = "Next snippet node" })
  vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    end
  end, { silent = true, desc = "Previous snippet node" })
  vim.keymap.set("i", "<c-l>", function()
    if luasnip.choice_active() then
      luasnip.change_choice(1)
    end
  end, { desc = "Change cmp choice" })
  vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice", { desc = "Select cmp choice" })


  require("luasnip/loaders/from_vscode").lazy_load()

	return luasnip
end

return M
