local M = {
  "christoomey/vim-tmux-navigator",
	-- enabled = false,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Move to left split" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Move to below split" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Move to above split" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Move to right split" },
  },
}

M.config = function()
  local status_ok, vtn = pcall(require, "vim-tmux-navigator")
  if not status_ok then
    return
  end
  vtn.setup {}
end

return M
