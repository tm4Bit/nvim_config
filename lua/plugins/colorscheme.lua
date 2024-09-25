return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    name = "kanagawa",
    config = function()
      require("kanagawa").setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "dragon", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus",
        },
      }
      -- vim.cmd "colorscheme kanagawa"
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      local status_ok, colorscheme = pcall(require, "rose-pine")
      if not status_ok then
        return
      end

      colorscheme.setup {
        variant = "main", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
      }

      -- vim.cmd "colorscheme rose-pine"
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    name = "tokyonight",
    config = function()
      local tokyonight = require "tokyonight"
      tokyonight.setup {
        style = "moon",
        -- style = "day"
      }
      -- vim.cmd "colorscheme tokyonight"
    end,
  },
}
