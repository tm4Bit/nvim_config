local M = {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
}

M.config = function()
  local status_ok, colorscheme = pcall(require, "rose-pine")
  if not status_ok then
    return
  end

  colorscheme.setup {
    variant = "main", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
  }

  vim.cmd "colorscheme rose-pine"
end

return M

--[[ return {
  "folke/tokyonight.nvim",
  -- lazy = false,
  priority = 1000,
	name = "tokyonight",
	config = function ()
		local tokyonight = require("tokyonight")
		tokyonight.setup({
			style = "night"
		})
		vim.cmd "colorscheme tokyonight"
	end
} ]]

--[[ return {
  "gmr458/vscode_modern_theme.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vscode_modern").setup {
      cursorline = true,
      transparent_background = false,
      nvim_tree_darker = true,
    }
    vim.cmd.colorscheme "vscode_modern"
  end,
} ]]
