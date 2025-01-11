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

-- Set the runtime path
if vim.g.vscode then
  -- vscode keymaps and options for Neovim plugin
  require "code.keymaps"
  require "code.options"
else
  -- setup colorscheme
  vim.g.colorscheme = "catppuccin"

  -- Require main files
  require "options"
  require "keymaps"
  require "lazy_init"
  require "autocommands"
  require "highlight"

  vim.cmd "colorscheme catppuccin-macchiato" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
  -- vim.cmd "colorscheme rose-pine"
  -- vim.cmd "colorscheme tokyonight"
  -- vim.cmd "colorscheme gruvbox"
end
