local M = {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>e",
			"<cmd>Oil<cr>",
			desc = "Toogle Oil",
		},
	},
}

M.config = function()
	local status_ok, oil = pcall(require, "oil")
	if not status_ok then
		return
	end
	oil.setup {}
end

return M
