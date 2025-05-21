# .luacheckrc

```
-- Global objects
globals = {
  "vim",
  "bit",
  "Snacks",
}

read_globals = {
  "vim",
}

-- Rerun tests only if their modification time changed
cache = true

-- Don't report unused self arguments of methods
self = false

ignore = {
  "631", -- max_line_length
  "212/_.*", -- unused argument, for vars with "_" prefix
}

```

# .luarc.json

```json
{
	"diagnostics.globals": [
		"vim",
		"pre_hook",
		"globals",
		"read_globals",
		"cache",
		"self",
		"Snacks",
		"ignore"
	]
}

```

# .stylua.toml

```toml
column_width = 120
line_endings = "Unix"
indent_type = "Spaces"
indent_width = 2
quote_style = "AutoPreferDouble"
no_call_parentheses = true

```

# after/queries/blade/highlights.scm

```scm
(directive) @function
(directive_start) @function
(directive_end) @function
(comment) @comment
((parameter) @include (#set! "priority" 110)) 
((php_only) @include (#set! "priority" 110)) 
((bracket_start) @function (#set! "priority" 120)) 
((bracket_end) @function (#set! "priority" 120)) 
(keyword) @function

```

# after/queries/blade/injections.scm

```scm
((text) @injection.content
    (#not-has-ancestor? @injection.content "envoy")
    (#set! injection.combined)
    (#set! injection.language php))

```

# init.lua

```lua
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

-- Set global variables
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

```

# lazy-lock.json

```json
{
  "Comment.nvim": { "branch": "master", "commit": "e30b7f2008e52442154b66f7c519bfd2f1e32acb" },
  "avante.nvim": { "branch": "main", "commit": "89a86f0fc197ec9ffb3663a499432f8df4e4b1e5" },
  "better-escape.nvim": { "branch": "master", "commit": "9738a470d93e2e52815bc46b4042372ca198cbd6" },
  "blink-cmp-avante": { "branch": "master", "commit": "a214d1e50990ddc08743065d78f48e7671f2f281" },
  "blink.cmp": { "branch": "main", "commit": "cb5e346d9e0efa7a3eee7fd4da0b690c48d2a98e" },
  "clangd_extensions.nvim": { "branch": "main", "commit": "b3b0eb798ecbdd16832fd38d4b07ba31ab4fe831" },
  "conform.nvim": { "branch": "master", "commit": "b1a75324ddf96b7bb84963a297b1ed334db087c0" },
  "copilot.lua": { "branch": "master", "commit": "228cd7456fd923b8da3eb6497bb345de58b93637" },
  "dressing.nvim": { "branch": "master", "commit": "2d7c2db2507fa3c4956142ee607431ddb2828639" },
  "fidget.nvim": { "branch": "main", "commit": "d9ba6b7bfe29b3119a610892af67602641da778e" },
  "friendly-snippets": { "branch": "main", "commit": "efff286dd74c22f731cdec26a70b46e5b203c619" },
  "fzf-lua": { "branch": "main", "commit": "6488ada2f376e47789391dc353b6d91a3f9de6f6" },
  "gitsigns.nvim": { "branch": "main", "commit": "17ab794b6fce6fce768430ebc925347e349e1d60" },
  "harpoon": { "branch": "harpoon2", "commit": "ed1f853847ffd04b2b61c314865665e1dadf22c7" },
  "img-clip.nvim": { "branch": "main", "commit": "08a02e14c8c0d42fa7a92c30a98fd04d6993b35d" },
  "laravel.nvim": { "branch": "main", "commit": "e4f39d942352b03396a9df79896b0a8801675199" },
  "lazy.nvim": { "branch": "main", "commit": "6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a" },
  "markdown-preview.nvim": { "branch": "master", "commit": "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee" },
  "mason-lspconfig.nvim": { "branch": "main", "commit": "1a31f824b9cd5bc6f342fc29e9a53b60d74af245" },
  "mason.nvim": { "branch": "main", "commit": "fc98833b6da5de5a9c5b1446ac541577059555be" },
  "mini.nvim": { "branch": "main", "commit": "2e38ed16c2ced64bcd576986ccad4b18e2006e18" },
  "mini.pick": { "branch": "main", "commit": "f95dc0bb9db7124f55b225f544a8719476c64314" },
  "neo-tree.nvim": { "branch": "v3.x", "commit": "a77af2e764c5ed4038d27d1c463fa49cd4794e07" },
  "none-ls-extras.nvim": { "branch": "main", "commit": "1214d729e3408470a7b7a428415a395e5389c13c" },
  "none-ls.nvim": { "branch": "main", "commit": "a117163db44c256d53c3be8717f3e1a2a28e6299" },
  "nui.nvim": { "branch": "main", "commit": "8d3bce9764e627b62b07424e0df77f680d47ffdb" },
  "nvim-autopairs": { "branch": "master", "commit": "84a81a7d1f28b381b32acf1e8fe5ff5bef4f7968" },
  "nvim-colorizer.lua": { "branch": "master", "commit": "517df88cf2afb36652830df2c655df2da416a0ae" },
  "nvim-jdtls": { "branch": "master", "commit": "2f7bff9b8d2ee1918b36ca55f19547d9d335a268" },
  "nvim-lspconfig": { "branch": "master", "commit": "3e873195f501b1e02d9fd7e5af5cbe74fc2f98c1" },
  "nvim-treesitter": { "branch": "master", "commit": "523a9e148919f58eb5a013f76787e57696e00c93" },
  "nvim-ts-context-commentstring": { "branch": "main", "commit": "1b212c2eee76d787bbea6aa5e92a2b534e7b4f8f" },
  "nvim-web-devicons": { "branch": "master", "commit": "4c3a5848ee0b09ecdea73adcd2a689190aeb728c" },
  "oil.nvim": { "branch": "master", "commit": "302bbaceeafc690e6419e0c8296e804d60cb9446" },
  "playground": { "branch": "master", "commit": "ba48c6a62a280eefb7c85725b0915e021a1a0749" },
  "plenary.nvim": { "branch": "master", "commit": "857c5ac632080dba10aae49dba902ce3abf91b35" },
  "render-markdown.nvim": { "branch": "main", "commit": "0ed141a60ca4befcaf923b21c36f6f2971d61b9e" },
  "rose-pine": { "branch": "main", "commit": "96ff3993a67356ee85d1cdab9be652cdc1c5d1ac" },
  "snacks.nvim": { "branch": "main", "commit": "bc0630e43be5699bb94dadc302c0d21615421d93" },
  "tailwind-fold.nvim": { "branch": "main", "commit": "b1e07f4734dc2bd56778ae690a3cbaeda1a53bf2" },
  "telescope-fzf-native.nvim": { "branch": "main", "commit": "1f08ed60cafc8f6168b72b80be2b2ea149813e55" },
  "telescope-ui-select.nvim": { "branch": "master", "commit": "6e51d7da30bd139a6950adf2a47fda6df9fa06d2" },
  "telescope.nvim": { "branch": "master", "commit": "a0bbec21143c7bc5f8bb02e0005fa0b982edc026" },
  "todo-comments.nvim": { "branch": "main", "commit": "304a8d204ee787d2544d8bc23cd38d2f929e7cc5" },
  "trouble.nvim": { "branch": "main", "commit": "85bedb7eb7fa331a2ccbecb9202d8abba64d37b3" },
  "vim-dotenv": { "branch": "master", "commit": "5c51cfcf8d87280d6414e03cd6b253eb70ecb800" },
  "vim-illuminate": { "branch": "master", "commit": "19cb21f513fc2b02f0c66be70107741e837516a1" },
  "vim-tmux-navigator": { "branch": "master", "commit": "791dacfcfc8ccb7f6eb1c853050883b03e5a22fe" }
}

```

# lua/autocommands.lua

```lua
local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup
local cmd = vim.cmd

autocmd("FileType", {
  desc = "Change colorcolumn to 120 for certain filetypes",
  group = autogroup("tma-colorcolumn", { clear = true }),
  pattern = { "html", "blade" },
  callback = function()
    vim.opt.colorcolumn = "120"
  end,
})

autocmd("FileType", {
  desc = "Change Tab width for certain filetypes",
  group = autogroup("tma-tab-options", { clear = true }),
  pattern = { "php" },
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end,
})

autocmd({ "FileType" }, {
  desc = "Open help in a vertical buffer",
  group = autogroup("tma-help-win", { clear = true }),
  pattern = "help",
  callback = function()
    vim.cmd.wincmd "L"
    vim.api.nvim_win_set_width(0, 80)
  end,
})

autocmd("FileType", {
  desc = "Disable signcolumn in Avante",
  group = autogroup("avante_options", { clear = true }),
  pattern = { "Avante", "AvanteInput", "AvanteSelectedFiles" },
  callback = function()
    vim.opt.colorcolumn = ""
  end,
})

autocmd({ "FileType" }, {
  desc = "Change some vim.opt in lua files",
  group = autogroup("tma-lua-options", { clear = true }),
  pattern = "lua",
  callback = function()
    vim.opt.colorcolumn = "120"
  end,
})

autocmd({ "FileType" }, {
  desc = "Disable indentscope for certain filetypes",
  group = autogroup("indentscope_disable", { clear = true }),
  pattern = {
    "help",
    "trouble",
    "lazy",
    "mason",
    "notify",
    "spectre_panel",
    "bqf",
    "oil",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

autocmd({ "BufReadPost", "BufNewFile" }, {
  desc = "Register Angular treesitter parse to the file",
  group = autogroup("treesitter_angular_register", { clear = true }),
  pattern = { "*.component.html", "*.container.html", "*.dialog.html" },
  callback = function()
    vim.treesitter.start(nil, "angular")
  end,
})

autocmd("BufWinEnter", {
  desc = "Make some windows close with q",
  group = autogroup("quit_q", { clear = true }),
  callback = function(event)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = event.buf })
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = event.buf })
    if buftype == "nofile" or filetype == "help" then
      vim.keymap.set("n", "q", "<cmd>close<cr>", {
        desc = "Close window",
        buffer = event.buf,
        silent = true,
        nowait = true,
      })
    end
  end,
})

--[[ local dashboard = require "alpha.themes.dashboard"
local alpha_settings = autogroup("alpha_footer", { clear = true })
vim.api.nvim_create_autocmd("UIEnter", {
  desc = "Configure Alpha footer",
  group = alpha_settings,
  callback = function()
    local get_icon = require("utils.icons").get_icon
    local stats = require("lazy").stats()
    local ms = string.format("%.2f", stats.startuptime)
    dashboard.section.footer.val = {
      " ",
      " ",
      " ",
      get_icon("Bolt", 1)
        .. "Neovim loaded "
        .. stats.loaded
        .. "/"
        .. stats.count
        .. " plugins in "
        .. ms
        .. "ms "
        .. get_icon "Clock",
    }
    dashboard.section.footer.opts.hl = "NonText"
    pcall(cmd.AlphaRedraw)
  end,
}) ]]

--[[ autocmd({ "User" }, {
  desc = "Disable statusline for alpha",
  group = alpha_settings,
  pattern = "AlphaReady",
  callback = function()
    vim.b.ministatusline_disable = true
    vim.b.miniindentscope_disable = true
  end,
}) ]]

autocmd("FileType", {
  desc = "Set wordwrap and spell checking in git and markdown files",
  group = autogroup("wordwrap_spell", { clear = true }),
  pattern = { "gitcommit", "markdown", "mdx" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.spell = true
    vim.opt_local.colorcolumn = ""
  end,
})

autocmd("VimResized", {
  desc = "Resize tab on window resize",
  group = autogroup("window_resize", { clear = true }),
  callback = function()
    cmd "tabdo wincmd ="
  end,
})

autocmd("TextYankPost", {
  desc = "Configure highlight group and timeout for yank command",
  group = autogroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
  end,
})

autocmd("BufWinEnter", {
  desc = "Disable automatic comment on insert new line above/bellow with O/o",
  group = autogroup("auto_comment", { clear = true }),
  callback = function()
    cmd "set formatoptions-=cro"
  end,
})

```

# lua/code/keymaps.lua

```lua
-- Remap functions
function Vscode_terminalToogle()
  vim.fn.VSCodeNotify "workbench.action.terminal.toggleTerminal"
end
function Vscode_multiCursor()
  vim.fn.VSCodeNotify "editor.action.addSelectionToNextFindMatch"
end
function Vscode_comment()
  vim.fn.VSCodeNotify "editor.action.commentLine"
end
function Vscode_blockComment()
  vim.fn.VSCodeNotify "editor.action.blockComment"
end
function Vscode_saveFile()
  vim.fn.VSCodeNotify "workbench.action.files.save"
end
function Vscode_closeEditor()
  vim.fn.VSCodeNotify "workbench.action.closeActiveEditor"
end
function Vscode_showHover()
  vim.fn.VSCodeNotify "editor.action.showHover"
end
function Vscode_error()
  vim.fn.VSCodeNotify "editor.action.marker.next"
end
function Vscode_prevTab()
  vim.fn.VSCodeNotify "workbench.action.previousEditor"
end
function Vscode_nextTab()
  vim.fn.VSCodeNotify "workbench.action.nextEditor"
end
function Vscode_explorer()
  vim.fn.VSCodeNotify "workbench.view.explorer"
end
function Vscode_git_preview()
  vim.fn.VSCodeNotify "editor.action.dirtydiff.next"
end
function Vscode_search_and_replace()
  vim.fn.VSCodeNotify "workbench.action.findInFiles"
end

vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { silent = true }

-- vim remaps
keymap("v", "p", '"_dP', opts)
keymap("i", "kj", "<esc>", opts)

-- vscode remaps
keymap("v", "<leader>/", Vscode_blockComment)
keymap("n", "<leader>/", Vscode_comment)
keymap("n", "<leader>w", Vscode_saveFile)
keymap("n", "<leader>q", Vscode_closeEditor)
keymap("n", "K", Vscode_showHover)
keymap("n", "gl", Vscode_error)
keymap("n", "H", Vscode_prevTab)
keymap("n", "L", Vscode_nextTab)
keymap("n", "<leader>e", Vscode_explorer)
keymap("v", "<leader>n", Vscode_multiCursor)
keymap("n", "<leader>tt", Vscode_terminalToogle)
keymap("n", "<leader>gp", Vscode_git_preview)
keymap("n", "<leader>S", Vscode_search_and_replace)

```

# lua/code/options.lua

```lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.iskeyword:append "-"

```

# lua/highlight.lua

```lua
-- Reset the highlight group
-- This make `WinSeparator` the same color for any colorscheme
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#6e6a86", bg = "none" } )

-- Just link the highlight group to another
-- This help when you change the colorscheme
vim.cmd [[
	hi! link ColorColumn Visual
	hi! link LspInlayHint LineNr
]]

```

# lua/keymaps.lua

```lua
local map = require("utils.map").map

map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Open Lazy" }) -- Lazy
map("n", "<leader>N", "<cmd>NullLsInfo<cr>", { desc = "Null-ls information" }) -- NullLsInfo
map("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Open Lazy" }) -- Mason
map("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "[LSP]:Restart server" }) -- Restart Lsp
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Dismiss highlight in search" }) -- Clear highlight
map("n", "<leader>C", "<cmd>e $MYVIMRC<CR>", { desc = "GoTo configuration file" }) -- GoTo configuration file
map("v", "p", '"_dP', { desc = "Better paste" }) -- Better paste
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = "[LSP]Format file" }) -- format file

-- Navigation
map("n", "]b", "<cmd>bnext<CR>", { desc = "[BUFFER]:Next buffer" })
map("n", "[b", "<cmd>bprev<CR>", { desc = "[BUFFER]:Previous buffer" })

-- Resize buffer
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- Remap j and k
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })

-- Moving line up and down with alt-k and alt-j
map("n", "<M-j>", "V:m '>+1<CR>gv=gv<esc>", { desc = "Move line(s) upwards", silent = true })
map("n", "<M-k>", "V:m '<-2<CR>gv=gv<esc>", { desc = "Move line(s) downwards", silent = true })

-- NORMAL MODE --
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save buffer" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit neovim" })
map("n", "<localleader>r", "<cmd>source %<cr>", { desc = "Source init.lua" })

-- Split window
map("n", "|", "<cmd>vsplit<cr>", { desc = "Slipt window vertically" })
map("n", "-", "<cmd>split<cr>", { desc = "Slipt window vertically" })

-- Indentation
map("v", "<", "<gv", { desc = "Unindent line" })
map("v", ">", ">gv", { desc = "Indent line" })

```

# lua/lazy_init.lua

```lua
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  install = { colorscheme = { require("plugins.colorscheme").name } },
  ui = { wrap = "true" },
  change_detection = { enabled = false },
  debug = false,
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", -- Plugin for editing compressed files.
        "netrwPlugin", -- Handles file transfers and remote directory listing across a network
        "tarPlugin", -- Plugin for browsing tar files
        "tohtml", -- Converting a syntax highlighted file to HTML
        "tutor", -- Teaching?
        "zipPlugin", -- Handles browsing zipfiles
      },
    },
  },
})

```

# lua/options.lua

```lua
-- globals
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--- Netrw
vim.g.netrw_banner = 0

local opt = vim.opt

-- System stuff
opt.fileencoding = "utf-8"
opt.clipboard = "unnamedplus"

-- Savin' stuff
opt.backup = false
opt.swapfile = false
opt.undofile = true

-- UI stuff
opt.guifont = "monospace:h17"
opt.colorcolumn = "80"
opt.cmdheight = 1
opt.hlsearch = true
opt.showtabline = 0
opt.termguicolors = true
opt.laststatus = 3
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = false
opt.signcolumn = "yes"
opt.conceallevel = 2
opt.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Behavior
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showcmd = false
opt.showmode = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.inccommand = "split"
opt.iskeyword:append "-"

-- Plugins related stuff
opt.completeopt = { "menuone", "noselect" }

```

# lua/plugins/autopairs.lua

```lua
local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
}

function M.config()
  local status_ok, autopairs = pcall(require, "nvim-autopairs")
  if not status_ok then
    return
  end

  autopairs.setup {
    check_ts = true, -- treesitter integration
    disable_filetype = { "TelescopePrompt" },
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }
end

return M

```

# lua/plugins/avante.lua

