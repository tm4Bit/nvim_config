local M = {
  "christoomey/vim-tmux-navigator",
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "[TMUX]:Move to left split" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "[TMUX]:Move to below split" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "[TMUX]:Move to above split" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "[TMUX]:Move to right split" },
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
