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
opt.cursorcolumn = true
opt.signcolumn = "yes"
--opt.list = true

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

-- Plugins related stuff
opt.completeopt = { "menuone", "noselect" }