```lua
local M = {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",
    {
      "saghen/blink.cmp",
      dependencies = {
        "Kaiser-Yang/blink-cmp-avante",
        -- ... Other dependencies
      },
      opts = {
        sources = {
          -- Add 'avante' to the list
          default = { "avante", "lsp", "path", "snippets", "buffer" },
          providers = {
            avante = {
              module = "blink-cmp-avante",
              name = "Avante",
              opts = {
                -- options for blink-cmp-avante
              },
            },
          },
        },
      },
    },
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

M.config = function()
  require("avante").setup {
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    provider = "copilot",
    auto_suggestions_provider = "claude",
    cursor_applying_provider = nil,
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      enable_token_counting = true, -- Whether to enable token counting. Default to true.
      enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
    },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = true },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right", -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 40, -- default % based on available width
      sidebar_header = {
        enabled = true, -- true, false to enable/disable the header
        align = "center", -- left, center, right for title
        rounded = true,
      },
      input = {
        prefix = "> ",
        height = 8, -- Height of the input window in vertical layout
      },
      edit = {
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
        start_insert = true, -- Start insert mode when opening the ask window
        border = "rounded",
        ---@type "ours" | "theirs"
        focus_on_apply = "ours", -- which diff to focus after applying
      },
    },
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
      override_timeoutlen = 500,
    },
    suggestion = {
      debounce = 600,
      throttle = 600,
    },
  }
end

return M

```

# lua/plugins/better-scape.lua

```lua
local M = {
  "max397574/better-escape.nvim",
  event = "InsertEnter",
  opts = {
    timeout = vim.o.timeoutlen,
    default_mappings = true,
    mappings = {
      i = {
        k = {
          j = "<Esc>",
        },
      },
    },
  },
}

return M

```

# lua/plugins/blink.lua

```lua
local M = {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = "default",
      ["<C-j>"] = { "snippet_forward", "fallback" },
      ["<C-k>"] = { "snippet_backward", "fallback" },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "normal",
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      documentation = { auto_show = true },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      ghost_text = {
        enabled = false,
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}

return M

```

# lua/plugins/clangd.lua

```lua
local M = {
  "p00f/clangd_extensions.nvim",
  commit = "b3b0eb798ecbdd16832fd38d4b07ba31ab4fe831", -- There's a bug after this commit
  ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}

M.config = function()
  local status_ok, clangd = pcall(require, "clangd_extensions")
  if not status_ok then
    return
  end

  local cmp_nvim_lsp = require "cmp_nvim_lsp"

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

  local on_attach = function(client, bufnr)
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(
      bufnr,
      "n",
      "gD",
      "<cmd>lua vim.lsp.buf.declaration()<CR>",
      { noremap = true, silent = true, desc = "GoTo declaration" }
    )
    keymap(
      bufnr,
      "n",
      "gd",
      "<cmd>lua vim.lsp.buf.definition()<CR>",
      { noremap = true, silent = true, desc = "GoTo definition" }
    )
    keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "Hover" })
    keymap(
      bufnr,
      "n",
      "gI",
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      { noremap = true, silent = true, desc = "GoTo implementation" }
    )
    keymap(
      bufnr,
      "n",
      "gr",
      "<cmd>lua vim.lsp.buf.references()<CR>",
      { noremap = true, silent = true, desc = "GoTo references" }
    )
    keymap(
      bufnr,
      "n",
      "gl",
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      { noremap = true, silent = true, desc = "Float diagnostic" }
    )
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", { noremap = true, silent = true, desc = "Lsp info" })
    keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", { noremap = true, silent = true, desc = "Mason" })
    keymap(
      bufnr,
      "n",
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      { noremap = true, silent = true, desc = "Code action" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lj",
      "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
      { noremap = true, silent = true, desc = "Next diagnostic" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lk",
      "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
      { noremap = true, silent = true, desc = "Previous diagnostic" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lr",
      "<cmd>lua vim.lsp.buf.rename()<cr>",
      { noremap = true, silent = true, desc = "Rename" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>ls",
      "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      { noremap = true, silent = true, desc = "Signature help" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lq",
      "<cmd>lua vim.diagnostic.setloclist()<CR>",
      { noremap = true, silent = true, desc = "Setloclist" }
    )

    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()

    -- compile (g++)
    keymap(bufnr, "n", "<leader>lc", "<cmd>!g++ %<CR>", { noremap = true, silent = true, desc = "Compile C/C++ code" })

    -- when using Microsoft style guide
    vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
    vim.opt.tabstop = 4 -- insert 4 spaces for a tab
    require("illuminate").on_attach(client)
  end

  Opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  clangd.setup {
    server = Opts,
    extensions = {
      -- defaults:
      -- Automatically set inlay hints (type hints)
      autoSetHints = vim.fn.has "nvim-0.10" ~= 1,
      -- These apply to the default ClangdSetInlayHints command
      inlay_hints = {
        inline = vim.fn.has "nvim-0.10" == 1,
        -- Options other than `highlight' and `priority' only work
        -- if `inline' is disabled
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refersh of the inlay hints.
        -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = "CursorHold",
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints
        highlight = "Comment",
        -- The highlight group priority for extmark
        priority = 100,
      },
      ast = {
        -- These are unicode, should be available in any font
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },

        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
        highlights = {
          detail = "Comment",
        },
      },
      memory_usage = {
        border = "none",
      },
      symbol_info = {
        border = "none",
      },
    },
  }
end

return M

```

# lua/plugins/colorizer.lua

```lua
local M = {
  "NvChad/nvim-colorizer.lua",
  event = "BufRead",
}

M.config = function()
  local status_ok, colorizer = pcall(require, "colorizer")
  if not status_ok then
    return
  end

  colorizer.setup {
    filetypes = {
      "*",
      -- "css",
      -- "html",
      -- typescript = { names = false, mode = "background" },
      -- javascript = { names = false, mode = "background" },
      -- tsx = { names = false, mode = "background" },
    },
    user_default_options = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = false, -- "Name" codes like Blue or blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      AARRGGBB = true, -- 0xAARRGGBB hex codes
      rgb_fn = false, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes for `mode`: foreground, background,  virtualtext
      mode = "background", -- Set the display mode.
      -- Available methods are false / true / "normal" / "lsp" / "both"
      -- True is same as normal
      tailwind = true, -- Enable tailwind colors
      -- parsers can contain values used in |user_default_options|
      sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
      virtualtext = "■",
      -- update color values even if buffer is not focused
      -- example use: cmp_menu, cmp_docs
      always_update = false,
    },
  }
end

return M

```

# lua/plugins/colorscheme.lua

```lua
if false then
  return {}
end

local colorschemes = {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      no_italic = true,
      term_colors = true,
      transparent_background = false,

      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = { "bold" },
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "bold", "italic" },
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    name = "kanagawa",
    opts = {
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
      theme = "dragon", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
      },
    },
  },
  {
    "rose-pine/neovim",
    lazy = false,
    name = "rose-pine",
    priority = 1000,
    opts = {
      variant = "main", -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    name = "tokyonight",
    opts = {
      style = "night",
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup {
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      }
    end,
  },
}

for _, v in pairs(colorschemes) do
  if v.name == vim.g.colorscheme then
    return v
  end
end

```

# lua/plugins/comments.lua

```lua
local M = {
  "numToStr/Comment.nvim",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}

M.config = function()
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    return
  end
  local map = require("utils.map").map

  comment.setup {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
      ---Line-comment toggle keymap
      line = "gcc",
      ---Block-comment toggle keymap
      block = "gbc",
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      ---Line-comment keymap
      line = "gc",
      ---Block-comment keymap
      block = "gb",
    },
    ---LHS of extra mappings
    extra = {
      ---Add comment on the line above
      above = "gcO",
      ---Add comment on the line below
      below = "gco",
      ---Add comment at the end of line
      eol = "gcA",
    },
    ---Enable keybindings
    -- NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
    },

    pre_hook = function(ctx)
      -- Only calculate commentstring for tsx filetypes
      if vim.bo.filetype == "typescriptreact" then
        local U = require "Comment.utils"

        -- Determine whether to use linewise or blockwise commentstring
        local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

        -- Determine the location where to calculate commentstring from
        local location = nil
        if ctx.ctype == U.ctype.blockwise then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
          key = type,
          location = location,
        }
      end
    end,
  }

  -- Extra mappings
  map("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
  end, { desc = "[COMMENT]:Toggle comment line" })
  map(
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = "[COMMENT]:Toggle comment for selection" }
  )
end

return M

```

# lua/plugins/conform.lua

```lua
local M = {
  "stevearc/conform.nvim",
  event = { "BufRead", "BufReadPost" },
}

M.config = function()
  local status_ok, conform = pcall(require, "conform")
  if not status_ok then
    return
  end

  local map = require("utils.map").map
  conform.setup {
    formatters_by_ft = {
      -- Comform will stop after the first
      lua = { "stylua", stop_after_first = true },
      python = { "black", stop_after_first = true },
      javascript = { "prettierd", stop_after_first = true },
      javascriptreact = { "prettierd", stop_after_first = true },
      typescript = { "prettierd", stop_after_first = true },
      typescriptreact = { "prettierd", stop_after_first = true },
      html = { "prettierd", stop_after_first = true },
      css = { "prettierd", stop_after_first = true },
      scss = { "prettierd", stop_after_first = true },
      php = { "pint", stop_after_first = true },
      blade = { "prettierd", stop_after_first = true },
      -- blade = { "blade-formatter", stop_after_first = true },
      -- Comform will run multiple formatters sequentially
      go = { "gofumpt", "goimports" },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    end,
  }

  -- Create user commands to enable and disable `format_on_save`
  vim.api.nvim_create_user_command("FormatDisable", function(args)
    -- If you run `FormatDisable!` disable `format_on_save`
    -- only for the current buffer
    if args.bang then
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
  end, {
    desc = "Disable autoformat-on-save",
    bang = true,
  })

  vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
  end, {
    desc = "Re-enable autoformat-on-save",
  })

  -- Map the keymap for FormatEnable and FormatDisable
  map("n", "<localleader>tf", function()
    if vim.g.disable_autoformat or vim.b.disable_autoformat then
      Snacks.notify "[COMFORM] Format on save on!"
      vim.cmd "FormatEnable"
    else
      Snacks.notify "[COMFORM] Format on save off!"
      vim.cmd "FormatDisable"
    end
  end, { desc = "Toggle autoformat" })
end

return M

```

# lua/plugins/copilot.lua

```lua
local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
}

M.config = function()
  require("copilot").setup {
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "bottom", -- | top | left | right | horizontal | vertical
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = false,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = "<C-Down>",
        accept_word = "<C-Up>",
        accept_line = "<C-Right>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 18.x
    server_opts_overrides = {},
  }

  -- keymaps
  local map = require("utils.map").map
  map("n", "<leader>ct", function()
    if not vim.g.copilot_auto_trigger then
      Snacks.notify "Copilot auto suggestion ON!"
      vim.g.copilot_auto_trigger = true
    else
      Snacks.notify "Copilot auto suggestion OFF!"
      vim.g.copilot_auto_trigger = false
    end
    require("copilot.suggestion").toggle_auto_trigger()
  end, { desc = "[COPILOT]: Toggle auto trigger" })
end

return M

```

# lua/plugins/fidget.lua

```lua
local M = {
  "j-hui/fidget.nvim",
  event = { "BufRead", "BufReadPre" },
  opts = {},
}

return M

```

# lua/plugins/gitsigns.lua

```lua
local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
}

M.opts = {
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "-" },
    topdelete = { text = "-" },
    changedelete = { text = "~-" },
    untracked = { text = "#" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 200,
    ignore_whitespace = true,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
}

M.config = function(_, opts)
  require("gitsigns").setup(opts)

  local function map(mode, lhs, rhs, keymap_opt)
    opts = vim.tbl_extend("force", { noremap = true, silent = true }, keymap_opt or {})
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- Navigation
  map("n", "]g", "<cmd>Gitsigns next_hunk<cr>", { desc = "[GIT]:Next hunk" })
  map("n", "[g", "<cmd>Gitsigns prev_hunk<cr>", { desc = "[GIT]:Previous hunk" })

  -- Actions
  map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "[GIT]:Stage hunk" })
  map("v", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "[GIT]:Stage selected hunk" })
  map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "[GIT]:Reset hunk" })
  map("v", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "[GIT]:Reset selected hunk" })
  map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "[GIT]:Stage buffer" })
  map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "[GIT]:Undo stage hunk" })
  map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "[GIT]:Reset Buffer" })
  map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "[GIT]:Preview hunk" })
  map("n", "<leader>gb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { desc = "[GIT]:Blame line" })
  map("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[GIT]:Blame line toggle" })
  map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "[GIT]:Git diff" })
  map("n", "<leader>gD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', { desc = "[GIT]:diff" })
  map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "[GIT]:Toggle delete" })
end

return M

```

# lua/plugins/harpoon.lua

```lua
local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "mm",
      function()
        require("harpoon"):list():add()
      end,
      desc = "[HARPOON]:This file",
    },
    {
      "<tab>",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "[HARPOON]:Open",
    },
    {
      "<localleader>a",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "[HARPOON]:1",
    },
    {
      "<localleader>s",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "[HARPOON]:2",
    },
    {
      "<localleader>d",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "[HARPOON]:3",
    },
    {
      "<localleader>f",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "[HARPOON]:4",
    },
    {
      "<localleader>q",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "[HARPOON]:5",
    },
    {
      "<localleader>w",
      function()
        require("harpoon"):list():select(6)
      end,
      desc = "[HARPOON]:6",
    },
    {
      "<localleader>e",
      function()
        require("harpoon"):list():select(7)
      end,
      desc = "[HARPOON]:7",
    },
    {
      "<localleader>r",
      function()
        require("harpoon"):list():select(8)
      end,
      desc = "[HARPOON]:8",
    },
    {
      "[h",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "[HARPOON]:prev",
    },
    {
      "]h",
      function()
        require("harpoon"):list():next()
      end,
      desc = "[HARPOON]:next",
    },
  },
  opts = {},
}

return M

```

# lua/plugins/jdtls.lua

```lua
local M = {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
}

M.opts = function()
  -- calculate workspace dir
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = "/home/tma/.local/share/nvim/site/java/workspace-root/" .. project_name
  os.execute("mkdir " .. workspace_dir)

  -- get the current OS
  local os
  if vim.fn.has "mac" == 1 then
    os = "mac"
  elseif vim.fn.has "unix" == 1 then
    os = "linux"
  elseif vim.fn.has "win32" == 1 then
    os = "win"
  end

  -- ensure that OS is valid
  if not os or os == "" then
    print "[jdtls] Could not detect valid OS"
  end

  local on_attach = function(client, bufnr)
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(
      bufnr,
      "n",
      "gD",
      "<cmd>lua vim.lsp.buf.declaration()<CR>",
      { noremap = true, silent = true, desc = "GoTo declaration" }
    )
    keymap(
      bufnr,
      "n",
      "gd",
      "<cmd>lua vim.lsp.buf.definition()<CR>",
      { noremap = true, silent = true, desc = "GoTo definition" }
    )
    keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "Hover" })
    keymap(
      bufnr,
      "n",
      "gI",
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      { noremap = true, silent = true, desc = "GoTo implementation" }
    )
    keymap(
      bufnr,
      "n",
      "gr",
      "<cmd>lua vim.lsp.buf.references()<CR>",
      { noremap = true, silent = true, desc = "GoTo references" }
    )
    keymap(
      bufnr,
      "n",
      "gl",
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      { noremap = true, silent = true, desc = "Float diagnostic" }
    )
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", { noremap = true, silent = true, desc = "Lsp info" })
    keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", { noremap = true, silent = true, desc = "Mason" })
    keymap(
      bufnr,
      "n",
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      { noremap = true, silent = true, desc = "Code action" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lj",
      "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
      { noremap = true, silent = true, desc = "Next diagnostic" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lk",
      "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
      { noremap = true, silent = true, desc = "Previous diagnostic" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lr",
      "<cmd>lua vim.lsp.buf.rename()<cr>",
      { noremap = true, silent = true, desc = "Rename" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>ls",
      "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      { noremap = true, silent = true, desc = "Signature help" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lq",
      "<cmd>lua vim.diagnostic.setloclist()<CR>",
      { noremap = true, silent = true, desc = "Setloclist" }
    )

    keymap(
      bufnr,
      "n",
      "<leader>lo",
      "<Cmd>lua require('jdtls').organize_imports()<CR>",
      { noremap = true, silent = true, desc = "Organize imports" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>le",
      "<Cmd>lua require('jdtls').extract_variable()<CR>",
      { noremap = true, silent = true, desc = "Extract variable" }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lc",
      "<Cmd>lua require('jdtls').extract_constant()<CR>",
      { noremap = true, silent = true, desc = "Extract constant" }
    )

    -- compile (javac)
    keymap(
      bufnr,
      "n",
      "<leader>lc",
      "<Cmd>!javac -d bin src/**/*.java<CR>",
      { noremap = true, silent = true, desc = "Compile java code" }
    )

    require("illuminate").on_attach(client)
  end

  local defaults = {
    cmd = {
      -- 💀
      "java", -- or '/path/to/java17_or_newer/bin/java'
      -- depends on if `java` is in your $PATH env variable and if it points to the right version.
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-javaagent:" .. vim.fn.expand "$MASON/packages/jdtls/lombok.jar",
      "-Xmx1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      -- 💀
      "-jar",
      -- org.eclipse.equinox.launcher_1.6.500.v20230717-2134
      "/home/tma/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",

      -- 💀
      "-configuration",
      "/home/tma/.local/share/nvim/mason/packages/jdtls/config_linux/",
      "-data",
      workspace_dir,
    },

    -- 💀
    root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" },

    settings = {
      java = {},
    },

    init_options = {
      bundles = {},
    },
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
  }

  return defaults
end

M.config = function(_, opts)
  -- setup autocmd on filetype detect java
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = "java", -- autocmd to start jdtls
    callback = function()
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4
      if opts.root_dir and opts.root_dir ~= "" then
        require("jdtls").start_or_attach(opts)
      else
        print "[jdtls] Root_dir not found. Please specify a root marker"
      end
    end,
  })
end

return M

```

# lua/plugins/laravel.lua

```lua
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

```

# lua/plugins/lspconfig.lua

