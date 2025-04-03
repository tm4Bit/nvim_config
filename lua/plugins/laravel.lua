local M = {
  "adalessa/laravel.nvim",
  dependencies = {
    "tpope/vim-dotenv",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel" },
  keys = {
    { "<loclaleader>la", ":Laravel artisan<cr>" },
    { "<localleader>lr", ":Laravel routes<cr>" },
    { "<localleader>lm", ":Laravel related<cr>" },
  },
  event = { "VeryLazy" },
  config = true,
}

M.opts = {
  lsp_server = "intelephense",
  features = {
    route_info = {
      enable = true,
      view = "top",
    },
    model_info = {
      enable = true,
    },
    override = {
      enable = true,
    },
    pickers = {
      enable = true,
      provider = "telescope",
    },
  },
  -- ui = require "laravel.options.ui",
  -- commands_options = require "laravel.options.command_options",
  -- environments = require "laravel.options.environments",
  -- user_commands = require "laravel.options.user_commands",
  -- resources = require "laravel.options.resources",
  -- providers = {
  --   require "laravel.providers.laravel_provider",
  --   require "laravel.providers.repositories_provider",
  --   require "laravel.providers.override_provider",
  --   require "laravel.providers.completion_provider",
  --   require "laravel.providers.route_info_provider",
  --   require "laravel.providers.tinker_provider",
  --   require "laravel.providers.telescope_provider",
  --   require "laravel.providers.fzf_lua_provider",
  --   require "laravel.providers.ui_select_provider",
  --   require "laravel.providers.user_command_provider",
  --   require "laravel.providers.status_provider",
  --   require "laravel.providers.diagnostics_provider",
  --   require "laravel.providers.model_info_provider",
  --   require "laravel.providers.composer_info_provider",
  --   require "laravel.providers.history_provider",
  -- },
  user_providers = {}, -- Custom providers, see below
}

return M
--[[ local M = {
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

return M ]]
