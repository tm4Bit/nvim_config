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

local dashboard = require "alpha.themes.dashboard"
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
})

autocmd({ "User" }, {
  desc = "Disable statusline for alpha",
  group = alpha_settings,
  pattern = "AlphaReady",
  callback = function()
    vim.b.ministatusline_disable = true
    vim.b.miniindentscope_disable = true
  end,
})

autocmd("FileType", {
  desc = "Set wordwrap and spell checking in git and markdown files",
  group = autogroup("wordwrap_spell", { clear = true }),
  pattern = { "gitcommit", "markdown", "mdx" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.spell = true
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