```lua
local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre" },
  dependencies = {
    "saghen/blink.cmp",
    "folke/trouble.nvim",
    "RRethy/vim-illuminate",
  },
}

function M.config()
  -- lspconfig
  local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status_ok then
    return
  end

  -- illuminate setup
  local denylist = require "utils.lsp.illuminate-denylist"
  require("illuminate").configure(denylist)

  -- utils
  local get_icon = require("utils.icons").get_icon
  local servers = require("utils.servers").servers
  local on_attach = require("utils.lsp.utils").on_attach

  -- capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = require("blink.cmp").get_lsp_capabilities()
  ---------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------------------
  -- LSP Servers
  ---------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------------------
  for _, server in pairs(servers) do
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    server = vim.split(server, "@")[1]

    -- create a folder `lua.settings.server_name` and return a table with the
    -- apropiate configuration
    local require_ok, conf_opts = pcall(require, "settings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    -- Jump emmet-ls config
    if server == "emmet_ls" then
      goto continue
    end

    if server == "intelephense" then
      opts.InitializeParams = {
        initializationOptions = "/home/tma/intelephense/licence.txt",
      }
    end

    -- Jump java-language-server config
    if server == "jdtls" then
      goto continue
    end

    -- Jump clang config
    if server == "clangd" then
      goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
  end
  ---------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------------------

  ---------------------------------------------------------------------------------------------------------------------
  -- emmet_ls
  ---------------------------------------------------------------------------------------------------------------------
  lspconfig.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "astro",
      "handlebars",
      "css",
      "eruby",
      "html",
      "htmldjango",
      "javascriptreact",
      "less",
      "pug",
      "sass",
      "scss",
      "svelte",
      "typescriptreact",
      "vue",
      "htmlangular",
      "php",
      "blade",
    },
  }
  ---------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------------------

  ---------------------------------------------------------------------------------------------------------------------
  -- Angular
  ---------------------------------------------------------------------------------------------------------------------
  --  WARNING: Change the path to `ng_lib` and `ng_bin`, if needed
  local ng_lib =
    "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/lib/node_modules/@angular/language-server"
  local ng_bin = "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/bin/ngserver"
  local cmd = { ng_bin, "--stdio", "--tsProbeLocations", ng_lib, "--ngProbeLocations", ng_lib }

  require("lspconfig").angularls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
      -- new_config.cmd = cmd
      new_config.cmd = {
        "ngserver",
        "--stdio",
        "--tsProbeLocations",
        ng_lib .. "," .. new_root_dir,
        "--ngProbeLocations",
        ng_lib .. "," .. new_root_dir,
      }
    end,
  }
  ---------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------------------

  ---------------------------------------------------------------------------------------------------------------------
  -- Astro
  ---------------------------------------------------------------------------------------------------------------------
  --  WARNING: Change the path to `astro_bin`, if needed
  local astro_bin = "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/bin/astro-ls"
  local astro_cmd = { astro_bin, "--stdio" }

  require("lspconfig").astro.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = astro_cmd,
  }
  ---------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------------------

  local signs = {
    { name = "DiagnosticSignError", text = get_icon "BoldError" },
    { name = "DiagnosticSignWarn", text = get_icon "BoldWarning" },
    { name = "DiagnosticSignHint", text = get_icon "BoldHint" },
    { name = "DiagnosticSignInfo", text = get_icon "BoldInformation" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "single",
      source = "always",
      header = "",
      prefix = "",
      suffix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
  })
end

return M

```

# lua/plugins/markdown-preview.lua

```lua
local M = {
  "iamcco/markdown-preview.nvim",
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "[MARKDOWN]:Open preview on the browser" },
    { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "[MARKDOWN]:Toggle preview" },
    { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "[MARKDOWN]:Stop preview" },
  },
}

return M

```

# lua/plugins/mason.lua

```lua
local M = {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
  },
  opts = {
    ui = {
      border = "none",
      width = 0.8,
      height = 0.8,
      icons = {
        package_installed = "◍",
        package_pending = "◍",
        package_uninstalled = "◍",
      },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
  },
}

function M.config(_, opts)
  local status_ok, mason = pcall(require, "mason")
  if not status_ok then
    return
  end
  local servers = require("utils.servers").servers

  mason.setup(opts)
  require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_installation = true,
  }
end

return M

```

# lua/plugins/mini.lua

```lua
local M = {
  "echasnovski/mini.nvim", -- Collection of various small independent plugins/modules
  event = "VeryLazy",
  config = function()
    local get_icon = require("utils.icons").get_icon

    require("mini.ai").setup { n_lines = 500 }
    require("mini.indentscope").setup {
      symbol = get_icon "LineLeft",
    }
    require("mini.surround").setup {}

    local statusline = require "mini.statusline"
    statusline.setup {
      use_icons = true,
      set_vim_settings = false,
    }
    statusline.section_location = function()
      return "%2l:%-2v"
    end
    statusline.section_filename = function()
      local modified = vim.bo.modified
      return get_icon("File", 1) .. "%f%r" .. " " .. (modified and get_icon("Modified", 1) or "")
    end
  end,
}

return M

```

# lua/plugins/neotree.lua

```lua
local M = {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "[NEOTREE]:Toggle explorer" },
  },
  branch = "v3.x",
}

M.config = function()
  local status_ok, neo_tree = pcall(require, "neo-tree")
  if not status_ok then
    return
  end

  local get_icon = require("utils.icons").get_icon
  local map = require("utils.map").map

  neo_tree.setup {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    event_handlers = {
      {
        event = "neo_tree_popup_input_ready",
        ---@param args { bufnr: integer, winid: integer }
        handler = function(args)
          vim.cmd "stopinsert"
          vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
        end,
      },
    },
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil, -- use a custom function for sorting files and directories in the tree
    -- sort_function = function (a,b)
    --       if a.type == b.type then
    --           return a.path > b.path
    --       else
    --           return a.type > b.type
    --       end
    --   end , -- this sorts files and directories descendantly
    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = get_icon "LineMiddle",
        last_indent_marker = get_icon "LastIndentMarker",
        highlight = "NeoTreeIndentMarker",
        -- expander config, needed for nesting files
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = get_icon "ChevronRight",
        expander_expanded = get_icon "ChevronDown",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = get_icon "Folder",
        folder_open = get_icon "FolderOpen",
        folder_empty = get_icon "EmptyFolderOpen",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = get_icon "Modified", -- symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = get_icon "FileDeleted", -- this can only be used in the git_status source
          renamed = get_icon "FileRenamed", -- this can only be used in the git_status source
          -- Status type
          untracked = get_icon "FileUntracked",
          ignored = get_icon "FileIgnored",
          unstaged = get_icon "FileUnstaged",
          staged = get_icon "FileStaged",
          conflict = get_icon "FileUnmerged",
        },
      },
    },
    -- A list of functions, each representing a global custom command
    -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
    -- see `:h neo-tree-custom-commands-global`
    commands = {
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
      copy_selector = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local results = {
          e = { val = modify(filename, ":e"), msg = "Extension only" },
          f = { val = filename, msg = "Filename" },
          F = { val = modify(filename, ":r"), msg = "Filename w/o extension" },
          h = { val = modify(filepath, ":~"), msg = "Path relative to Home" },
          p = { val = modify(filepath, ":."), msg = "Path relative to CWD" },
          P = { val = filepath, msg = "Absolute path" },
        }

        local messages = {
          { "\nChoose to copy to clipboard:\n", "Normal" },
        }
        for i, result in pairs(results) do
          if result.val and result.val ~= "" then
            vim.list_extend(messages, {
              { ("%s."):format(i), "Identifier" },
              { (" %s: "):format(result.msg) },
              { result.val, "String" },
              { "\n" },
            })
          end
        end
        vim.api.nvim_echo(messages, false, {})
        local result = results[vim.fn.getcharstr()]
        if result and result.val and result.val ~= "" then
          print(("Copied: `%s`"):format(result.val))
          vim.fn.setreg("+", result.val)
        end
      end,
    },
    window = {
      position = "right",
      width = 30,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<enter>"] = {
          "open",
          nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
        ["<2-LeftMouse>"] = "open",
        ["o"] = "open",
        ["<esc>"] = "cancel", -- close preview or floating neo-tree window
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["l"] = "child_or_open",
        ["h"] = "parent_or_close",
        ["Y"] = "copy_selector",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["t"] = "open_tabnew",
        -- ["<cr>"] = "open_drop",
        -- ["t"] = "open_tab_drop",
        ["w"] = "open_with_window_picker",
        --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
        ["C"] = "close_node",
        -- ['C'] = 'close_all_subnodes',
        ["z"] = "close_all_nodes",
        --["Z"] = "expand_all_nodes",
        ["a"] = {
          "add",
          -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = "none", -- "none", "relative", "absolute"
          },
        },
        ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
        -- ["c"] = {
        --  "copy",
        --  config = {
        --    show_path = "none" -- "none", "relative", "absolute"
        --  }
        --}
        ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
      },
    },
    nesting_rules = {},
    filesystem = {
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = true, -- only works on Windows for hidden files/directories
        hide_by_name = {
          --"node_modules"
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".DS_Store",
          --"thumbs.db"
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
      follow_current_file = {
        enabled = false, -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      group_empty_dirs = false, -- when true, empty folders will be grouped together
      hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      -- in whatever position is specified in window.position
      -- "open_current",  -- netrw disabled, opening a directory opens within the
      -- window like netrw would, regardless of window.position
      -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
      use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
      -- instead of relying on nvim autocmd events.
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
          -- ["D"] = "fuzzy_sorter_directory",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
          ["<down>"] = "move_cursor_down",
          ["<C-n>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-p>"] = "move_cursor_up",
        },
      },

      commands = {}, -- Add a custom command or override a global one using the same function name
    },
    buffers = {
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --              -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      show_unloaded = true,
      window = {
        mappings = {
          ["bd"] = "buffer_delete",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
        },
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        },
      },
    },
  }
end

return M

```

# lua/plugins/nonels.lua

```lua
local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
}

function M.config()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    return
  end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      -- require("none-ls.diagnostics.eslint_d").with {
      --   condition = function(utils)
      --     return utils.root_has_file { ".eslintrc.json", ".eslintrc.js", "eslint.config.js" }
      --   end,
      -- },
      -- require("none-ls.formatting.eslint_d").with {
      --   condition = function(utils)
      --     return utils.root_has_file { ".eslintrc.json", ".eslintrc.js", "eslint.config.js" }
      --   end,
      -- },
      formatting.prettierd.with {
        extra_filetypes = { "toml", "astro", "blade" },
      },
      -- formatting.blade_formatter,

      -- Lua
      formatting.stylua,

      -- Php
      formatting.phpcsfixer,

      -- Golang
      formatting.gofumpt,
      formatting.goimports,
      diagnostics.golangci_lint,

      -- Python
      formatting.black.with { extra_args = { "--fast" } },
      require "none-ls.diagnostics.flake8",
    },
  }
end

return M

```

# lua/plugins/nvim-dev-icons.lua

```lua
local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}

function M.config()
  local status_ok, devicons = pcall(require, "nvim-web-devicons")
  if not status_ok then
    return
  end

  local get_icon = require("utils.icons").get_icon

  devicons.setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
      },
    },
    color_icons = true,
    default = true,
    override_by_filename = {
      ["go.sum"] = {
        icon = "",
        color = "#126B81",
        name = "go",
      },
      ["go.mod"] = {
        icon = "",
        color = "#126B81",
        name = "go",
      },
      [".gitignore"] = {
        icon = get_icon "Git",
        color = "#f1502f",
        name = "Gitignore",
      },
      [".gitkeep"] = {
        icon = get_icon "Git",
        color = "#f1502f",
        name = "Gitignore",
      },
      [".luacheckrc"] = {
        icon = get_icon "Lua",
        color = "#51A0CF",
        name = "Luacheck",
      },
      [".eslintrc.json"] = {
        icon = get_icon "Eslint",
        color = "#4b32c3",
        name = "Eslintrc",
      },
      [".eslintignore"] = {
        icon = get_icon "Eslint",
        color = "#4b32c3",
        name = "Eslintignore",
      },
      [".env.example"] = {
        icon = get_icon "Env",
        color = "#fcf003",
        name = "Env_example",
      },
      [".env.production"] = {
        icon = get_icon "Env",
        color = "#fcf003",
        name = "Env_prod",
      },
      [".env.development"] = {
        icon = get_icon "Env",
        color = "#fcf003",
        name = "Env_dev",
      },
    },
    override_by_extension = {
      ["json"] = {
        icon = get_icon "Json",
        color = "#fcf003",
        name = "JSON",
      },
      ["java"] = {
        icon = get_icon "Coffe",
        color = "#FB1A00",
        name = "Java",
      },
      ["class"] = {
        icon = get_icon "Coffe",
        color = "#4A61EA",
        name = "Java_bytecode",
      },
      ["js"] = {
        icon = get_icon "Javascript",
        color = "#F0DB4F",
        name = "Javascript",
      },
      ["mjs"] = {
        icon = get_icon "Javascript",
        color = "#F0DB4F",
        name = "Michael_Jackson_script",
      },
      ["ts"] = {
        -- FIX: Icon small
        icon = get_icon "Typescript",
        color = "#007acc",
        name = "Typescript",
      },
      ["astro"] = {
        icon = get_icon "Astro",
        color = "#FF6900",
        name = "Astro",
      },
      ["hbs"] = {
        icon = get_icon "Mustache",
        color = "#FF6900",
        name = "handlebars",
      },
    },
  }
end

return M

```

# lua/plugins/oil.lua

```lua
local M = {
  "stevearc/oil.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    keymaps = {
      ["<C-c>"] = false,
      ["<leader>e"] = "actions.close",
    },
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Oil<cr>", -- Add the flag --float to open in a float window
      desc = "[OIL]:Open",
    },
  },
}

return M

```

# lua/plugins/snacks.lua

```lua
local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  keys = {
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Lazygit Current File History",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<c-/>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<c-_>",
      function()
        Snacks.terminal()
      end,
      desc = "which_key_ignore",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win {
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        }
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>us"
        Snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
        Snacks.toggle.diagnostics():map "<leader>ud"
        Snacks.toggle.line_number():map "<leader>ul"
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map "<leader>uc"
        Snacks.toggle.treesitter():map "<leader>uT"
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map "<leader>ub"
        Snacks.toggle.inlay_hints():map "<leader>uh"
      end,
    })
  end,
}

return M

```

# lua/plugins/tailwind-fold.lua

```lua
local M = {
  "razak17/tailwind-fold.nvim",
  opts = {},
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
}

return M

```

# lua/plugins/telescope.lua

```lua
local M = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VeryLazy",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "[TELESCOPE]:Find files" },
    { "<localleader>g", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "[TELESCOPE]:Find files" },
    { "<leader>;", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "[TELESCOPE]:List buffers" },
    { "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "[TELESCOPE]:Find words" },
    { "<leader>fg", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "[TELESCOPE]:Find under cursor" },
    { "<leader>f'", "<cmd>lua require('telescope.builtin').marks()<cr>", desc = "[TELESCOPE]:Find marks" },
    {
      "<leader>fc",
      "<cmd>lua require('telescope.builtin').grep_string()<cr>",
      desc = "[TELESCOPE]:Find word under cursor",
    },
    { "<leader>fC", "<cmd>lua require('telescope.builtin').commands()<cr>", desc = "[TELESCOPE]:Find commands" },
    { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "[TELESCOPE]:Find help" },
    { "<leader>fH", "<cmd>lua require('telescope.builtin').highlights()<cr>", desc = "[TELESCOPE]:Find highlights" },
    { "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = "[TELESCOPE]:List keymaps" },
    { "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", desc = "[TELESCOPE]:Find man" },
    { "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "[TELESCOPE]:Find old files" },
    { "<leader>fr", "<cmd>lua require('telescope.builtin').registers()<cr>", desc = "[TELESCOPE]:Find registers" },
    {
      "<leader>f<CR>",
      "<cmd>lua require('telescope.builtin').resume()<cr>",
      desc = "[TELESCOPE]:Resume previous search",
    },
    {
      "<leader>f.",
      "<cmd>lua require('telescope.builtin').find_files { hidden = true, no_ignore = true }<cr>",
      desc = "[TELESCOPE]:Find all files",
    },
    {
      "<leader>f/",
      "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
      desc = "[TELESCOPE]:Find words in current buffer",
    },
  },
}

M.config = function()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    return
  end

  local get_icon = require("utils.icons").get_icon
  local actions = require "telescope.actions"

  telescope.setup {
    defaults = {
      prompt_prefix = get_icon("Telescope", 2),
      selection_caret = get_icon("Selected", 1),
      path_display = { "smart" },
      file_ignore_patterns = { ".git/", "node_modules", "^docs/", "**/*.svg", "^svg/", "**/*.png", "**/*.jpg" },
      mappings = {
        i = {
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          [";"] = actions.close,
        },
        n = {
          [";"] = actions.close,
        },
      },
      -- layout_strategy = "vertical",
      layout_config = {
        height = 0.75,
        width = 0.65,
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      preview = true,
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
        previewer = true,
      },
      grep_string = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      find_files = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
      marks = {
        theme = "dropdown",
        previewer = true,
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {},
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          -- even more opts
          -- selection_caret = " ",
        },
      },
    },
  }
  telescope.load_extension "ui-select"
  telescope.load_extension "fzf"
end

return M

```

# lua/plugins/todo-comments.lua

```lua
local M = {
  "folke/todo-comments.nvim",
  event = "BufReadPre",
  opts = {
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "󰓅 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󱞁 ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
      fg = "NONE", -- The gui style to use for the fg highlight group.
      bg = "BOLD", -- The gui style to use for the bg highlight group.
    },
    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
      multiline = false, -- enable multine todo comments
      multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
      multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
      before = "", -- "fg" or "bg" or empty
      keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
      after = "fg", -- "fg" or "bg" or empty
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
      comments_only = true, -- uses treesitter to match keywords in comments only
      max_line_len = 400, -- ignore lines longer than this
      exclude = {}, -- list of file types to exclude highlighting
    },
    -- list of named colors where we try to extract the guifg from the
    -- list of highlight groups or use the hex color if hl not found as a fallback
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" },
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
  },
}

-- WARN: is `config` function really necessary in this case?!?!
M.config = function(_, opts)
  local status_ok, todo_comments = pcall(require, "todo-comments")
  if not status_ok then
    return
  end
  todo_comments.setup(opts)
end

return M

```

# lua/plugins/treesitter.lua

