# after/ftplugin/html.lua

```lua
vim.opt.colorcolumn = "120"

```

# after/ftplugin/lua.lua

```lua
vim.opt.colorcolumn = "120"

```

# after/ftplugin/php.lua

```lua
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.colorcolumn = "120"

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
--- NVIM v0.11.3
--- Build type: Release
--- LuaJIT 2.1.1741730670
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

```

# lazy-lock.json

```json
{
  "Comment.nvim": { "branch": "master", "commit": "e30b7f2008e52442154b66f7c519bfd2f1e32acb" },
  "better-escape.nvim": { "branch": "master", "commit": "19a38aab94961016430905ebec30d272a01e9742" },
  "blink.cmp": { "branch": "main", "commit": "586ee87534f5bf65f1c8dea2d1da2a57e8cddd36" },
  "codecompanion.nvim": { "branch": "main", "commit": "d067c846d4f7239c6d3524ea3535f459b18dfd99" },
  "conform.nvim": { "branch": "master", "commit": "973f3cb73887d510321653044791d7937c7ec0fa" },
  "copilot.lua": { "branch": "master", "commit": "14bf786180b2ca4578915c56989b6d676dddc6f3" },
  "fidget.nvim": { "branch": "main", "commit": "d9ba6b7bfe29b3119a610892af67602641da778e" },
  "friendly-snippets": { "branch": "main", "commit": "572f5660cf05f8cd8834e096d7b4c921ba18e175" },
  "gitsigns.nvim": { "branch": "main", "commit": "93f882f7041a2e779addbd34943812ca66edef5a" },
  "harpoon": { "branch": "harpoon2", "commit": "ed1f853847ffd04b2b61c314865665e1dadf22c7" },
  "laravel.nvim": { "branch": "main", "commit": "e4f39d942352b03396a9df79896b0a8801675199" },
  "lazy.nvim": { "branch": "main", "commit": "6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a" },
  "markdown-preview.nvim": { "branch": "master", "commit": "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee" },
  "markview.nvim": { "branch": "main", "commit": "ec33f2aa333ca1d76f51847922578434d7aeadf7" },
  "mason-lspconfig.nvim": { "branch": "main", "commit": "bb3a17efc797c34c054463174e5522442576ebd8" },
  "mason.nvim": { "branch": "main", "commit": "8024d64e1330b86044fed4c8494ef3dcd483a67c" },
  "mini.nvim": { "branch": "main", "commit": "77e20cd6ed80fdf1738c116c35da81e7d9ad997e" },
  "neo-tree.nvim": { "branch": "v3.x", "commit": "cea666ef965884414b1b71f6b39a537f9238bdb2" },
  "none-ls-extras.nvim": { "branch": "main", "commit": "924fe88a9983c7d90dbb31fc4e3129a583ea0a90" },
  "none-ls.nvim": { "branch": "main", "commit": "a5954f00ee88bcdf154e931198ec636a26a1077c" },
  "nui.nvim": { "branch": "main", "commit": "de740991c12411b663994b2860f1a4fd0937c130" },
  "nvim-autopairs": { "branch": "master", "commit": "23320e75953ac82e559c610bec5a90d9c6dfa743" },
  "nvim-colorizer.lua": { "branch": "master", "commit": "8a9b722257b5e6733c340c36f4bd8693e5f47de3" },
  "nvim-jdtls": { "branch": "master", "commit": "4d77ff02063cf88963d5cf10683ab1fd15d072de" },
  "nvim-lspconfig": { "branch": "master", "commit": "f47cd681d7cb6048876a2e908b6d8ba1e530d152" },
  "nvim-treesitter": { "branch": "master", "commit": "42fc28ba918343ebfd5565147a42a26580579482" },
  "nvim-ts-context-commentstring": { "branch": "main", "commit": "1b212c2eee76d787bbea6aa5e92a2b534e7b4f8f" },
  "nvim-web-devicons": { "branch": "master", "commit": "0422a19d9aa3aad2c7e5cca167e5407b13407a9d" },
  "oil.nvim": { "branch": "master", "commit": "bbad9a76b2617ce1221d49619e4e4b659b3c61fc" },
  "playground": { "branch": "master", "commit": "ba48c6a62a280eefb7c85725b0915e021a1a0749" },
  "plenary.nvim": { "branch": "master", "commit": "857c5ac632080dba10aae49dba902ce3abf91b35" },
  "render-markdown.nvim": { "branch": "main", "commit": "b540997fbf7ccf3a39ce21162ce8957be2f67e37" },
  "rose-pine": { "branch": "main", "commit": "72befaffeac38db7bdd49e0549eaa2c4806dd878" },
  "snacks.nvim": { "branch": "main", "commit": "bc0630e43be5699bb94dadc302c0d21615421d93" },
  "tailwind-fold.nvim": { "branch": "main", "commit": "d9e7ca11691d252b35795726dff087bf013b2ebf" },
  "telescope-fzf-native.nvim": { "branch": "main", "commit": "1f08ed60cafc8f6168b72b80be2b2ea149813e55" },
  "telescope-ui-select.nvim": { "branch": "master", "commit": "6e51d7da30bd139a6950adf2a47fda6df9fa06d2" },
  "telescope.nvim": { "branch": "master", "commit": "a0bbec21143c7bc5f8bb02e0005fa0b982edc026" },
  "todo-comments.nvim": { "branch": "main", "commit": "304a8d204ee787d2544d8bc23cd38d2f929e7cc5" },
  "trouble.nvim": { "branch": "main", "commit": "85bedb7eb7fa331a2ccbecb9202d8abba64d37b3" },
  "vim-dotenv": { "branch": "master", "commit": "5c51cfcf8d87280d6414e03cd6b253eb70ecb800" },
  "vim-illuminate": { "branch": "master", "commit": "0d1e93684da00ab7c057410fecfc24f434698898" },
  "vim-tmux-navigator": { "branch": "master", "commit": "c45243dc1f32ac6bcf6068e5300f3b2b237e576a" }
}

```

