local M = {
  "stevearc/oil.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    keymaps = {
      ["<C-c>"] = false,
      ["<leader>e"] = "actions.close",
    },
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Oil<cr>", -- Add the flag --float to open in a float window
      desc = "[OIL]:Open",
    },
  },
}

return M