```lua
local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPre",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/playground",
  },
}

local parsers = {
  "javascript",
  "typescript",
  "python",
  "angular",
  "html",
  "css",
  "prisma",
  "lua",
  "bash",
  "go",
}

M.config = function()
  local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  local map = require("utils.map").map

  map("n", "<leader>tp", "<cmd>TSPlaygroundToggle<cr>", { desc = "[TS]:Playground toggle" })
  map("n", "<leader>tuc", "<cmd>TSHighlightCapturesUnderCursor<cr>", { desc = "[TS]:Playground toggle" })

  treesitter.setup {
    ensure_installed = parsers,
    auto_install = true,
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
  }

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.blade = {
    install_info = {
      url = "https://github.com/EmranMR/tree-sitter-blade",
      files = { "src/parser.c" },
      branch = "main",
    },
    filetype = "blade",
  }

  vim.filetype.add {
    pattern = {
      [".*%.blade%.php"] = "blade",
    },
  }
end

return M

```

# lua/plugins/trouble.lua

```lua
local M = {
  "folke/trouble.nvim",
  opts = {
    auto_close = true, -- auto close when there are no items
    focus = true, -- Focus the window when opened
    indent_guides = true, -- show indent guides
    pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
    warn_no_results = true, -- show a warning when there are no results
    open_no_results = false, -- open the trouble window when there are no results
  },
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[TROUBLE]:Diagnostics",
    },
    {
      "<leader>tb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "[TROUBLE]:Buffer Diagnostics",
    },
    {
      "<leader>ts",
      "<cmd>Trouble lsp_document_symbols toggle win.position=right win.size.width=86<cr>",
      desc = "[TROUBLE]:Symbols",
    },
    {
      "<leader>tl",
      "<cmd>Trouble lsp toggle win.position=right win.size.width=86<cr>",
      desc = "[TROUBLE]:LSP Definitions / references / ...",
    },
    {
      "<leader>tq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "[TROUBLE]:Quickfix List",
    },
  },
}

return M

```

# lua/plugins/vim-tmux-navigator.lua

```lua
local M = {
  "christoomey/vim-tmux-navigator",
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "[TMUX]:Move to left split" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "[TMUX]:Move to below split" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "[TMUX]:Move to above split" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "[TMUX]:Move to right split" },
  },
}

M.config = function()
  local status_ok, vtn = pcall(require, "vim-tmux-navigator")
  if not status_ok then
    return
  end
  vtn.setup {}
end

return M

```

# lua/settings/lua_ls.lua

```lua
-- https://luals.github.io/wiki/settings/
return {
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      diagnostics = {
        globals = { "vim", "spec" },
      },
      runtime = {
        version = "LuaJIT",
        special = {
          spec = "require",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      hint = {
        enable = true,
        arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
        await = true,
        paramName = "All", -- "All" | "Literal" | "Disable"
        paramType = false,
        semicolon = "All", -- "All" | "SameLine" | "Disable"
        setType = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

```

# lua/settings/pyright.lua

```lua
-- The Pyright language server honors the following settings.
-- References: https://microsoft.github.io/pyright/#/settings
return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
}


```

# lua/settings/tsserver.lua

```lua
return {
  settings = {
    typescript = {
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
        showOnAllFunctions = true,
      },
      inlayHints = {
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = false,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = false,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
        showOnAllFunctions = true,
      },
    },
  },
}

```

# lua/terminal.lua

```lua
-- Terminal setup
local M = {
	height = 15,
	window = nil,
	buffer = nil,
	job_id = nil,
}

function M.open(cwd)
	if vim.fn.win_gotoid(M.window) == 0 then
		vim.cmd("new")
		vim.cmd("setlocal nonumber")
		vim.cmd("setlocal norelativenumber")
		vim.cmd("setlocal signcolumn=no")
		vim.cmd("setlocal nobuflisted")
		M.window = vim.fn.win_getid()
	end
	vim.api.nvim_win_set_height(M.window, M.height)

	if vim.fn.bufexists(M.buffer) == 0 then
		local job_id = nil
		M.buffer = vim.fn.bufnr("%")
		M.job_id = vim.fn.termopen(vim.o.shell, {
			cwd = cwd or vim.fn.getcwd(),
			detach = true,
			on_exit = function()
				if M.job_id == job_id then
					M.destroy()
				end
			end,
		})
		job_id = M.job_id
	else
		vim.cmd("buffer " .. M.buffer)
	end
end

function M.hide()
	M.height = vim.api.nvim_win_get_height(M.window)
	vim.api.nvim_win_hide(M.window)
end

function M.destroy()
	if vim.fn.win_gotoid(M.window) ~= 0 then
		M.height = vim.api.nvim_win_get_height(M.window)
	end
	if vim.fn.bufexists(M.buffer) == 1 then
		vim.api.nvim_buf_delete(M.buffer, { force = true })
	end

	M.window = nil
	M.buffer = nil
	M.job_id = nil
end

function M.exec(cwd, cmd)
	M.destroy()
	M.open(cwd)
	vim.fn.chansend(M.job_id, cmd .. "\n")
	vim.cmd("wincmd p")
end

vim.api.nvim_create_user_command("TerminalOpen", function() M.open(nil) end, {})
vim.api.nvim_create_user_command("TerminalHide", M.hide, {})
vim.api.nvim_create_user_command("TerminalDestroy", M.destroy, {})

-- Toggle
vim.keymap.set("", "<C-\\>", ":TerminalOpen<CR>:startinsert<CR>", { silent = true })
vim.keymap.set("i", "<C-\\>", "<Esc>:TerminalOpen<CR>:startinsert<CR>", { silent = true })
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>:TerminalHide<CR>", { silent = true })

-- Close
vim.keymap.set("t", "<leader>q", "<C-\\><C-n>:TerminalDestroy<CR>", { silent = true })
-- Exit terminal mode
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { silent = true })

-- Move cursor to the end of line, specific to zsh
vim.keymap.set("t", "<Tab>", "<Tab>")
vim.keymap.set("t", "<C-i>", "\x1b[105;5u")

return M

```

# lua/utils/alpha-helper.lua

```lua
local M = {}

--- Create a button entity to use with the alpha dashboard
---@param sc string The keybinding string to convert to a button
---@param txt string The explanation text of what the keybinding does
---@return table # A button entity table for an alpha configuration
M.alpha_button = function(sc, txt)
  -- replace <leader> in shortcut text with LDR for nicer printing
  local sc_ = sc:gsub("%s", ""):gsub("LDR", "<leader>")
  -- if the leader is set, replace the text with the actual leader key for nicer printing
  if vim.g.mapleader then
    sc = sc:gsub("LDR", vim.g.mapleader == " " and "SPC" or vim.g.mapleader)
  end
  -- return the button entity to display the correct text and send the correct keybinding on press
  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = -2,
      width = 36,
      align_shortcut = "right",
      -- hl = "AlphaButtons",
      hl = "DashboardIcon",
      -- hl_shortcut = "AlphaShortcut",
      hl_shortcut = "DashboardShortCut",
    },
  }
end

return M

```

# lua/utils/icons.lua

```lua
local M = {}

local icons = {
  Array = "",
  ArrowCircleDown = "",
  ArrowCircleLeft = "",
  ArrowCircleRight = "",
  ArrowCircleUp = "",
  ArrowDown = "",
  ArrowLeft = "",
  ArrowRight = "",
  ArrowUp = "",
  Astro = "󰑣",
  BoldClose = "",
  BoldDividerLeft = "",
  BoldDividerRight = "",
  BoldError = "",
  BoldHint = "",
  BoldInformation = "",
  BoldLineLeft = "▎",
  BoldQuestion = "",
  BoldWarning = "",
  Bolt = "󰉁",
  BookMark = "",
  Boolean = "",
  BoxChecked = "",
  Bqf = "󰁨",
  Branch = "",
  Bug = "",
  Calendar = "",
  Cat = "󰄛",
  Check = "",
  ChevronDown = "",
  ChevronLeft = "",
  ChevronRight = "",
  ChevronUp = "",
  Circle = "",
  CircuitBoard = "",
  Class = "",
  Clock = "󰅒",
  Close = "󰅖",
  CloudDownload = "",
  Code = "",
  Codeium = "󰚩",
  Coffe = "",
  Color = "",
  Comment = "",
  Constant = "",
  Constructor = "",
  Copilot = "",
  Dashboard = "",
  Debug = "",
  DebugConsole = "",
  Diff = "",
  DividerLeft = "",
  DividerRight = "",
  DoubleChevronRight = "»",
  Ellipsis = "",
  EmptyFolder = "",
  EmptyFolderOpen = "",
  Enum = "",
  EnumMember = "",
  Env = "",
  Error = "",
  Eslint = "",
  Event = "",
  Field = "",
  File = "",
  FileDeleted = "",
  FileIgnored = "◌",
  FileRenamed = "",
  FileStaged = "󰱒",
  FileSymlink = "",
  FileUnmerged = "",
  FileUnstaged = "󰏬",
  FileUntracked = "󰩳",
  Files = "",
  FindFile = "󰈞",
  FindText = "󱎸",
  Fire = "",
  Folder = "",
  FolderOpen = "",
  FolderSymlink = "",
  Forward = "",
  Function = "",
  Gear = "",
  Git = "󰊢",
  GitSignsAdd = "▎",
  GitSignsChange = "▎",
  GitSignsDelete = "󰐊",
  Harpoon = "󰛢",
  Hint = "󰌶",
  History = "",
  Information = "",
  Interface = "",
  Javascript = "",
  Json = "󰘦",
  Key = "",
  Keyword = "",
  LastIndentMarker = "└",
  Lightbulb = "",
  LineAdded = "",
  LineLeft = "▏",
  LineMiddle = "│",
  LineModified = "",
  LineRemoved = "",
  List = "",
  Lock = "",
  -- Lsp = "󰒋",
  -- Lsp = "",
  Lsp = "",
  Lua = "",
  Markdown = "",
  Method = "",
  Modified = "󰛿",
  Module = "",
  Mustache = "",
  Namespace = "",
  NewFile = "",
  Note = "󰠮",
  Null = "󰟢",
  Number = "",
  Object = "",
  Octoface = "",
  Operator = "",
  Package = "",
  Pencil = "󰏫",
  Plus = "",
  Property = "",
  Question = "",
  Quit = "",
  Reference = "",
  Rename = "",
  Repository = "",
  Robot = "󰚩",
  Scopes = "",
  Search = "",
  Selected = "",
  SignIn = "",
  SignOut = "",
  Smiley = "",
  Snippet = "",
  Spectre = "",
  Squirrel = "",
  Stacks = "",
  String = "",
  Struct = "",
  Tab = "󰌒",
  Table = "",
  Tag = "",
  Telescope = "󰭎",
  Text = "",
  Tilde = "󰜥",
  Trace = "✎",
  Tree = "",
  Triangle = "󰐊",
  TriangleShortArrowDown = "",
  TriangleShortArrowLeft = "",
  TriangleShortArrowRight = "",
  TriangleShortArrowUp = "",
  Trouble = "󱍼",
  TypeParameter = "",
  Typescript = "󰛦",
  Unit = "",
  Value = "",
  Variable = "",
  Vim = "",
  Warning = "",
  Watch = "",
  Watches = "󰂥",
}

--- Function to retreive the icon with necessary padding
---@param kind string The name of the icon
---@param padding? integer The amount of right padding
---@param fallback? string The icon fallback if no match kind is find
---@return string # The icon
M.get_icon = function(kind, padding, fallback)
  local icon = icons[kind]
  if icon then
    return icon .. string.rep(" ", padding or 0)
  end
  if fallback then
    return fallback .. string.rep(" ", padding or 0)
  end
  return ""
end

return M

```

# lua/utils/lsp/illuminate-denylist.lua

```lua
local filetypes_denylist = {
  filetypes_denylist = {
    "mason",
    "harpoon",
    "DressingInput",
    "NeogitCommitMessage",
    "qf",
    "dirvish",
    "oil",
    "minifiles",
    "fugitive",
    "alpha",
    "NvimTree",
    "lazy",
    "NeogitStatus",
    "Trouble",
    "netrw",
    "lir",
    "DiffviewFiles",
    "Outline",
    "Jaq",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
  },
}

return filetypes_denylist

```

# lua/utils/lsp/on-attach.lua

```lua
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("tma-lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    map("gtd", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    map("<leader>]d", require("trouble").next { skip_groups = true, jump = true }, "Next diagnostic")
    map("<leader>[d", require("trouble").previous { skip_groups = true, jump = true }, "Previous diagnostic")
    map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    map("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    map("<leader>lr", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<leader>la", vim.lsp.buf.code_action, "[C]ode [A]ction")
    map("<leader>li", "<cmd>LspInfo<cr>", "Lsp info")
    map("gh", vim.lsp.buf.hover, "Hover Documentation")
    map("gl", vim.lsp.diagnostic.open_float, "Float diagnostic")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup("tma-lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("tma-lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = "tma-lsp-highlight", buffer = event2.buf }
        end,
      })
    end

    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      map("<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, "[T]oggle Inlay [H]ints")
    end
  end,
})

```

# lua/utils/lsp/utils.lua

```lua
local M = {}

M.map = function(bufnr, map, cmd, desc)
  local keymap = vim.keymap.set
  keymap("n", map, cmd, { buffer = bufnr, desc = desc })
end

M.on_attach = function(client, bufnr)
  M.map(bufnr, "gh", vim.lsp.buf.hover, "[LSP]:Hover")
  M.map(bufnr, "gl", vim.diagnostic.open_float, "[LSP]:Float diagnostic")
  M.map(bufnr, "gd", require("telescope.builtin").lsp_definitions, "[LSP]:GoTo definition")
  M.map(bufnr, "gi", require("telescope.builtin").lsp_implementations, "[LSP]:GoTo implementation")
  M.map(bufnr, "gr", require("telescope.builtin").lsp_references, "[LSP]:GoTo references")
  M.map(bufnr, "<leader>ls", require("telescope.builtin").lsp_document_symbols, "[LSP]:Signature help")
  M.map(bufnr, "<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[LSP]:Workspace symbols")
  M.map(bufnr, "]d", function()
    vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
  end, "[LSP]:Next diagnostic ERROR")
  M.map(bufnr, "[d", function()
    vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
  end, "[LSP]:Previous diagnostic ERROR")
  M.map(bufnr, "]w", function()
    vim.diagnostic.goto_next {
      severity = { vim.diagnostic.severity.WARN, vim.diagnostic.severity.HINT, vim.diagnostic.severity.INFO },
    }
  end, "[LSP]:Next diagnostic WARN")
  M.map(bufnr, "[w", function()
    vim.diagnostic.goto_prev {
      severity = { vim.diagnostic.severity.WARN, vim.diagnostic.severity.HINT, vim.diagnostic.severity.INFO },
    }
  end, "[LSP]:Previous diagnostic WARN")
  M.map(bufnr, "<leader>li", "<cmd>LspInfo<cr>", "[LSP]:Lsp info")
  M.map(bufnr, "<leader>la", vim.lsp.buf.code_action, "[LSP]:Code action")
  M.map(bufnr, "<leader>lr", vim.lsp.buf.rename, "[LSP]:Rename")
  -- M.map(bufnr, "<leader>lf", vim.lsp.buf.format { async = true }, "Format file")

  -- Disabled renameProvider for angularls.
  if client.name == "angularls" then
    client.server_capabilities.renameProvider = false
  end

  -- FIX: When creating a new file throws a error in `script/core/hint.lua` Error: attempt to index a nil value (local "last")
  -- Itsn't very helpful. Make the code a lot more dirty and you can get the same information from the old and nice `gh`
  --[[
	if client.supports_method "textDocument/inlayHint" then
		vim.lsp.inlay_hint.enable(true, nil)
		M.map(bufnr, "<leader>lti", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "Toggle inlay hint")
	end 
	]]

  require("illuminate").on_attach(client)
end

return M

```

# lua/utils/map.lua

```lua
local M = {}

---@param mode string The mode that the command will be executed
---@param map string The keymap to be executed by the user
---@param execute string | function The command or function to be executed
---@param opts? table vim.keymap.set option table
M.map = function(mode, map, execute, opts)
  vim.keymap.set(mode, map, execute, opts)
end

return M

```

# lua/utils/servers.lua

```lua
local M = {}

M.servers = {
  "clangd",
  "jdtls",
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "intelephense",
  "svelte",
  "tailwindcss",
  "prismals",
  "marksman",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "emmet_ls",
  "gopls",
  "templ",
}

return M

```

# README.md

```md

```

# spell/en.utf-8.add

```add
#lataform
#lataform
Terço

```

# spell/en.utf-8.add.spl

This is a binary file of the type: Binary

# update.log

