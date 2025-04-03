local M = {
  "adalessa/laravel.nvim",
  tag = "v2.2.1",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvimtools/none-ls.nvim",
  },
  ft = { "php", "blade.php" },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<localleader>la", "<cmd>Laravel artisan<cr>", desc = "[LARAVEL]:Artisan cmds" },
    { "<localleader>lr", "<cmd>Laravel routes<cr>", desc = "[LARAVEL]:Routes" },
    { "<localleader>lm", "<cmd>Laravel related<cr>", desc = "[LARAVEL]:Related" },
  },
  -- event = { "VeryLazy" },
  opts = {
    features = {
      null_ls = {
        enable = true,
      },
      route_info = {
        enable = true, --- to enable the laravel.nvim virtual text
        position = "right", --- where to show the info (available options 'right', 'top')
        middlewares = true, --- wheather to show the middlewares section in the info
        method = true, --- wheather to show the method section in the info
        uri = true, --- wheather to show the uri section in the info
      },
    },
  },
  config = true,
}

return M
