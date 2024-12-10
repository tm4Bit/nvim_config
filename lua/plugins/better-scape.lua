local M = {
  "max397574/better-escape.nvim",
  event = "InsertEnter",
  opts = {
    timeout = vim.o.timeoutlen,
    default_mappings = false,
    mappings = {
      i = {
        k = {
          j = "<Esc>",
        },
      },
    },
  },
}

return M
