--[[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
NVIM v0.12.5
Build type: RelWithDebInfo
LuaJIT 2.1.1787165859
--]]

local function init(opt)
  vim.g.colorscheme = opt.colorscheme

  -- Require main files
  require "options"
  require "keymaps"
  require "lazy_init"
  require "autocommands"
  require "terminal"
  require "highlight"

  vim.cmd.colorscheme(opt.colorscheme)
end

-- Theme selection
-- catppuccin-macchiato | kanagawa | rose-pine
-- tokyonight | github-theme | fleet
-- matteblack onedark vhs80
-- vscode | darkplus | gruvbox
-- monokai-pro | van-gogh
local opt = {
  colorscheme = "van-gogh",
  -- for future options
}

init(opt)