```log
Breaking Changes (3)
  ● mini.nvim 4.3ms  VeryLazy
      73af55e test(colors): make test for `opts.show_duration` more robust (7 hours ago)
      db1c4eb fix(pairs): prevent cursor flicker in `open()` and `cr()` mappings (8 hours ago)
      0c57094 docs(bracketed): fix typo (8 hours ago)
      282de9b fix(hipatterns)!: remove previously soft deprecated `priority` field (9 hours ago)
      a5748e0 refactor(bracketed): remove outdated check from `treesitter()` target (9 hours ago)
      5049591 ci: temporarily disable testing on Nightly (9 hours ago)
      6a393f1 docs: use development version (9 hours ago)
      64e95aa docs: bump version to 0.14.0 (2 days ago)
      adaa149 docs: prepare for 0.14.0 release (2 days ago)
      e50cf9d docs(pick): add usage example to `ui_select()` (2 weeks ago)
      5c72e4d docs(sessions): link to `MiniPick.ui_select()` in `select()` help (2 weeks ago)
      5ec09ea ci: update Makefile to stop using configurable `GROUP_DEPTH` (2 weeks ago)
      cf5bfe0 ci: replace `test_file` Make target with generated `test_xxx` per module (2 weeks ago)
      f0d6e89 feat(base16): add 'kevinhwang91/nvim-bqf' (2 weeks ago)
      a09266c feat(hues): add 'kevinhwang91/nvim-bqf' (2 weeks ago)
      3eb0705 fix(operators): ensure all operators work with all 'virtualedit' values (3 weeks ago)
      a1f08f1 fix(misc): update `setup_termbg_sync` to target stdout stream explicitly (3 weeks ago)
      8413efd test(diff): adjust to Nightly change in how extmark is invalidated (3 weeks ago)
      0021192 feat(git): update `show_at_cursor` to work in 'mini.deps' confirm buffer (3 weeks ago)
      d231729 feat(ALL): ensure plugin's colors are defined after any color scheme (3 weeks ago)
      14f81b9 fix(ALL): adjust after `vim.tbl_deep_extend` change on Nightly (3 weeks ago)
      7874974 feat(files): autocreate `'` bookmark before every jump to other bookmark (3 weeks ago)
      6ed0f7f test(surround): make highlighting delay test more robust (3 weeks ago)
      eb0f557 feat(files): implement bookmarks (4 weeks ago)
      5da685d refactor(files): update `reveal_cwd()` to use `set_branch()` (4 weeks ago)
      9633bb8 feat(files): add `set_branch()` (4 weeks ago)
      07837f7 feat(files): update `get_explorer_state()` to include more fields (4 weeks ago)
      73f2e7a test(files): use `get_explorer_state()` based helper where reasonable (4 weeks ago)
      612e863 feat(files)!: soft deprecate `get_target_window()` (4 weeks ago)
      55000d8 feat(files): add `get_explorer_state()` function (4 weeks ago)
      08430e1 feat(completion): allow setting `kind_hlgroup` inside `process_items` (4 weeks ago)
      57e47cf feat(completion): add LSP kind highlighting (4 weeks ago)
      027c6c7 refactor(base16): realign paragraph (4 weeks ago)
      2863601 fix(base16): adjust `Pmenu*Sel` to work with colored completion items (4 weeks ago)
      b7d7aee fix(hues): adjust `Pmenu*Sel` to work with colored completion items (4 weeks ago)
      b5ee41d fix(files): ensure cursor position when reacting to window height change (4 weeks ago)
      1edffa2 refactor(ALL): use `vim.bo` and `vim.wo` where possible (4 weeks ago)
      e24853a fix(ALL): update opened floating windows to more fully disable folds (4 weeks ago)
      42744fd refactor(extra): update `pickers.lsp()` to precompute whole symbol map (5 weeks ago)
      3d9125e fix(files): handle changing active buffer inside explorer windows (5 weeks ago)
      2c55015 test(files): fix test for tracking lost focus to work on Neovim 0.11 (5 weeks ago)
      f6d6117 test(pick): replace flaky screenshot test with explicit checks (5 weeks ago)
      a9b70ab fix(misc): reflect that `setup_termbg_sync()` works only on Neovim>=0.10 (5 weeks ago)
      4d85bf2 feat(base16): add new groups (5 weeks ago)
      ee22735 fix(base16): fix several issues (5 weeks ago)
      88e036c feat(hues): add new groups (5 weeks ago)
      a39ae54 fix(hues): fix several issues (5 weeks ago)
      3cf9265 test(files): use tree validator instead of (no_)file and (no_)directory (5 weeks ago)
      5af2b28 feat(files): adjust manipulation execution to cover overlapping actions (5 weeks ago)
      0bd6c4d feat(files): set `to` path in data for "delete" event if moving to trash (5 weeks ago)
      062b23a feat(files)!: update how confirmation lines are computed (5 weeks ago)
      7d99be5 refactor(files): use single array to track file system actions (5 weeks ago)
      a818595 feat(files): compute prefix only for visible part of preview (5 weeks ago)
      9a1d3a2 refactor(files): store shown children path ids as buffer property (5 weeks ago)
      17d818a fix(files): ensure no outdated views during refresh (5 weeks ago)
      71b5694 feat(files): use different name for not persistent delete during sync (5 weeks ago)
      ce55a9f fix(files): make file manipulation work across devices (5 weeks ago)
      6edcd9b feat(git): update `show_at_cursor()` to include commit's statistics (5 weeks ago)
      0b0cc07 feat(misc): update `buf_lines` picker to pad line numbers (5 weeks ago)
      fe573c7 refactor(icons): remove redundant second return value (6 weeks ago)
      5e23539 fix(icons): make `style = 'ascii'` work with full file paths (6 weeks ago)
      d6e6a6f feat(misc): update `setup_termbg_sync()` to respect no present `stdout` (6 weeks ago)
      18ba14f fix(misc): use different events in `setup_termbg_sync()` (6 weeks ago)
      0464941 docs(ALL): use correct type for optional options table (6 weeks ago)
      63b4ef5 fix(pick): work around permanent cursor hiding with `vim.o.guicursor=''` (6 weeks ago)
      7e30f58 test(extra): adjust tests after changes in 'mini.pick' (6 weeks ago)
      769d603 fix(pick): update `set_picker_items_from_cli` to close outdated process (6 weeks ago)
      c144166 feat(hues): add explicit support for `MiniPickCursor` group (6 weeks ago)
      5778330 feat(base16): add explicit support for `MiniPickCursor` group (6 weeks ago)
      0c5f49e feat(pick): explicitly hide cursor when picker is active (6 weeks ago)
      49e2699 fix(pick): make preview work for files which failed to read (6 weeks ago)
      e4c76d3 fix(files): make preview work for files which failed to read (6 weeks ago)
      2941525 feat(extra): add `preserve_order` to `buf_lines` and `oldfiles` pickers (6 weeks ago)
      2dc8806 fix(extra): update `visit_paths()` picker to use non-blocking matching (6 weeks ago)
      f045e9d feat(pick): add `preserve_order` option to `default_match()` (6 weeks ago)
      05287e4 feat(pick)!: use table `opts` as `default_match()` fourth argument (6 weeks ago)
      76f9050 fix(move): update to better preserve registers (6 weeks ago)
      cf81e70 fix(extra): make `pickers.lsp` work after `MiniIcons.tweak_lsp_kind()` (6 weeks ago)
      1e6e180 fix(move): use `getreginfo()` instead of `getreg()` (6 weeks ago)
      b4a78b2 fix(move): make move work in single line buffer (6 weeks ago)
      f47bee7 fix(bracketed): ensure safe cursor setting (7 weeks ago)
      974ebc0 test(hipatterns): make some tests more robust (7 weeks ago)
      64a560f docs(files): add example for customizing window height and/or title (7 weeks ago)
      15684f0 feat(files): trigger `MiniFilesWindowUpdate` on any window config change (7 weeks ago)
      9dc5f30 feat(files): update `go_in()` to notify about bad entries (7 weeks ago)
      89cb9da feat(statusline)!: do not change `laststatus = 3` to `laststatus = 2` (7 weeks ago)
      d306a8a fix(indentscope): respect 'showbreak' when drawing in wrapped lines (7 weeks ago)
      7c00ea1 ci: stop verifying basic setup on Windows and MacOS (7 weeks ago)
      608e157 ci: update CI setup (7 weeks ago)
      9138f4d test(ALL): make work on MacOS (7 weeks ago)
      71c43a0 test(ALL): unify `sleep()` and `poke_eventloop()` helpers (7 weeks ago)
      3acebd3 test(ALL): make work on Windows (7 weeks ago)
      3f639d2 feat(test): make it work on Windows (7 weeks ago)
      3d2ac4e refactor(sessions): make path handling more robust (7 weeks ago)
      34eb131 fix(misc): update `find_root()` to use `vim.fs.normalize()` (7 weeks ago)
      66665cc refactor(git): make path handling more robust (7 weeks ago)
      642a57c refactor(files): make path handling more robust (7 weeks ago)
      41456ca refactor(extra): make path handling more robust (7 weeks ago)
      b35b6e0 refactor(visits): make path handling more robust (7 weeks ago)
      1762855 refactor(pick): make URI detection more robust (7 weeks ago)
      eae7734 refactor(doc): use `globpath()` more robustly (7 weeks ago)
      f29d696 refactor(deps): make "start" plugin detection more robust (7 weeks ago)
      d8faae6 fix(ai): respect `vis_mode` when textobject returns array of regions (7 weeks ago)
      af673d8 fix(git): ensure to get Git CLI output with a valid current directory (8 weeks ago)
      e70e8c7 docs(misc): add note about `setup_termbg_sync()` usage (8 weeks ago)
      42a5867 docs(test): make `new_child_neovim()` help more LuaLS friendly (8 weeks ago)
      74e6b72 fix(tabline): update `default_format()` to use buffer name to get icon (8 weeks ago)
      d1d950c feat(misc): implement `setup_termbg_sync()` (8 weeks ago)
      80005ea docs: polish 'TESTING.md' (8 weeks ago)
      691c5f3 docs(completion): add note about `vim.lsp.protocol.CompletionItemKind` (8 weeks ago)
      7d40fc5 feat(icons): implement `tweak_lsp_kind()` (8 weeks ago)
      10426fc feat(hues): implement `apply_palette()` (9 weeks ago)
      82dcf9d docs(icons): make recommendations for plugin authors more visible (9 weeks ago)
      59ecf78 fix(icons)!: make `config.use_file_extension` be called only once (9 weeks ago)
      2af2e8c feat(icons): make "extension" explicitly resolve compound extensions (9 weeks ago)
      08944f7 fix(icons): prefer user configured exact file basenames over built-in (9 weeks ago)
      e24ec1f fix(git): try manually detect 'git' filetype for `:Git show` output (9 weeks ago)
      fb2cbeb feat(icons): add `config.use_file_extension` (9 weeks ago)
      3e89d57 fix(icons): reorganize built-in extensions and file names (9 weeks ago)
      fb0faa8 feat(icons)!: use direct `get('extension', ext)` in "file" resolution (9 weeks ago)
      4d11d9f feat(files): use full path with `MiniIcons.get()` (9 weeks ago)
      6b5125a feat(icons)!: use full file path in `vim.filetype.match()` fallback (9 weeks ago)
      5672409 test(icons): clean up based on diagnostic results (9 weeks ago)
      aeeddde refactor(icons): use caching with less duplication (9 weeks ago)
      657ef75 fix(git): make more robust attempting to attach to not Git buffers (10 weeks ago)
      4f04dd6 fix(hipatterns): ensure valid buffer right before adding highlighting (10 weeks ago)
      23669ab docs(icons): use correct annotation for `get()` output (10 weeks ago)
      ec85fa6 docs(comment): refer to `:h commenting` for built-in commenting in 0.10 (10 weeks ago)
      73c7cd3 fix(pick): update `rg` command to use more robust form of null character (10 weeks ago)
      eee6fb8 test(icons): add test for always using glyphs with width one (2 months ago)
      ac3fb55 refactor(icons): realign filetype icons table (2 months ago)
      1218d01 feat(icons): tweak several existing filetype icons (2 months ago)
      64b2b03 feat(icons): add many new filetype icons (2 months ago)
      db52ea9 feat(extra): update `git_hunks`, `list`, and `lsp` pickers to show icons (2 months ago)
      7dc6140 fix(pick): make icon detection more robust (2 months ago)
      30b84a7 docs(jump2d): fix typo (2 months ago)
      69a4c89 feat(icons): add 'gleam' filetype icon (2 months ago)
      f20d8cd feat(extra)!: use "│" instead of ":" as line/position separator (2 months ago)
      3ade359 feat(pick)!: update `default_show()` to display "│" in place of "\0" (2 months ago)
      42100d8 fix(pick)!: use '\0' instead of ':' as line/position separator (2 months ago)
      8f04ff8 fix(pick): prefer explicit `path` field when computing icons (2 months ago)
      eb19e84 test(extra): adapt tests for different number of available options (3 months ago)
      9a05b3a feat(surround)!: ignore trailing whitespace on last line when adding (3 months ago)
      27de3dd feat(icons): add `hcl` filetype (3 months ago)
      062a55c fix(base16): leap deprecated highlights, use LeapLabel (3 months ago)
      6c873ff feat(icons): update built-in icons (3 months ago)
      479b800 fix(diff): resolve symlinks in `git` source (3 months ago)
      861c8aa fix(hues): leap deprecated highlights, use LeapLabel (3 months ago)
      072ef02 fix(icons): fix typo in GitLab file name (3 months ago)
      7df11e3 feat(icons): add more built-in icons (3 months ago)
      38841a5 docs(surround): fix description of search methods (3 months ago)
      12d275f feat(icons): add more built-in icons (3 months ago)
      425ce1c docs(icons): tweak wording in several places (3 months ago)
      45b3540 docs(icons): clarify criteria for adding built-in icon data (3 months ago)
      75ed6e3 fix(icons): be more deliberate at what extensions are manually tracked (3 months ago)
      f312bfd fix(icons): update `mock_nvim_web_devicons()` to respect `opts.default` (3 months ago)
      b2c6ea2 feat(icons)!: update `get()` to also return whether output is a fallback (3 months ago)

  ○ nvim-lspconfig  BufReadPre 
      a9bc587 docs: update server_configurations.md skip-checks: true (3 days ago)
      7ac2e58 docs(taplo): update out of date docstring with new root_dir (#3319) (3 days ago)
      dd32991 docs: update server_configurations.md skip-checks: true (5 days ago)
      6150cce fix(cairo_ls): update bin_name value for cairo language server (#3315) (5 days ago)
      efbfce3 fix(gopls): fix nil error when go env GOMODCACHE returns nothing (#3316) (5 days ago)
      5f9e043 fix: root_dir support string value directly (#3313) (5 days ago)
      f4fef35 fix(c3): fix typo of pattern (#3311) (6 days ago)
      e30efa0 docs: update server_configurations.md skip-checks: true (6 days ago)
      149c66a fix(c3): update c3 root pattern (#3309) (6 days ago)
      b064131 docs: update server_configurations.md skip-checks: true (8 days ago)
      7b8b0b3 fix(als): remove als config (#3310) (8 days ago)
      aaec5d0 docs: update server_configurations.md skip-checks: true (9 days ago)
      3401673 docs(lua_ls): fix fragile example code #3133 (9 days ago)
      73e0002 feat: show deprecate servers list in LspInfo (#3308) (9 days ago)
      eb36e01 fix(ltex-ls): command fails on windows when using mason (#3305) (11 days ago)
      46ce5fd chore: remove redundant flake-utils dependency; add nix-systems (12 days ago)
      0d027de docs: update server_configurations.md skip-checks: true (2 weeks ago)
      170c964 fix: sourcekit lsp filetypes (#3301) (2 weeks ago)
      bb682c1 docs: update server_configurations.md skip-checks: true (2 weeks ago)
      fbe3dc6 feat: add c3-lsp support (#3299) (2 weeks ago)
      d88ae66 docs: update server_configurations.md skip-checks: true (2 weeks ago)
      97e72e3 feat: add daedalus-language-server support (#3259) (2 weeks ago)
      8c45e72 fix(ci): luarocks unknown "licence" field (2 weeks ago)
      056f569 docs: update server_configurations.md skip-checks: true (2 weeks ago)
      436aad9 feat(ziggy): add ziggy and ziggy_schema support (#3296) (2 weeks ago)
      5ac3e19 docs: update server_configurations.md skip-checks: true (3 weeks ago)
      e6b4dd9 feat(kcl): add kcl-language-server support (#3294) (3 weeks ago)
      38d4b23 docs: update server_configurations.md skip-checks: true (3 weeks ago)
      ceb2160 fix(snakeskin): change snakeskin lsp start command (#3293) (3 weeks ago)
      2541fc9 docs(v-analyzer): change repository location to vlang org (#3292) (3 weeks ago)
      bdbc65a feat(ts_ls)!: rename `tsserver` to `ts_ls` #3232 (3 weeks ago)
      0ef6459 docs: update server_configurations.md skip-checks: true (4 weeks ago)
      abb9a02 docs(wgsl-analyzer): add missing close paren (#3290) (4 weeks ago)
      3ad5627 docs: update server_configurations.md skip-checks: true (4 weeks ago)
      0274356 fix(bazelrc-lsp): rename bazelrc-lsp to bazelrc_lsp (#3287) (4 weeks ago)
      6bfd921 docs: update server_configurations.md skip-checks: true (4 weeks ago)
      0bec0a5 feat: add snakeskin_ls server configuration (#3286) (4 weeks ago)
      2a6f00f docs: update server_configurations.md skip-checks: true (4 weeks ago)
      a05f8d1 fix: tea-leaves was renamed and replaced teal-language-server (#3285) (4 weeks ago)
      8a3610d docs: update server_configurations.md skip-checks: true (5 weeks ago)
      acf17dc feat: improve default haxe_language_server init_options (#3284) (5 weeks ago)
      9111679 docs: update server_configurations.md skip-checks: true (5 weeks ago)
      c75b0fc fix(rescripls): enable typechecking, improve doc (#3281) (5 weeks ago)
      84126eb docs: update server_configurations.md skip-checks: true (5 weeks ago)
      04f41cd fix(r-language-server): use `--no-echo` instead of `--slave` (#3280) (5 weeks ago)
      a7f0f9c docs: update server_configurations.md skip-checks: true (5 weeks ago)
      fb774af fix(scheme-langserver): defaultly enable log/out/multi-thread and disable type-inference (#3278) (5 weeks ago)
      a92235d docs: update server_configurations.md skip-checks: true (5 weeks ago)
      367c100 fix(als): deprecate als in favour of a separate plugin (#3277) (5 weeks ago)
      b21c166 fix(texlab): do not pass buf as parameter (#3276) (5 weeks ago)
      6ecab74 feat(texlab): give the find environments command a ui wrapper (#3263) (5 weeks ago)
      0037fb1 docs: update server_configurations.md skip-checks: true (5 weeks ago)
      63ee95e feat(clangd): add symbolInfo support (#3274) (5 weeks ago)
      20906fc docs: update server_configurations.md skip-checks: true (5 weeks ago)
      b2c7317 fix: remove invalid filetypes containing wildcards from `typos_lsp` and `hyprls` (#3273) (5 weeks ago)
      dddd094 test(ci): change to luajit-openresty (#3272) (5 weeks ago)
      43200fb docs: update server_configurations.md skip-checks: true (6 weeks ago)
      4591bc5 feat: add tea-leaves support (#3271) (6 weeks ago)
      d481433 docs: update server_configurations.md skip-checks: true (6 weeks ago)
      48dc7b1 docs: clarify snippet support in jsonls.lua (#3270) (6 weeks ago)
      a89de2e docs: update server_configurations.md skip-checks: true (6 weeks ago)
      1fe2609 Revert "feat: ruby_lsp works inside eruby files (#3266)" (#3269) (6 weeks ago)
      037ea09 docs: update server_configurations.md skip-checks: true (6 weeks ago)
      a6ccfcb feat(htmx): add more filetypes (#3268) (6 weeks ago)
      ad32182 fix(taplo): simplify root detection now that single file mode is supported (#3267) (6 weeks ago)
      a67bc39 docs: update server_configurations.md skip-checks: true (7 weeks ago)
      4cd29ab feat: ruby_lsp works inside eruby files (#3266) (7 weeks ago)
      ff97d37 docs: update server_configurations.md skip-checks: true (7 weeks ago)
      94f0fca fix(mesonlsp): update root directory pattern (#3265) (7 weeks ago)
      652386d docs: update server_configurations.md skip-checks: true (7 weeks ago)
      462b1d8 feat: add tvm_ffi_navigator server (#3261) (7 weeks ago)
      6c505d4 docs: update server_configurations.md skip-checks: true (8 weeks ago)
      8933773 docs(fortls): update linke of  fortls (#3258) (8 weeks ago)
      81a19de docs: update server_configurations.md skip-checks: true (8 weeks ago)
      9f10797 feat: implement ZkList command for zk (#3257) (8 weeks ago)
      e6528f4 fix(texlab): use notify instead of print  (#3256) (8 weeks ago)
      d710f5c docs: update server_configurations.md skip-checks: true (8 weeks ago)
      5c5940e feat: add superhtml support (#3245) (8 weeks ago)
      e9b1c95 docs: update server_configurations.md skip-checks: true (8 weeks ago)
      167f4df fix(tailwindcss): removed deprecated code form tailwindcss (#3254) (8 weeks ago)
      fdc4476 docs: update server_configurations.md skip-checks: true (9 weeks ago)
      927ad03 feat: add ballerina support (#3252) (9 weeks ago)
      f95d371 docs: update server_configurations.md skip-checks: true (9 weeks ago)
      37585d2 docs(neocmake): document to show neocmake support snippet (#3251) (9 weeks ago)
      0e30101 docs: update server_configurations.md skip-checks: true (9 weeks ago)
      b603966 docs: remove unnecessary backticks (#3249) (9 weeks ago)
      9c762dc docs: update server_configurations.md skip-checks: true (9 weeks ago)
      d4df0b6 feat(harper-ls): added new languages (#3248) (9 weeks ago)
      3cceca5 fix(rust-analyzer) automatically populate `init_options` from `settings["rust-analyzer"]` (#3247) (9 weeks ago)
      3d0ecac docs: update server_configurations.md skip-checks: true (9 weeks ago)
      3d05d50 docs: fix typos in arduino_language_server (#3246) (9 weeks ago)
      fa6c2a6 docs: update server_configurations.md skip-checks: true (10 weeks ago)
      0c2aeae docs: close code block for Ruff settings example (#3244) (10 weeks ago)
      4789906 docs: `lspconfig.Config` class not modifying inherited `root_dir` (#3243) (10 weeks ago)
      1ea7c61 docs: update server_configurations.md skip-checks: true (10 weeks ago)
      88a7b32 feat: add server configuration for `glasgow` (#3242) (10 weeks ago)
      e26da40 docs: update server_configurations.md skip-checks: true (2 months ago)
      3b5a9d5 feat: added htmlangular ft to emmet_language_server, tailwindcss, emmet_ls and angularls (#3240) (2 months ago)
      07568c1 docs: update server_configurations.md skip-checks: true (2 months ago)
      70d1c2c feat!: remove `--preview` flag from Ruff server (#3241) (2 months ago)
      df9c116 docs: update server_configurations.md skip-checks: true (2 months ago)
      a481793 feat(leanls): add support for lakefile.toml-only packages (#3238) (2 months ago)
      01e08d4 feat: add janet lsp config (#3235) (2 months ago)
      216deb2 docs: update server_configurations.md skip-checks: true (3 months ago)
      712e446 fix(tailwindcss): add includeLanguages (#3231) (3 months ago)

  ● nvim-treesitter 21.68ms  start
      f027762 bot(lockfile): update devicetree, fortran, gleam, inko, markdown, markdown_inline, nix, ocaml, ocaml_interface, tact, templ (15 hours ago)
      679883a feat(gleam,luau): use `@keyword.type` captures (#7181) (2 days ago)
      a1b7916 bot(lockfile): update re2c (2 days ago)
      0c8a582 bot(lockfile): update odin (3 days ago)
      6511cd9 fix(jsdoc): disable spelling for identifiers (#7172) (4 days ago)
      160b171 bot(lockfile): update angular, powershell (4 days ago)
      621f590 bot(lockfile): update apex, c, cpp, ocaml, ocaml_interface, sflog, soql, sosl, zig (5 days ago)
      20b5cbf feat(perl): support more modern syntax (5 days ago)
      2b26355 bot(lockfile): update d, ocaml, ocaml_interface, supercollider (6 days ago)
      929ca9c bot(lockfile): update cpp, d, http, v (7 days ago)
      b8ad047 fix(markdown): broader link recognition (7 days ago)
      1fbc25f bot(lockfile): update elm, lalrpop, v (8 days ago)
      188b1a6 feat(highlights): capture wildcard patterns as `@character.special` (#7153) (8 days ago)
      2b2ac30 bot(lockfile): update editorconfig, fortran, nix, perl (9 days ago)
      63c532f feat(swift): fold queries (9 days ago)
      12e339e feat(swift): add many missing highlights (9 days ago)
      45ee50d feat(htmldjango): improve punctuation highlighting (9 days ago)
      3c6af36 bot(lockfile): update d, fortran, go, inko, nix, r, tlaplus (10 days ago)
      4d94c24 bot(lockfile): update d, http, nix (11 days ago)
      cad9ff2 feat(ruby): detect shebang directive (11 days ago)
      b9002f6 bot(lockfile): update apex, sflog, soql, sosl, swift (12 days ago)
      5c42228 feat(apex): update parser and highlights (#7151) (12 days ago)
      b7160e8 bot(lockfile): update hurl, v (13 days ago)
      399062d fix(lua): remove duplicate ellipsis highlight (13 days ago)
      5833958 bot(lockfile): update r (2 weeks ago)
      e0338f2 bot(lockfile): update glsl, hlsl, scala, slang (2 weeks ago)
      4af16a1 bot(lockfile): update gomod, latex, markdown, markdown_inline, perl, scala (2 weeks ago)
      66a7655 feat(ruby): improve identifiers highlighting (2 weeks ago)
      b6a6d89 feat(gleam): add `@local.scope` capture for block (#7128) (2 weeks ago)
      d22166e ci: bump create-pull-request to v7 (2 weeks ago)
      2871a4a bot(lockfile): update markdown, markdown_inline (2 weeks ago)
      6a3c6a4 fix(rust): comment marker should not be `@operator` (#7135) (2 weeks ago)
      c436d45 Revert "ci(update): bump create-pull-request to v7 and sign commits" (3 weeks ago)
      c9003a3 ci(update): bump create-pull-request to v7 and sign commits (3 weeks ago)
      f8bbb82 bot(lockfile): update elixir, gleam, lua, markdown, markdown_inline, perl, scala, swift (3 weeks ago)
      13ee7f8 feat(latex): capture conditionals (3 weeks ago)
      4770d9a bot(lockfile): update earthfile, racket, scheme, svelte (3 weeks ago)
      58030e6 fix(formatter): adapt formatter for nightly (3 weeks ago)
      00f128d bot(lockfile): update elixir, erlang, groovy, r, svelte, swift (3 weeks ago)
      ccbaee5 feat(mermaid): indents and folds (3 weeks ago)
      093b29f bot(lockfile): update julia, kotlin, tcl (3 weeks ago)
      bfe74a4 bot(lockfile): update arduino, awk, bash, c, cpp, css, cuda, go, groovy, haskell, hlsl, html, http, javascript, jsdoc, json, julia, liquid, norg, ocaml, ocaml_interface, php, php_only, phpdoc, python, ql, regex, ruby, rust, scala, slang, tcl, templ, tsx, typescript, v, wing (3 weeks ago)
      3826d0c fix(query): explicitly opt-in to legacy behavior (3 weeks ago)
      5b8b126 fix(highlights): section headings in ini, git_config editorconfig (#7108) (4 weeks ago)
      a1573a9 feat(javascript): update parser and queries (4 weeks ago)
      e090c5b feat(wing): add many missing highlights (4 weeks ago)
      bbf1f3e bot(lockfile): update arduino, c_sharp, dart, embedded_template, gleam, ini, java, racket, scheme, vhdl (4 weeks ago)
      2d8f0f3 feat(gap): add gap and gaptst parser and queries (#7110) (4 weeks ago)
      4e47268 feat(latex): set url attribute for hyperlinks (4 weeks ago)
      aa339f6 bot(lockfile): update http, styled, swift (4 weeks ago)
      749df30 feat(query): highlight supertype "/" delimiters (4 weeks ago)
      c7920f2 bot(readme): update (4 weeks ago)
      628f53e feat(glimmer): add glimmer-javascript and glimmer-typescript (#7064) (4 weeks ago)
      0b61eb4 fix(ini): highlight setting value as `@string` (#7104) (4 weeks ago)
      b33a34e fix(http): update injections queries (#7078) (4 weeks ago)
      64cc1ef bot(lockfile): update http, kotlin, perl, templ (4 weeks ago)
      fd9663a fix(query): explicitly opt-in to legacy behavior (#7101) (4 weeks ago)
      9593320 feat(markdown): set url attribute on image links (4 weeks ago)
      9ac3931 bot(lockfile): update http, ini, leo (4 weeks ago)
      c153852 fix(c_sharp): remove duplicated queries (#7099) (4 weeks ago)
      ba921c9 feat!: switch upstream Zig parser (4 weeks ago)
      585860a bot(lockfile): update angular, mlir (4 weeks ago)
      7a64148 feat(diff): add folds (4 weeks ago)
      3949060 bot(lockfile): update editorconfig, fortran, php, php_only (4 weeks ago)
      5071ca7 fix(leo): update queries (#7086) (4 weeks ago)
      2eb5035 ci: bump stylua-action to v4 (4 weeks ago)
      aaa119c bot(lockfile): update go, janet_simple, mlir, nix, python, slint, sql, v (5 weeks ago)
      7499f73 feat(ruby): string/punctuation highlight improvements (5 weeks ago)
      54becf6 feat(make): highlight more special characters (5 weeks ago)
      d0c5116 feat(leo): add string literals (#7084) (5 weeks ago)
      86a9b67 bot(lockfile): update asm, gotmpl, helm, leo, perl (5 weeks ago)
      f9b7625 feat(leo): async keyword (#7083) (5 weeks ago)
      397982d chore: remove r locals executable status (5 weeks ago)
      39023b6 feat(matlab): capture comment sections (5 weeks ago)
      bef7ec6 feat(proto): add indents (5 weeks ago)
      081dfa6 bot(lockfile): update comment, perl, qmljs, swift, tact, vhs (5 weeks ago)
      e085c61 feat(tact): update parser and queries (5 weeks ago)
      0f6be79 bot(lockfile): update java, nix, perl, pod (5 weeks ago)
      04401b5 bot(lockfile): update angular, apex, cuda, http, norg, sflog, soql, sosl, swift (5 weeks ago)
      8724e7d feat(rust): add highlight for shorthand_field_identifier (5 weeks ago)
      6ed65c3 bot(lockfile): update perl (5 weeks ago)
      0b8b78f bot(lockfile): update cuda, glimmer, javascript, matlab, styled, templ (5 weeks ago)
      0fd6d32 feat(http): switch to new parser version (#7063) (5 weeks ago)
      6699eae Revert "ci: skip updates for javascript" (5 weeks ago)
      cfd2095 bot(lockfile): update groovy, matlab (6 weeks ago)
      1e86056 chore: remove obsolete CODEOWNERS (6 weeks ago)
      26e7fdb bot(lockfile): update c, comment, cpp, embedded_template, kotlin, latex, php, php_only, ruby, scala, templ (6 weeks ago)
      ec8776e feat(php): php 8.4 support (#6741) (6 weeks ago)
      24ddf60 bot(lockfile): update go, html, json, python, rust, swift, vhs (6 weeks ago)
      6d74da7 fix(inko): add highlight for boolean patterns (#7050) (6 weeks ago)
      63e1337 bot(lockfile): update c, cpp, css, go, idl, nix, python, ruby (6 weeks ago)
      59cc5f3 bot(lockfile): update jsonnet, liquid, matlab, nickel, nix (6 weeks ago)
      bfb50de bot(lockfile): update erlang, goctl, liquid, nix (6 weeks ago)
      3de418e feat(liquid): add highlights (#7035) (6 weeks ago)
      db92f60 bot(lockfile): update angular (6 weeks ago)
      047ce49 bot(lockfile): update groovy, liquid, scala, templ (7 weeks ago)
      e5a05ba fix(ini): Fix injection in comments (#7033) (7 weeks ago)
      079af15 bot(lockfile): update apex, dart, nix, sflog, soql, sosl (7 weeks ago)
      8a966f3 bot(lockfile): update sflog (7 weeks ago)
      4d0da6b bot(readme): update (7 weeks ago)
      9a0db40 feat(sflog): add sflog (Salesforce debug log) parser and highlights (7 weeks ago)
      c8f8dd1 bot(lockfile): update apex, asm, devicetree, idl, julia, soql, sosl, sql (7 weeks ago)
      176e446 fix(install): vim.uv compatibility shim for 0.9 (7 weeks ago)
      3d1f5e7 bot(lockfile): update idl, scala (7 weeks ago)
      a8535b2 fix(install): correct arguments for `string.format` (7 weeks ago)
      2e01c71 bot(lockfile): update hlsl, idl, nix, pascal, scala, sql, systemtap (7 weeks ago)
      da7b118 feat(idl): update highlights (7 weeks ago)
      3e0feeb feat(perl): update highlights and folds (7 weeks ago)
      88aad97 feat(snakemake): update highlights and indents (7 weeks ago)
      e28614c bot(lockfile): update idl, scala (7 weeks ago)
      9e66d5c fix(julia): macro definition docstrings (7 weeks ago)
      c79b068 bot(lockfile): update apex, beancount, idl, snakemake, soql, sosl (8 weeks ago)
      1aad04e bot(lockfile): update apex, hlsplaylist, muttrc, nix, soql, sosl, tmux, zathurarc (8 weeks ago)
      558c7ad fix(lua): proper indent after multiline string arg (8 weeks ago)
      d7353a6 bot(lockfile): update perl, typespec (8 weeks ago)
      a7a3b9c ci: skip updates for javascript (8 weeks ago)
      ddbcc38 bot(lockfile): update cuda, hlsl, kotlin, slang, typespec, vim (8 weeks ago)
      09bad64 fix(query): proper indentation after quantifiers (8 weeks ago)
      8453015 bot(lockfile): update kotlin, nix, perl (8 weeks ago)
      110a50e feat(ecma): inject sql template methods (8 weeks ago)
      d13f018 feat(highlights): capture wildcard imports as `@character.special` (8 weeks ago)
      c67881c bot(lockfile): update gomod, groovy, powershell, roc (8 weeks ago)
      fcf79ac feat(powershell): added data section name highlights (8 weeks ago)
      929e473 fix(format): field_def inside grouping (8 weeks ago)
      65310b6 fix: prevent double indent from pipes (8 weeks ago)
      8e569bc bot(lockfile): update http, hurl, matlab, sql, swift (8 weeks ago)
      9f8c99e feat(vrl): Add vrl parser and queries (8 weeks ago)
      cc69a06 bot(lockfile): update d, just, kotlin, wit (9 weeks ago)
      a7ba147 bot(lockfile): update d, kotlin, problog, prolog, rescript (9 weeks ago)
      8dbab59 feat(powershell): highlight shebang (9 weeks ago)
      2d5133f bot(lockfile)!: update d, latex (9 weeks ago)
      45b3f7a fix(strace): Fix comment injection (9 weeks ago)
      51bba66 refactor(queries): Remove quotes from properties in set! directive (9 weeks ago)
      88aa09e feat(latex): capture left/right math delimiters (9 weeks ago)
      ed871c9 docs(install): fix typo (9 weeks ago)
      f97e0de feat: add rescript parser and queries (#6671) (9 weeks ago)
      7cec621 fix(query): properly apply predicate injections (9 weeks ago)
      2b48812 feat(luap): Make class captures similar to regex captures (9 weeks ago)
      886b496 feat(query): Highlight key in set! directive (9 weeks ago)
      1899c8c bot(lockfile): update groovy, idl, latex, php, php_only, sql, systemverilog (9 weeks ago)
      e265fec fix(latex): environment name should be label (9 weeks ago)
      e0faad4 bot(lockfile): update gleam, idl, sql (9 weeks ago)
      63be47f bot(lockfile): update erlang, janet_simple, latex, m68k, matlab (9 weeks ago)
      96c5cb2 feat(vimdoc): set url attribute for URLs (9 weeks ago)
      c760e40 bot(lockfile): update heex, perl, sql (9 weeks ago)
      a0732ca feat(julia): Add syntax highlighting for markdown and bash prefixed_string_literals (9 weeks ago)
      b1e8872 feat(html): set url attribute for HTML URLs (9 weeks ago)
      205102f feat(markdown): set url attribute on plain URLs (9 weeks ago)
      9d252d0 bot(lockfile): update editorconfig, latex (10 weeks ago)
      3fa183e feat(latex): improve parameters (10 weeks ago)
      820b14a bot(lockfile): update git_rebase, perl, sourcepawn, sql, typst (10 weeks ago)
      803e5bd fix(latex): more `@nospell` (10 weeks ago)
      49452ab fix(zig): add some missing highlights (10 weeks ago)
      5f5077f fix(parsers): powershell maintainer (10 weeks ago)
      c5b3560 feat: add powershell language (10 weeks ago)
      4ee9f12 refactor(latex): deduplicate captures, reorder (10 weeks ago)
      debf581 fix(install): abort installation using git in active git session (10 weeks ago)
      468f6ed fix(idl): fix break changes (10 weeks ago)
      4075376 feat(gotmpl,helm): add locals (wip) (10 weeks ago)
      dfd047d feat(gotmpl,helm): add fold queries (10 weeks ago)
      aca4432 bot(lockfile): update idl, latex (10 weeks ago)
      2883d0c fix(lua): use @property for keys in table literals (#6956) (10 weeks ago)
      002537a feat(latex): simplify captures of font changing (10 weeks ago)
      733fa85 feat(snakemake): add wildcard flag (10 weeks ago)
      aba69e4 bot(lockfile): update c, cpp, cuda, glsl, snakemake, svelte, swift, tsx, typescript (10 weeks ago)
      625e7e5 feat(latex): capture `&` as `@punctuation.delimiter` (10 weeks ago)
      667b9db bot(lockfile): update beancount, gleam, idl (2 months ago)
      e8d7446 fix(gitignore): hl/capture non-special pattern chars (2 months ago)
      b3c54c3 feat(bash): readline injections (#6947) (2 months ago)
      4e387dd feat(latex): capture placeholder as variable (2 months ago)
      d9ea503 feat(latex): add additional include highlights (2 months ago)
      0ffe627 bot(lockfile): update cuda, idl (2 months ago)
      de8d91d docs(utils): fix deprecation notice (2 months ago)
      d78ab90 bot(lockfile): update angular, djot, slint, vhdl (2 months ago)
      35fa869 feat(latex): injections for luacode, asy{def} environments (2 months ago)
      874b990 bot(lockfile): update djot, fortran, scala (2 months ago)
      355af0c feat: add vhdl parser and queries (2 months ago)
      c80d0d9 fix(filetype): add missing shorthands for Perl, Uxn Tal (2 months ago)
      0758155 feat(parsers): register python for gyp files (2 months ago)
      dd7bb79 docs(readme): recommend builtin foldexpr (2 months ago)
      804a647 fix(install): pass `--show-error` to curl (2 months ago)
      f649c2f fix(php): correct line endings (2 months ago)
      7a38515 bot(lockfile): update facility, idl, templ (2 months ago)
      14dff71 feat(wit): add folds, missing highlights (2 months ago)
      067415e feat: add nginx (2 months ago)
      0d5e121 feat: add indentation queries for angular (2 months ago)
      276c343 feat!: update angular parser to new major (2 months ago)
      0388304 feat: change angular filetype to vim's htmlangular (2 months ago)
      3076b9a fix(facility): add highlight for event keyword (2 months ago)
      4836c1d fix(lua): indent functions before they are closed (2 months ago)
      f16a775 feat(python): Improved python indentation (#6859) (2 months ago)
      a8c1f36 feat(templ): add folds (2 months ago)
      d9aa422 bot(lockfile): update angular, facility, idl, ocaml, ocaml_interface, templ (2 months ago)
      a6b2f4e bot(lockfile): update earthfile, python, swift (3 months ago)
      7f4ac67 bot(lockfile): update erlang, groovy, typst (3 months ago)
      972aa54 bot(lockfile): update http, idl, nim (3 months ago)
      465840f bot(lockfile): update idl, scfg (3 months ago)
      4068e1c fix(scfg): switch to github mirror (3 months ago)
      656ac24 feat(goctl): add indents (3 months ago)
      d5969c4 feat(idl): update parser and queries (#6901) (3 months ago)
      e9ec8b4 bot(lockfile): update idl, swift (3 months ago)
      a64ce9f feat(parser): register common short-hand as filetypes (3 months ago)
      c1ad655 bot(lockfile): update c_sharp, liquid, mlir, tsx, typescript (3 months ago)
      53c79dd fix(php): do not indent after class/enum decl (3 months ago)
      ebdffa7 fix(ruby): highlight "&." as `@punctuation.delimiter` (#6887) (3 months ago)
      66ec1b3 bot(lockfile): update editorconfig, fortran, hare, idl, mlir, nim, php, php_only, python, squirrel, tlaplus (3 months ago)
      55b30b9 bot(readme): update (3 months ago)
      b149008 fix(parsers): keep .git suffix for gitlab urls (3 months ago)
      64f6f0a fix(hurl): multiline injection query needs injection.combined (3 months ago)
      b7c0dbb fix(wit): highlight <> as brackets (#6879) (3 months ago)
      adf6730 bot(readme): update (3 months ago)
      b32fb41 fix(parsers): drop .git suffix from URLs (3 months ago)
      f9aa4f0 feat: add goctl parser and queries (3 months ago)
      ad43c7f feat(ruby): highlights for special methods (#6735) (3 months ago)
      a8c082b feat(jsx): apply HTML-based highlight improvements (#6867) (3 months ago)
      74dc34a fix(go): narrow down } usage (3 months ago)
      2d91710 fix(indent): indent empty lines correctly (3 months ago)
      55a1386 feat(nix): indentation queries (3 months ago)
      ee29084 bot(lockfile): update editorconfig, javascript, wit (3 months ago)
      f197ce2 docs(readme): update outdated information (3 months ago)
      f7c05e3 fix(html): correct the link label highlight (#6866) (3 months ago)


Updated (30)
  ● alpha-nvim 2.11ms  start
      b6f4129 re-evaluate cwd on redraw (#297) (6 weeks ago)
      355fbb8 feat: support mini.icons (#291) (7 weeks ago)
      36e4bac fix: replace hard-coded config path with vim function (#283) (7 weeks ago)

  ● conform.nvim 3.03ms  start
      1a99fdc [docgen] Update docs skip-checks: true (2 weeks ago)
      555a5c4 feat: add kulala-fmt (#534) (2 weeks ago)
      46c107a doc: add more steps for debugging issues with vim.system (2 weeks ago)
      936f241 fix: health checks error for old Neovim versions (2 weeks ago)
      130e0d6 fix: more notifications when Neovim is below supported version (2 weeks ago)
      5064964 chore(master): release 8.1.0 (#532) (2 weeks ago)
      c6728c5 fix(log): prepend date to log lines (#529) (2 weeks ago)
      26b46b3 [docgen] Update docs skip-checks: true (2 weeks ago)
      392fc98 feat(zine): add superhtml and ziggy support (#531) (2 weeks ago)
      e82b7b1 feat(deno): add support for .mjs files (#528) (2 weeks ago)

  ● fidget.nvim 45.47ms  start
      d855eed chore(doc): auto-generate help docs (3 months ago)
      f53cc34 fix: don't use client IDs from LspProgressUpdate (3 months ago)
      bc34563 chore(doc): auto-generate help docs (3 months ago)
      600ecc1 Show progress for clients before they initialize (#252) (3 months ago)
      c12f8a5 chore(doc): auto-generate help docs (3 months ago)
      a01443a feat: ignore messages via to filter functions (3 months ago)
      012a6a7 nit: add logging when editor window is too small (3 months ago)
      43607ed fix: don't render window is editor is too small (3 months ago)

  ● friendly-snippets 0.32ms  LuaSnip
      00ba9dd vhdl: add snippets for conditional assignments, signals, variables, functions, procedures, etc. (#492) (5 days ago)
      8929e8f Add snippets for cmake (#482) (5 days ago)
      6a2524f fix: add remix snippets (#489) (5 days ago)
      ff09e07 fix(latex): Fix excess spacing of `begin` snippet (#483) (5 days ago)
      cb43a96 change kubernetes cronjob api version to v1 (#481) (5 days ago)
      00ebcaa Update terraform.json (#478) (3 months ago)
      d6e7e70 fix(latex): address further issues regarding math escaping (#476) (3 months ago)
      e1f7015 Update R/`shinymod` snippet (#469) (3 months ago)
      45a1b96 Remove newline from `main` snippets (#451) (3 months ago)
      8c15851 fix(kivy): convert CRLF to LF (#474) (3 months ago)
      71fe3d9 fix(latex): address issue regarding escaping (#473) (3 months ago)
      1f7def5 fix(latex): move label to avoid error (#472) (3 months ago)
      2c0e75a feat(rust/async-dyn-dispatch): Snippets for async Rust functions (#471) (3 months ago)

  ○ gitsigns.nvim  BufReadPre 
  ● kanagawa 4.56ms  start
      f491b0f Merge branch 'master' of https://github.com/rebelot/kanagawa.nvim (4 weeks ago)
      feab306 fix(winbar): fix case Winbar* -> WinBar* (4 weeks ago)

  ○ laravel.nvim  php  blade.php  Sail  Artisan  Composer  Npm  Yarn  Laravel  <localleader>lm  <localleader>la  <localleader>lr 
      aabe7c5 Merge pull request #100 from JKHarley/fix-syntax-error-in-lazyvim-installation-details (4 weeks ago)
      5497024 Fix syntax error in LazyVim installation details (4 weeks ago)
      e4f39d9 Merge pull request #96 from rambhosale/feature/conditionally-show-info-text-objects (5 weeks ago)
      7e8b44c Merge pull request #97 from rambhosale/fix/depricated-function (5 weeks ago)
      543ff3a fix: replace the 'vim.lsp.get_active_clients' deprecated function with it's replacement (7 weeks ago)
      2008bc4 feat: Optionaly show/disable the info text (7 weeks ago)

  ● lazy.nvim 70.47ms  init.lua
      460e1cd chore(build): auto-generate rockspec mappings (12 days ago)
      aca30f6 fix(bootstrap): single forward slash. Fixes #1747 (12 days ago)
      48b52b5 chore(build): auto-generate rockspec mappings (4 weeks ago)
      591ef40 fix(luarocks): try to install from root manifest (#1687) (4 weeks ago)
      80da254 fix(rocks): add lib64 plugin directory to package.cpath (#1717) (4 weeks ago)
      014a72b docs: update dev.path description (#1711) (4 weeks ago)
      077102c chore(main): release 11.14.1 (#1680) (9 weeks ago)
      7108809 fix(plugins): "Vim:E150: Not a directory" on plugin update (#1679) (9 weeks ago)
      4496b4c chore(main): release 11.14.0 (#1673) (9 weeks ago)
      b4a5a12 fix(plugin): make .lazy.lua work again (9 weeks ago)
      c02268a feat(plugin): improve error handling and show better error message (9 weeks ago)
      d5686ef feat: added `opts.git.cooldown` to allow updating plugins on slow connections. Fixes #1656 (9 weeks ago)
      839f9e7 chore(main): release 11.13.5 (#1672) (10 weeks ago)
      7d29719 fix(health): dont use vim.fn.system to get cmd versions (10 weeks ago)
      cc028e7 ci: update (10 weeks ago)
      16a5c46 chore(main): release 11.13.4 (#1670) (10 weeks ago)
      12f2c74 fix(loader): explicitely set package.loaded.modname to nil to prevent recursive loading errors (10 weeks ago)
      34b0126 fix(loader): add plugins whose rtp got loaded early to start plugins (10 weeks ago)
      a09c876 chore(main): release 11.13.3 (#1669) (10 weeks ago)
      a692bf8 revert: fix(loader): add auto loaded module to package.loaded early to prevent require loops (10 weeks ago)
      8bef074 chore(main): release 11.13.2 (#1668) (10 weeks ago)
      18d1c1b fix(loader): add auto loaded module to package.loaded early to prevent require loops (10 weeks ago)
      9a374a0 chore(main): release 11.13.1 (#1664) (2 months ago)
      5bdb12a fix(build): only load the plugin before build for `:` build commands (2 months ago)
      c92c6b5 chore(build): auto-generate docs (2 months ago)
      124b864 docs(commands): fix command ordering for sync (#1661) (2 months ago)
      8f62257 chore(main): release 11.13.0 (#1660) (2 months ago)
      6ca90a2 feat(ui): added mapping descriptions (2 months ago)
      5473e3d chore(main): release 11.12.0 (#1655) (2 months ago)
      d731a6b feat(git): added git network throttle to limit network related git ops per interval. Closes #1635 (2 months ago)
      9d445eb chore(update): update repository (#1653) (2 months ago)
      315191a chore(update): update repository (#1651) (3 months ago)
      b02c9ea chore(main): release 11.11.1 (#1643) (3 months ago)
      6e66f8e chore(update): update repository (#1648) (3 months ago)
      93499c5 fix(config): check for lib64. Fixes #1343 (3 months ago)
      788feaf chore(update): update repository (#1644) (3 months ago)
      58c6bc4 chore(update): update repository (#1638) (3 months ago)
      7ed9f71 fix(lockfile): ensure newline at EOF for lockfile (#1639) (3 months ago)
      54f70c7 ci: add luassert to minitest for now (3 months ago)
      070418d chore(main): release 11.11.0 (#1634) (3 months ago)
      1d451b4 ci: use mini.test instead of busted (3 months ago)
      17473db feat: add plugin name to handlers.managed (3 months ago)
      54b003c fix(util): strip `-lua` in normname (3 months ago)
      d1de92d chore(build): auto-generate docs (3 months ago)
      2cb8af1 ci: skip docs on main (3 months ago)
      159036c chore(build): auto-generate docs (3 months ago)
      fadebdc fix(minit): add tests to package.path when running busted (helpers.lua etc) (3 months ago)
      1870238 chore(build): auto-generate docs (3 months ago)
      f918318 chore(main): release 11.10.4 (#1628) (3 months ago)
      a4c473c chore(build): auto-generate docs (3 months ago)
      f0324de fix(rocks): try building anyway even when prerequisits have not been met. (will likely fail) (3 months ago)
      0002bfb chore(build): auto-generate docs (3 months ago)
      2dfccd7 fix(ui): don't treat suspended as headless. Closes #1626 (3 months ago)
      44cd12f chore(build): auto-generate docs (3 months ago)
      a6daaf6 chore(main): release 11.10.3 (#1625) (3 months ago)
      436d09a chore(build): auto-generate docs (3 months ago)
      93c9a3f chore(build): auto-generate docs (3 months ago)
      72c0dc9 fix(git): local plugin fixes (#1624) (3 months ago)
      c771cf4 chore(build): auto-generate docs (3 months ago)
      25026d2 chore(build): auto-generate docs (3 months ago)
      083f3df chore(build): auto-generate docs (3 months ago)
      89b264a chore(main): release 11.10.2 (#1621) (3 months ago)
      23aeb22 chore(build): auto-generate docs (3 months ago)
      81d2bff fix(git): only check for new commits for local plugins. Closes #1512 (3 months ago)
      933f0b5 chore(build): auto-generate docs (3 months ago)
      55b46b3 ci: update (3 months ago)
      23ea80b ci: update (3 months ago)
      e6035dc ci: update (3 months ago)
      0ff7e83 chore(build): auto-generate docs (3 months ago)
      1e7745a chore(build): auto-generate docs (3 months ago)
      49a35d3 chore(update): update repository (#1618) (3 months ago)
      16ccd54 chore(build): auto-generate docs (3 months ago)
      c060de1 chore(update): update repository (#1616) (3 months ago)
      e3154ff chore(build): auto-generate docs (3 months ago)
      c3a9cec ci: update (3 months ago)
      d901d21 chore(build): auto-generate docs (3 months ago)
      94b6b67 chore(build): auto-generate docs (3 months ago)
      538f060 ci: update (3 months ago)
      894cd19 chore(build): auto-generate docs (3 months ago)
      11e802d chore(build): auto-generate docs (3 months ago)
      6ca23c1 chore(main): release 11.10.1 (#1612) (3 months ago)
      40e08f2 chore(build): auto-generate docs (3 months ago)
      d0c00e6 ci: remove tests dep (3 months ago)
      61c7156 chore(build): auto-generate docs (3 months ago)
      6186b3d ci: add generated files to .styluaignore (3 months ago)
      53661bb ci: update (3 months ago)
      a1d23e8 chore(build): auto-generate docs (3 months ago)
      baac551 fix(lockfile): keep cond=false and enabed=false in lockfile. Fixes #1535. Fixes #1606 (3 months ago)

  ● lspkind.nvim 0.07ms  nvim-cmp
      59c3f41 Merge pull request #84 from OnlyWick/limit-labelDetails-width (2 days ago)
      2451c4d feat: limit the width of labelDetails (6 days ago)
      cff4ae3 Merge pull request #82 from WieeRd/setup-alias (9 weeks ago)
      355bb60 feat: add `setup()` as an alias to `init()` (9 weeks ago)

  ● LuaSnip 7.51ms  nvim-cmp
      e808bee Format with stylua (2 weeks ago)
      3f6ef2c Auto generate docs (2 weeks ago)
      9d08546 Add log path getter, time format (2 weeks ago)
      45db5ad Auto generate docs (4 weeks ago)
      b990a08 Update README.md (4 weeks ago)
      7ad2eae Format with stylua (5 weeks ago)
      8ffedac Auto generate docs (5 weeks ago)
      838b266 remove select_keys, just allow direct access to pre_yank and post_yank. (5 weeks ago)
      d48c8ed add new setting for copying the selection (instead of cutting). (5 weeks ago)
      b84eeb3 Format with stylua (7 weeks ago)
      f720526 Auto generate docs (7 weeks ago)
      9033373 feat: allow modifying expand-position in pre_expand-callback (#1219). (7 weeks ago)
      7552e65 Auto generate docs (8 weeks ago)
      5a0ce2b Format with stylua (8 weeks ago)
      e6fd263 Auto generate docs (8 weeks ago)
      d7908de add tests for `snippet` syntax and ftplugin. (8 weeks ago)
      9470235 Improved syntax file and ftplugin for SnipMate snippets. (8 weeks ago)

  ○ mason-lspconfig.nvim  mason.nvim 
      25c1185 chore(main): release 1.31.0 (#460) (3 weeks ago)
      b953dae feat: add snakeskin_ls support (#457) (3 weeks ago)
      fee758e feat: add nextls support (#455) (3 weeks ago)
      c9387d7 feat: add tsp_server support (#448) (3 weeks ago)
      0d072b5 fix: rename tsserver to ts_ls (#459) (3 weeks ago)
      482350b chore: update generated code (#454) (5 weeks ago)
      1c55991 chore: update generated code (#452) (6 weeks ago)
      3ed9018 chore: update generated code (#449) (6 weeks ago)
      f2acd4a chore: update generated code (#447) (6 weeks ago)
      62360f0 chore(main): release 1.30.0 (#417) (8 weeks ago)
      7c075f0 feat: add starpls LSP server (#444) (8 weeks ago)
      490d0a9 feat: add pbls support (#434) (8 weeks ago)
      9ac210a feat: add textlsp (#433) (8 weeks ago)
      0e65781 feat: add hyprls (#428) (8 weeks ago)
      5716924 feat: Add regal lsp support (OPA rego linter) (#426) (8 weeks ago)
      ce74291 tests: add nvim v0.10.1 and v0.10.1 to test matrix (#446) (8 weeks ago)
      f3d1e41 docs: auto-generate available LSP servers list in readme (#445) (8 weeks ago)
      fd69d5c feat: add steep configuration (#422) (8 weeks ago)
      ba9c2f0 chore: update generated code (#441) (9 weeks ago)
      58bc911 chore: update generated code (#439) (2 months ago)

  ○ mason.nvim  BufReadPre  Mason 
  ○ neogen  <leader>gf  <leader>gc  <leader>gt 
      dc50715 fix(java): support record annotation in java (#182) (#192) (7 weeks ago)
      4b22542 [docgen] Update doc/neogen.txt skip-checks: true (8 weeks ago)
      88698b1 fix: support interfaces in Java and PHP (#183) (8 weeks ago)
      f027ac4 [docgen] Update doc/neogen.txt skip-checks: true (8 weeks ago)
      f9040ed fix(python): Fixed nested return + yield call (#190) (8 weeks ago)
      ca214a4 Update README.md (8 weeks ago)
      1d756ea [docgen] Update doc/neogen.txt skip-checks: true (8 weeks ago)
      8614bcb feat(python): fixed bugs + added unittests (#189) (8 weeks ago)
      b2942f5 [docgen] Update doc/neogen.txt skip-checks: true (9 weeks ago)
      7545cdc feat(julia): Add julia support (#185) (9 weeks ago)
      e52d88e Adding nvim snippet_engine option to README (#180) (9 weeks ago)
      4a2f68d Update test.yml (9 weeks ago)
      0f08a61 ref: Use ensure_installed for quicker runs (9 weeks ago)
      519e819 [docgen] Update doc/neogen.txt skip-checks: true (9 weeks ago)
      fef1ab3 Added unittest + basic python and lua unittests (#174) (9 weeks ago)
      6de0add fix: functions with only bare returns now evaluate properly (#171) (5 months ago)
      e7be3a9 fix: add a missing newline in numpydoc template (#177) (5 months ago)

  ○ none-ls-extras.nvim  none-ls.nvim 
      ebb0996 formatting: add blue (2 weeks ago)
      387590a diagnostics: copy standardrb from jose-elias-alvarez/null-ls-nvim (#16) (3 weeks ago)
      dfdc998 fix: eslint_d formatter abilities (#15) (6 weeks ago)
      059bb65 doc(license): convert .reuse/dep5 to REUSE.toml (2 months ago)
      972a2ab ruff: Add `check` argument (mandatory since 0.5.0) (#13) (3 months ago)
      47bbf05 feat(builtins): add mdslw formatter for markdown (#12) (3 months ago)

  ○ none-ls.nvim  BufReadPre  laravel.nvim 
      68a39ec chore: Auto generate docs (3 days ago)
      2f15629 builtins/biome: Add CSS and GraphQL as supported filetypes (#185) (3 days ago)
      5f041cf [pre-commit.ci] pre-commit autoupdate (#184) (4 days ago)
      9b98991 chore: Auto generate docs (4 weeks ago)
      2b490ee fix: add `.mjs` to cosmiconfig file patterns (#178) (4 weeks ago)
      203f5eb chore: Auto generate docs (5 weeks ago)
      c8ca2a3 Ensure item.detail is a string (#176) (5 weeks ago)
      3cc6c6a chore: Auto generate docs (5 weeks ago)
      958a2cd Clear diagnostics when there are no more results (#175) (5 weeks ago)
      cb5bd2f chore: Auto generate docs (5 weeks ago)
      a935b15 core/generator: support async iterators (#173) (5 weeks ago)
      cfa65d8 fixup! chore: remove usage of deprecated functions (9 weeks ago)
      6279c86 chore: Auto generate docs (9 weeks ago)
      5658183 fix: add RELPATH to parse_args (#170) (9 weeks ago)
      a8594ef chore: Auto generate docs (9 weeks ago)
      e33a457 feat(diagnotics): added diagnostics for terragrunt(hcl) files (#168) (9 weeks ago)
      a0fe586 chore: Auto generate docs (9 weeks ago)
      640d47f builtins/regal: defer load of plenary.job (9 weeks ago)
      2628398 Revert "Fix bug of get root directory (#163)" (9 weeks ago)
      309a1f6 fix: terragrunt_fmt formatter for formatting hcl files (#167) (9 weeks ago)
      3f917e6 feat(formatting): added formatting for terragrunt files (#165) (9 weeks ago)
      2cde745 Fix bug of get root directory (#163) (2 months ago)
      4c6605b chore: Auto generate docs (2 months ago)
      e1e001e feat(formatting): Added htmlangular ft to prettier and prettierd (#161) (2 months ago)
      8b5d417 style: fix linting errors (2 months ago)
      41de9de chore: Auto generate docs (2 months ago)
      2fe7557 chore: remove usage of deprecated functions (2 months ago)
      6648b03 chore: Auto generate docs (2 months ago)
      e87c996 feat: support monorepo repo (#147) (2 months ago)
      2870f66 doc(license): convert .reuse/dep5 to REUSE.toml (2 months ago)
      311f7ad chore: Auto generate docs (2 months ago)
      cc06c1c builtins/vale: allow per directory configuration override (#158) (2 months ago)

  ○ nui.nvim  laravel.nvim 
      b58e2bf docs(input): fix typo (13 days ago)

  ○ nvim-autopairs  InsertEnter 
  ● nvim-cmp 67.24ms  CmdlineEnter
      ae644fe Add newer fallback method for tree-sitter scopes (#2006) (8 weeks ago)
      d818fd0 fix(view): check in get_selected_index (#1993) (2 months ago)
      e1757ae feat(view): add api get_selected_index (#1986) (2 months ago)
      7e348da fix(feedkeys): resolve issue with some copilot completions (#1981) (3 months ago)

  ○ nvim-colorizer.lua  BufRead 
      0671e0e add notice for looking for maintainers (2 weeks ago)
      194ec60 fix: removed use of deprecated vim.lsp.get_active_clients (#81) (9 weeks ago)
      08bd34b feat: add support for inline virtual text (#85) (2 months ago)

  ○ nvim-jdtls  java 
      efe8138 Add user commands to set and show active maven profiles  (#688) (2 days ago)
      99e4b20 Set empty diagnostics on code action params (8 weeks ago)
      be5c8d4 Show Junit test failures as ERROR diagnostics (#665) (8 weeks ago)
      6e99fc8 Don't set line diagnostics for code action params (8 weeks ago)
      6bfd159 Relax client attach condition and allow any buftype again (3 months ago)

  ○ nvim-ts-context-commentstring  Comment.nvim 
  ● nvim-web-devicons 26.59ms  incline.nvim
      2622015 fix(#498): set_icons failed when called before setup (#499) (7 days ago)
      3b83fdd feat: add http (#497) (7 days ago)
      31bd21a feat: add variant="light|dark" option to override &background (#496) (8 days ago)
      9154484 feat: add .prettierrc.{cjs,js,mjs} (#495) (2 weeks ago)
      9793801 feat: add cow, code_of_conduct, license.md, security; move {build,settings}.gradle, build.zig.zon (#490) (3 weeks ago)
      3722e3d feat: add vercel (#488) (8 weeks ago)
      5be6c4e fix(gleam): move from icons_by_filename to icons_by_file_extension (#485) (9 weeks ago)
      a2af6aa feat: add apl bqn (#484) (9 weeks ago)
      e612de3 feat: add commitlint.config.*, eslint.config.*, i18n.config.*, ionic.config.json, .nuxtrc, nuxt.config.*, .prettierrc.*, .prettierignore, prettier.config.* (#475) (2 months ago)
      104ed08 feat: add gleam (#482) (2 months ago)
      5c4bda0 feat: add git-blame-ignore-revs, robots.txt, fix pyw icon, update mailmap colour (#479) (2 months ago)
      805e38a feat: add wv wvc (#478) (2 months ago)
      5061e58 chore(#288): feat: add .go.mod, .go.sum, .go.work (#477) (2 months ago)
      1b183dc feat: add gradle file extension (#476) (2 months ago)

  ○ obsidian.nvim  BufNewFile /home/tma/obsidian_vault/**.md  BufReadPre /home/tma/obsidian_vault/**.md 
      14e0427 chore(docs): auto generate docs (8 weeks ago)
      50242f3 doc fixes (#675) (8 weeks ago)
      b92e75b fix: deal with lack of opts.attachment (#674) (8 weeks ago)
      7466e3f chore(docs): auto generate docs (8 weeks ago)
      45bd6b9 Fix documentation for `:ObsidianNewFromTemplate` (8 weeks ago)
      d1ca121 Correct typo in ObsidianPasteImg's description (#667) (9 weeks ago)
      4da7846 Prompt for undefined template fields (#666) (9 weeks ago)
      c87db61 chore(docs): auto generate docs (9 weeks ago)
      7c8dbfb Rename `image_name_func` to `attachments.img_name_func` (9 weeks ago)
      7b9feb6 Fixed an edge case with collecting backlinks (9 weeks ago)
      fce967d chore(docs): auto generate docs (9 weeks ago)
      47f0074 Add `opts.follow_img_func` option (9 weeks ago)

  ○ oil.nvim  <leader>e 
      1360be5 lint: stricter type checking (10 days ago)
      f60bb7f feat: config option to disable lsp file methods (#477) (2 weeks ago)
      665bf2e [docgen] Update docs skip-checks: true (2 weeks ago)
      eadc3ed doc: add recipe to show current directory in the winbar (2 weeks ago)
      1eb9fb3 chore(master): release 2.12.2 (#472) (2 weeks ago)
      b053744 fix: wrap git rm callback in schedule_wrap (#475) (2 weeks ago)
      1fe476d doc: more and better type annotations (4 weeks ago)
      d10e7f4 doc: fix recipe for hiding gitignored files (4 weeks ago)
      0dc98d3 [docgen] Update docs skip-checks: true (4 weeks ago)
      85637c1 doc(recipes): improve git integrated hidden files recipe (#470) (4 weeks ago)
      30e0438 fix: ensure win_options are being set on correct window (#469) (4 weeks ago)
      0fcd126 perf(view): avoid running `is_hidden_file` when `show_hidden` is set (#471) (4 weeks ago)
      4f3c678 chore(master): release 2.12.1 (#468) (5 weeks ago)
      70337eb fix: gracefully handle trashing file that does not exist (5 weeks ago)
      349bca8 fix: process deletes in dir before moving dir (5 weeks ago)
      a632c89 chore(master): release 2.12.0 (#434) (6 weeks ago)
      b39a789 fix: add compatibility for Lua 5.1 (#456) (6 weeks ago)
      fcca212 fix: handle rare case where file watcher outlives buffer (9 weeks ago)
      71c972f fix: Force standard C locale when getting `ls` input for parsing in SSH (#455) (10 weeks ago)
      a6cea1a fix: Handle users and groups with spaces over SSH (#448) (10 weeks ago)
      9e5eb2f doc: make lazy.nvim snippet more copy/paste-able (#445) (2 months ago)
      10fbfdd [docgen] Update docs skip-checks: true (3 months ago)
      cc23325 feat: allow bufnr optional parameter for get_current_dir function (#440) (3 months ago)
      d5e5657 fix: correctly check if `mini.icons` is actually setup (#441) (3 months ago)
      a543ea5 feat: add support for `mini.icons` (#439) (3 months ago)

  ● plenary.nvim 0.71ms  telescope.nvim
      2d9b061 feat(json): add abliity to remove trailing commas while stripping comments (#613) (10 days ago)
      f4faa5a docs: fix typo in annotation for enable_recording (#620) (11 days ago)
      ec28942 fix: return early to avoid errors with no asyncfns (#616) (6 weeks ago)

  ● rose-pine 6.78ms  start
  ○ todo-comments.nvim  BufReadPre 
  ● tokyonight 3.23ms  start
      817bb6f chore(build): auto-generate docs (12 days ago)
      9699675 feat(supermaven): add support for supermaven-nvim (#633) (12 days ago)
      f31be07 fix(groups): changing the transparent option now correctly invalidates the cache (#632) (12 days ago)
      4b386e6 chore(build): auto-generate docs (4 weeks ago)
      3a366a2 chore(build): auto-generated build files (4 weeks ago)
      65837cc fix(tmux): use 24h format (#624) (4 weeks ago)
      3568c3c refactor(render-markdown): rename markdown.nvim to new name render-ma… (#620) (4 weeks ago)
      b329f4f fix(mini_tabline): make MiniTablineTabpagesection more visible (#621) (4 weeks ago)
      b0e7c73 chore(build): auto-generate docs (9 weeks ago)
      2cd1258 chore(main): release 4.8.0 (#612) (9 weeks ago)
      6c30395 chore(build): auto-generated build files (10 weeks ago)
      65017b9 feat: inline code style for markdown.nvim (10 weeks ago)
      1ac7a41 chore(build): auto-generate docs (10 weeks ago)
      420cb9b fix(markdown.nvim): link (10 weeks ago)
      eb7c109 chore(build): auto-generate docs (10 weeks ago)
      c37e145 chore(build): auto-generated build files (10 weeks ago)
      71429c9 feat: added support for markdown.nvim (10 weeks ago)
      8fb4f4d feat: grug-far (10 weeks ago)
      a487cac ci: update (10 weeks ago)
      7b6b1d9 chore(build): auto-generate docs (10 weeks ago)
      2d06e24 chore(build): auto-generated build files (10 weeks ago)
      7cd2a7e feat(extras): add fuzzel theme (#611) (10 weeks ago)
      1471dab chore(main): release 4.7.0 (#605) (2 months ago)
      1264d63 chore(build): auto-generate docs (2 months ago)
      6a2c662 chore(build): auto-generated build files (2 months ago)
      2603e00 feat(extras): add Vimium theme (#607) (2 months ago)
      2e41c5f chore(build): auto-generate docs (2 months ago)
      1bad1f8 chore(build): auto-generated build files (2 months ago)
      0804670 feat(extras): add process-compose extra (#606) (2 months ago)
      a2979ce chore(build): auto-generate docs (2 months ago)
      8eb52c0 chore(build): auto-generated build files (2 months ago)
      5e337dd feat: added support for grug-far.nvim (2 months ago)
      6adfcde chore(update): update repository (#604) (2 months ago)
      5c6ce13 chore(main): release 4.6.0 (#600) (2 months ago)
      e58f652 chore(build): auto-generate docs (3 months ago)
      34b6e21 chore(update): update repository (#603) (3 months ago)
      b357de8 chore(build): auto-generated build files (3 months ago)
      fd2afb6 feat: allow adding custom palettes. Fixes #595 (3 months ago)
      b0a0512 fix(which-key): WhichKeyNormal (3 months ago)
      bbb3f9f chore(update): update repository (#599) (3 months ago)
      197f5c9 chore(update): update repository (#598) (3 months ago)
      3e428ae chore(main): release 4.5.0 (#592) (3 months ago)
      103b592 chore(build): auto-generate docs (3 months ago)
      af0f646 chore(build): auto-generated build files (3 months ago)
      a23744b ci: mini.test and new repro template (3 months ago)
      468866d fix(treesitter): make jsx tags the same as tsx. Closes #597 (3 months ago)
      7f41b0e feat: helpExample (checkhealth) (3 months ago)

  ○ trouble.nvim  <leader>tt  <leader>tb  <leader>ts  <leader>tl  <leader>tq  nvim-lspconfig 
      6efc446 ci: update (10 weeks ago)
      e572509 chore(build): auto-generate docs (10 weeks ago)
      e67fee6 docs(update): rename results.win to win in README (#559) (10 weeks ago)
      40c5317 chore(main): release 3.6.0 (#557) (10 weeks ago)
      079de7b chore(build): auto-generate docs (10 weeks ago)
      891e76d feat: allow disabling a key (10 weeks ago)
      1f71d71 chore(build): auto-generate docs (10 weeks ago)
      05694b4 fix(text): skip treesitter when buf is no longer valid. Fixes #556 (10 weeks ago)
      ad8ef38 chore(main): release 3.5.2 (#546) (2 months ago)
      0879672 chore(build): auto-generate docs (2 months ago)
      85154ce perf(treesitter): incremental parsing for highlighter (2 months ago)
      bf99ea7 chore(update): update repository (#549) (2 months ago)
      f4eeadc chore(build): auto-generate docs (3 months ago)
      0adad6e chore(update): update repository (#547) (3 months ago)
      2946ce5 chore(build): auto-generate docs (3 months ago)
      e01c99e fix(util): concealcursor (3 months ago)
      03c1fbf chore(update): update repository (#545) (3 months ago)
      f630a44 chore(update): update repository (#544) (3 months ago)
      afe11cc chore(build): auto-generate docs (3 months ago)
      fc898ae chore(update): update repository (#542) (3 months ago)
      4453fea ci: update (3 months ago)
      bffb81e ci: update (3 months ago)
      5047f79 ci: update (3 months ago)
      c787b22 chore(update): update repository (#532) (3 months ago)
      5273137 chore(update): update repository (#531) (3 months ago)
      b61cebb chore(build): auto-generate docs (3 months ago)
      55bf67d ci: update (3 months ago)
      e32c194 ci: update (3 months ago)
      34be821 chore(build): auto-generate docs (3 months ago)
      0ee9ddc ci: update (3 months ago)

  ○ vim-tmux-navigator  <C-l>  <C-h>  <C-k>  <C-j> 
      a9b52e7 TPM Plugin configure key mapping (#380) (13 days ago)


Loaded (12)
  ● better-escape.nvim 1.12ms  start
  ● cmp-buffer 30.05ms  nvim-cmp
  ● cmp-cmdline 0.82ms  nvim-cmp
  ● cmp-nvim-lsp 7.17ms  nvim-cmp
  ● cmp-nvim-lua 0.84ms  nvim-cmp
  ● cmp-path 1.04ms  nvim-cmp
  ● cmp_luasnip 0.79ms  nvim-cmp
  ● incline.nvim 34.59ms  start
  ● playground 9.46ms  nvim-treesitter
  ● telescope-fzf-native.nvim 0.35ms  telescope.nvim
  ● telescope-ui-select.nvim 0.34ms  telescope.nvim
  ● telescope.nvim 33.8ms  VeryLazy

Not Loaded (6)
  ○ clangd_extensions.nvim  c  cpp  objc  objcpp  cuda  proto 
  ○ Comment.nvim  BufRead  BufNewFile 
  ○ harpoon  ]h  <localleader>r  <tab>  mm  <localleader>d  <localleader>q  <localleader>w  <localleader>e  <localleader>f  [h  <localleader>s  <localleader>a 
  ○ markdown-preview.nvim  markdown  <leader>mt  <leader>ms  <leader>mp 
  ○ vim-dotenv  laravel.nvim 
  ○ vim-illuminate  nvim-lspconfig 


```

