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
opt.cmdheight = 0
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
opt.tabstop = 2 -- Number of spaces that a <Tab> counts for while editing
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true -- Use spaces instead of tabs
opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for while editing
opt.inccommand = "split"
opt.iskeyword:append "-"

-- Plugins related stuff
opt.completeopt = { "menuone", "noselect" }
