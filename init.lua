--[[
          =                   =
        #+*+                  @*@
      **+=+-+*                @=**@
    +*++=+*.=+*               %==+*%=
   +======+:--+*              @====**@
 *+@*--++++:===++             @=+++++*#*
-+=-*@--==+.====+*            @++++++++#=
-+==-=@--=*.-----+*%          @+++++++++:
-=====-@==*:========*         @+++++++++:
-+======%==.=-======++        @+++++++++:
-+=++===++@:*========*#       @*++++++++:
-+========% *+=====--=+*-     @*++++++++-
-+++++++++@  **========++@    @*++++++++-
-+++++++++@   @++========*+   @*++++++++-
-+=======+@    @**========**  @#********=
-+++++++++@      #*========+% @#++++++++-
-=++++++++@       #*========*=%#********-
-*+++++++*@        @*========:+=%*+*****-
-+++++++++@         @**=====+:*+-%***++*-
-*++++++++@          +#*=====:**+=%#****=
-%++++++++@            %*++++-**++=*#**%=
 @@#++++++@             %*===:****+++%@@      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
   @@#****@              @*++:**++++*#%       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    *@@**+@               @%*-**++#@@         ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
      @@%*@                .@***#@@           ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        @@@                  %@@@             ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
          +                   =               ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
NVIM v0.11.3
Build type: Release
LuaJIT 2.1.1741730670
--]]

-- VSCode-specific configuration
if vim.g.vscode then
  -- require "code.keymaps"
  require "code.options"
  local autocmd = vim.api.nvim_create_autocmd
  local autogroup = vim.api.nvim_create_augroup
  autocmd("TextYankPost", {
    desc = "Configure highlight group and timeout for yank command",
    group = autogroup("highlightyank", { clear = true }),
    pattern = "*",
    callback = function()
      vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
    end,
  })
  return
end

-- Global variables
vim.g.copilot_auto_trigger = false

-- names: "catppuccin" | "github-theme" | "rose-pine" | "tokyonight" | "kanagawa"
vim.g.colorscheme = "rose-pine"

-- Require main files
require "options"
require "keymaps"
require "lazy_init"
require "autocommands"
require "terminal"
require "highlight"

-- themes: "catppuccin-macchiato" | "github_dark" | "github_dark_default" | "rose-pine" | "tokyonight" | "kanagawa"
vim.cmd "colorscheme rose-pine" -- github_dark_default
