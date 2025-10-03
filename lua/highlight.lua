-- Reset the highlight group
-- This make `WinSeparator` the same color for any colorscheme
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#6e6a86", bg = "none" } )

-- Just link the highlight group to another
-- This help when you change the colorscheme
vim.cmd [[
	hi! link ColorColumn Visual
	hi! link LspInlayHint LineNr
]]

-- Theming mini-statusline
local augroup = vim.api.nvim_create_augroup("MiniStatuslineTheme", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup,
  pattern = "*",
  desc = "Set a custom color palette for mini.statusline",
  callback = function()
    local hl = vim.api.nvim_set_hl
    if vim.g.colorscheme == "darkplus" then
      local dark_bg = "#1E1E1E"

      hl(0, "MiniStatuslineModeNormal", { fg = dark_bg, bg = "#5498d0", bold = true })
      hl(0, "MiniStatuslineModeInsert", { fg = dark_bg, bg = "#cc9077", bold = true })
      hl(0, "MiniStatuslineModeVisual", { fg = dark_bg, bg = "#95d2f2", bold = true })
      hl(0, "MiniStatuslineModeReplace", { fg = dark_bg, bg = "#95d2f2", bold = true })
      hl(0, "MiniStatuslineModeCommand", { fg = "#D4D4D4", bg = "#424242", bold = true })
      hl(0, "MiniStatuslineModeOther", { fg = dark_bg, bg = "#95d2f2", bold = true })

      hl(0, "MiniStatuslineFilename", { fg = "#D4D4D4", bold = true, bg = "none" })
      hl(0, "MiniStatuslineFileinfo", { fg = "#6C7079", bg = "none" })
      hl(0, "MiniStatuslineDevinfo", { fg = "#6C7079", bg = "none" })

      hl(0, "MiniStatuslineInactive", { link = "StatusLineNC" })
    elseif vim.g.colorscheme == "gruvbox" then
      hl(0, "MiniStatuslineFilename", { fg = "#fbf1c7", bold = true, bg = "none" })
      hl(0, "MiniStatuslineDevinfo", { fg = "#a89984", bold = false, bg = "none" })
      hl(0, "MiniStatuslineFileinfo", { fg = "#a89984", bold = false, bg = "none" })
    end
  end,
})
