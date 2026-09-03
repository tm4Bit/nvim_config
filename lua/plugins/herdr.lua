local M = {
  "ChmaraX/herdr-nvim",
  opts = { keymaps = false },
  keys = {
    { "<leader>ac", "<cmd>Herdr comment<cr>", mode = { "n", "x" }, desc = "Comment for agent" },
    { "<leader>al", "<cmd>Herdr list<cr>", desc = "List agent comments" },
    { "<leader>as", "<cmd>Herdr send<cr>", desc = "Paste comments to agent" },
    { "<leader>aS", "<cmd>Herdr submit<cr>", desc = "Send comments to agent" },
  },
}

return M
