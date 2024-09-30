local M = {
  "folke/trouble.nvim",
  opts = {
    auto_close = true, -- auto close when there are no items
    focus = true, -- Focus the window when opened
    indent_guides = true, -- show indent guides
    pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
    warn_no_results = true, -- show a warning when there are no results
    open_no_results = false, -- open the trouble window when there are no results
  },
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[TROUBLE]:Diagnostics",
    },
    {
      "<leader>tb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "[TROUBLE]:Buffer Diagnostics",
    },
    {
      "<leader>ts",
      "<cmd>Trouble lsp_document_symbols toggle win.position=right win.size.width=86<cr>",
      desc = "[TROUBLE]:Symbols",
    },
    {
      "<leader>tl",
      "<cmd>Trouble lsp toggle win.position=right win.size.width=86<cr>",
      desc = "[TROUBLE]:LSP Definitions / references / ...",
    },
    {
      "<leader>tq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "[TROUBLE]:Quickfix List",
    },
  },
}

return M
