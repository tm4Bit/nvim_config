local M = {
  "iamcco/markdown-preview.nvim",
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "[MARKDOWN]:Open preview on the browser" },
    { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "[MARKDOWN]:Toggle preview" },
    { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "[MARKDOWN]:Stop preview" },
  },
}

return M