# lua/autocommands.lua

```lua
local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup
local cmd = vim.cmd

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
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = "[LSP]Format file" }) -- format file

-- Navigation
map("n", "]b", "<cmd>bnext<CR>", { desc = "[BUFFER]:Next buffer" })
map("n", "[b", "<cmd>bprev<CR>", { desc = "[BUFFER]:Previous buffer" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with the cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with the cursor centered" })
map("n", "n", "nzzzv", { desc = "Next occourence with cursor centered" })
map("n", "N", "Nzzzv", { desc = "Previous occourence with cursor centered" })

-- Clipboard things
map("v", "p", '"_dP', { desc = "Better paste" }) -- Better paste
map("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete char without yanking" }) -- Better paste

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
map("n", "Q", "<nop>")

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
opt.guicursor = ""

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

# lua/plugins/ai.lua

```lua
return {
  "olimorris/codecompanion.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
    {
      "OXY2DEV/markview.nvim",
      lazy = false,
      opts = {
        preview = {
          filetypes = { "markdown", "codecompanion" },
          ignore_buftypes = {},
        },
      },
    },
  },
  opts = {
    display = {
      chat = {
        auto_scroll = false,
        icons = {
          buffer_pin = " ",
          buffer_watch = "󰈈 ",
        },
        debug_window = {
          width = vim.o.columns - 5,
          height = vim.o.lines - 2,
        },
        window = {
          layout = "float",
          position = nil,
          border = "single",
          height = 0.8,
          width = 0.45,
          relative = "editor",
          full_height = true,
          sticky = false,
          opts = {
            breakindent = true,
            cursorcolumn = false,
            cursorline = false,
            foldcolumn = "0",
            linebreak = true,
            list = false,
            numberwidth = 1,
            signcolumn = "no",
            spell = false,
            wrap = true,
          },
        },
      },
    },
    strategies = {
      chat = {
        roles = {
          ---The header name for the LLM's messages
          llm = function(adapter)
            return "CodeCompanion (" .. adapter.formatted_name .. ")"
          end,
          ---The header name for your messages
          ---@type string
          user = "tma",
        },
      },
    },
  },
  config = function(_, opts)
    local map = require("utils.map").map
    require("codecompanion").setup(opts)

    local progress = require "fidget.progress"
    local handles = {}
    local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestStarted",
      group = group,
      callback = function(e)
        handles[e.data.id] = progress.handle.create {
          title = "CodeCompanion",
          message = "Thinking...",
          lsp_client = { name = e.data.adapter.formatted_name },
        }
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestFinished",
      group = group,
      callback = function(e)
        local h = handles[e.data.id]
        if h then
          h.message = e.data.status == "success" and "Done" or "Failed"
          h:finish()
          handles[e.data.id] = nil
        end
      end,
    })

    map("n", "<localleader>c", "<cmd>CodeCompanion<cr>", { desc = "Code Companion" })
    map(
      { "n", "v" },
      "<leader>cc",
      "<cmd>CodeCompanionChat Toggle<cr>",
      { noremap = true, silent = true, desc = "Code Companion Toggle Chat" }
    )
    map(
      { "n", "v" },
      "<leader>ca",
      "<cmd>CodeCompanionActions<cr>",
      { noremap = true, silent = true, desc = "Code Companion Actions" }
    )
    map("v", "<leader>ci", ":CodeCompanion ", { desc = "Code Companion Inline" })
    map(
      "v",
      "ga",
      "<cmd>CodeCompanionChat Add<cr>",
      { noremap = true, silent = true, desc = "Code Companion Add snippet to chat" }
    )
  end,
}

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
  map("n", "<localleader>tc", function()
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
      "/home/tma/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",

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

# lua/plugins/lsp.lua

```lua
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "mason-org/mason.nvim",
      cmd = "Mason",
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
    },
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "folke/trouble.nvim",
    "RRethy/vim-illuminate",
  },
  config = function()
    local lspconfig = require "lspconfig"
    local masonlsp = require "mason-lspconfig"

    -- Require the server configurations and names from the utility file
    local servers_module = require "utils.lsp.servers"
    local lsp_servers_config = servers_module.get_lsp_configs()
    local server_names_for_mason = servers_module.get_all_server_names()

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local denylist = require "utils.lsp.illuminate-denylist"
    require("illuminate").configure(denylist)

    local get_icon = require("utils.icons").get_icon
    local signs = {
      { name = "DiagnosticSignError", text = get_icon("BoldError", 1) },
      { name = "DiagnosticSignWarn", text = get_icon("BoldWarning", 1) },
      { name = "DiagnosticSignHint", text = get_icon("BoldHint", 1) },
      { name = "DiagnosticSignInfo", text = get_icon("BoldInformation", 1) },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end

    vim.diagnostic.config {
      virtual_text = true,
      signs = { active = signs },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "single",
        source = true,
        header = "",
        prefix = "",
        suffix = "",
      },
    }

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("tma_lsp_attach", { clear = true }),
      callback = function(event)
        local map_key = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
          return
        end

        map_key("gd", require("telescope.builtin").lsp_definitions, "[G]oto [d]efinition")
        map_key("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map_key("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map_key("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map_key("gtd", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype [D]efinition")
        map_key("gh", vim.lsp.buf.hover, "[G]oto [H]over Documentation")
        map_key("gl", vim.diagnostic.open_float, "Float Diagnostic")

        map_key("<leader>la", vim.lsp.buf.code_action, "[L]SP code [A]ction", { "n", "v" })
        map_key("<leader>lr", vim.lsp.buf.rename, "[L]SP [R]ename")

        map_key("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[L]SP document [S]ymbols")
        map_key(
          "<leader>lws",
          require("telescope.builtin").lsp_dynamic_workspace_symbols,
          "[L]SP [W]orkspace [S]ymbols"
        )

        map_key("<leader>]d", function()
          require("trouble").next { skip_groups = true, jump = true }
        end, "Next Diagnostic (Trouble)")
        map_key("<leader>[d", function()
          require("trouble").previous { skip_groups = true, jump = true }
        end, "Prev Diagnostic (Trouble)")

        vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", {
          buffer = event.buf,
          desc = "LSP: LspInfo (:checkhealth vim.lsp)",
        })

        require("illuminate").on_attach(client)

        if client.name == "angularls" then
          client.server_capabilities.renameProvider = false
        end

        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map_key("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    masonlsp.setup {
      ensure_installed = server_names_for_mason,
      automatic_installation = true,
      automatic_enable = false,
      handlers = {}, -- Manual loop below handles setup
    }

    for server_name, server_specific_config in pairs(lsp_servers_config) do
      -- Skip servers
      if server_name == "jdtls" or server_name == "clangd" then
        goto continue
      end

      -- Start with a deepcopy of the server-specific config from utils/lsp/servers.lua
      local effective_server_opts = vim.deepcopy(server_specific_config or {})
      -- Ensure global capabilities are merged correctly.
      -- Server-specific capabilities (if defined in server_specific_config.capabilities) will take precedence.
      effective_server_opts.capabilities =
        vim.tbl_deep_extend("force", vim.deepcopy(capabilities), effective_server_opts.capabilities or {})

      if lspconfig[server_name] then
        lspconfig[server_name].setup(effective_server_opts)
      end
      ::continue::
    end
  end,
}

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
    local diff = require "mini.diff"
    diff.setup {
      -- Disabled by default
      source = diff.gen_source.none(),
    }
  end,
}

return M

```

# lua/plugins/neotree.lua

```lua
local M = {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
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
      width = 50,
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
      ["<leader>o"] = "actions.close",
    },
  },
  keys = {
    {
      "<leader>o",
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
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>tss", -- set to `false` to disable one of the mappings
        node_incremental = "<leader>tni",
        scope_incremental = "<leader>tsi",
        node_decremental = "<leader>tnd",
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
    vim.cmd "new"
    vim.cmd "setlocal nonumber"
    vim.cmd "setlocal norelativenumber"
    vim.cmd "setlocal signcolumn=no"
    vim.cmd "setlocal nobuflisted"
    M.window = vim.fn.win_getid()
  end
  vim.api.nvim_win_set_height(M.window, M.height)

  if vim.fn.bufexists(M.buffer) == 0 then
    local job_id = nil
    M.buffer = vim.fn.bufnr "%"
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
  vim.cmd "wincmd p"
end

vim.api.nvim_create_user_command("TerminalOpen", function()
  M.open(nil)
end, {})
vim.api.nvim_create_user_command("TerminalHide", M.hide, {})
vim.api.nvim_create_user_command("TerminalDestroy", M.destroy, {})

-- Toggle
vim.keymap.set("n", "<C-\\>", ":TerminalOpen<CR>:startinsert<CR>", { silent = true })
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

# lua/utils/lsp/servers.lua

```lua
local M = {}

-- This table holds the configurations for each LSP server.
-- Keys are server names (as used by nvim-lspconfig).
-- Values are tables containing the specific options for that server.
M.configurations = {
  -- Servers handled by dedicated plugins (listed here so Mason can install them)
  clangd = {
    -- No lspconfig.setup options here; clangd_extensions.nvim handles it.
    -- Mason will ensure it's installed if it's in the list passed to ensure_installed.
  },
  jdtls = {
    -- No lspconfig.setup options here; nvim-jdtls handles it.
  },

  -- Lua
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim", "spec" } },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.stdpath "config" .. "/lua"] = true,
          },
          checkThirdParty = false,
        },
        telemetry = { enable = false },
        hint = {
          enable = true,
          arrayIndex = "Disable", -- Copied from your lua/settings/lua_ls.lua
          await = true,
          paramName = "All",
          paramType = false,
          semicolon = "All",
          setType = false,
        },
        format = { enable = false }, -- From your lua/settings/lua_ls.lua
      },
    },
  },

  -- TypeScript / JavaScript
  ts_ls = {
    -- Content from your previous lua/settings/ts_ls.lua (formerly tsserver.lua)
    settings = {
      typescript = {
        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = true, showOnAllFunctions = true },
        inlayHints = {
          includeInlayParameterNameHints = "all",
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
        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = true, showOnAllFunctions = true },
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = false,
        },
      },
    },
  },

  -- PHP
  intelephense = {
    init_options = {
      licenceKey = "/home/tma/intelephense/licence.txt", -- Your specific path
    },
  },

  -- Web Development Servers
  cssls = {}, -- Uses defaults + global capabilities
  html = {}, -- Uses defaults + global capabilities
  emmet_ls = {
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
  },
  tailwindcss = {
    -- Example: If you had specific settings for tailwindcss
    -- settings = { tailwindCSS = { includeLanguages = { plaintext = "html" } } }
  },
  svelte = {},
  angularls = {
    cmd = {
      "/home/tma/.asdf/installs/nodejs/22.16.0/bin/ngserver",
      "--stdio",
      "--tsProbeLocations",
      "/home/tma/.asdf/installs/nodejs/22.16.0/lib/node_modules/@angular/language-server",
      "--ngProbeLocations",
      "/home/tma/.asdf/installs/nodejs/22.16.0/lib/node_modules/@angular/language-server",
    },
    on_new_config = function(new_config, new_root_dir)
      local ng_lib_path = "/home/tma/.asdf/installs/nodejs/22.16.0/lib/node_modules/@angular/language-server"
      new_config.cmd = {
        "ngserver",
        "--stdio",
        "--tsProbeLocations",
        ng_lib_path .. "," .. new_root_dir,
        "--ngProbeLocations",
        ng_lib_path .. "," .. new_root_dir,
      }
    end,
  },
  astro = {
    cmd = { "/home/tma/.local/share/fnm/node-versions/v20.15.1/installation/bin/astro-ls", "--stdio" },
  },
  templ = {},

  -- Other Languages & Tools
  prismals = {},
  marksman = {},
  pyright = {
    -- Content from your previous lua/settings/pyright.lua
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
        },
      },
    },
  },
  bashls = {},
  jsonls = {
    -- Example if you want to enable schema download for jsonls
    -- settings = {
    --   json = {
    --     schemas = require('schemastore').json.schemas(),
    --     validate = { enable = true },
    --   },
    -- },
  },
  yamlls = {},
  gopls = {},
  -- Add all other servers from your original list.
  -- For servers needing only default lspconfig behavior + your global capabilities,
  -- an empty table `{}` is sufficient, e.g., `some_other_lsp = {},`
}

-- Function to get the server configurations table
function M.get_lsp_configs()
  return M.configurations
end

-- Function to get just the list of server names (for Mason's ensure_installed)
function M.get_all_server_names()
  local names = {}
  for server_name, _ in pairs(M.configurations) do
    table.insert(names, server_name)
  end
  return names
end

return M

```

# lua/utils/map.lua

```lua
local M = {}

---@param mode string | table The mode(s) that the command will be executed
---@param map string The keymap to be executed by the user
---@param execute string | function The command or function to be executed
---@param opts? table vim.keymap.set option table
M.map = function(mode, map, execute, opts)
  vim.keymap.set(mode, map, execute, opts)
end

return M

```

# README.md

```md
# Hello

```

