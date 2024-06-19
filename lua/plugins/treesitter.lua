local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
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

	treesitter.setup({
		ensure_installed = parsers,
		auto_install = true,
		indent = {
			enable = true
		},
		highlight = {
			enable = true
		},
	})
end

return M
