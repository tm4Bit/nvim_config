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
  -- vscode keymaps and options for Neovim plugin
  require "code.keymaps"
  require "code.options"
else
  -- Require main files
  require "options"
  require "keymaps"
  require "lazy_init"
  require "autocommands"
  require "terminal"
  require "highlight"
end
