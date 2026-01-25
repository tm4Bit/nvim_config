-- Reset the highlight group
-- This make `WinSeparator` the same color for any colorscheme
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#6e6a86", bg = "none" } )

-- Just link the highlight group to another
-- This help when you change the colorscheme
vim.cmd [[
	hi! link ColorColumn Visual
	hi! link LspInlayHint LineNr
]]
