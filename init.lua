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
NVIM v0.12.5
Build type: RelWithDebInfo
LuaJIT 2.1.1787165859
--]]

-- Global variables
vim.g.copilot_auto_trigger = false

-- names: "catppuccin" | "github-theme" | "rose-pine" | "tokyonight" | "kanagawa" | "matteblack" | "fleet" | "vscode" |
-- "darkplus" | "gruvbox" | "monokai-pro"
vim.g.colorscheme = "tokyonight"

-- Require main files
require "options"
require "keymaps"
require "lazy_init"
require "autocommands"
require "terminal"
require "highlight"

-- themes: "catppuccin-macchiato" | "github_dark" | "github_dark_default" | "rose-pine" | "tokyonight" | "kanagawa" |
--  "matteblack" | "fleet" | "onedarkpro" | "vscode" | "darkplus" | "gruvbox" | "monokai-pro"
vim.cmd "colorscheme tokyonight" -- github_dark_default
