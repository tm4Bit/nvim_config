--[[
---  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
---  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
---  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
---  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
---  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
---  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
---- NVIM v0.10.1-dev-55+g9c6efd0a6
---- Build type: Release
---- LuaJIT 2.1.1713484068
--]]

if vim.g.vscode then
  require "code.keymaps"
  require "code.options"
  return
end

-- vim.g.colorscheme = "catppuccin"
vim.g.colorscheme = "github-theme"
-- vim.g.colorscheme = "rose-pine"
-- vim.g.colorscheme = "tokyonight"
-- vim.g.colorscheme = "kanagawa"

-- Require main files
require "options"
require "keymaps"
require "lazy_init"
require "autocommands"
require "terminal"
require "highlight"

-- vim.cmd "colorscheme catppuccin-macchiato" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd "colorscheme github_dark_default" -- github_dark_default
-- vim.cmd "colorscheme rose-pine"
-- vim.cmd "colorscheme tokyonight"
-- vim.cmd "colorscheme kanagawa"
