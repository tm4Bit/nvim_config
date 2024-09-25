local M = {
  "adalessa/laravel.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvimtools/none-ls.nvim",
  },
  ft = { "php", "blade.php" },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<localleader>la", "<cmd>Laravel artisan<cr>", "[LARAVEL]:Artisan" },
    { "<localleader>lr", "<cmd>Laravel routes<cr>", "[LARAVEL]:Routes" },
    { "<localleader>lm", "<cmd>Laravel related<cr>", "[LARAVEL]:Related" },
  },
  -- event = { "VeryLazy" },
  config = true,
}

return M
