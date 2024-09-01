local M = {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>e",
      "<cmd>Oil<cr>", -- Add the flag --float to open in a float window
      desc = "[OIL]:Open",
    },
  },
}

M.config = function()
  local status_ok, oil = pcall(require, "oil")
  if not status_ok then
    return
  end
  oil.setup {
    keymaps = {
			["<C-c>"] = false,
      ["<leader>e"] = "actions.close",
    },
  }
end

return M
