local M = {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
}
M.config = function()
  require("rose-pine").setup {
    variant = "main", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
  }

	vim.cmd("colorscheme rose-pine")
end

return M
