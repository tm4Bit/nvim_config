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
			desc = "Harpoon this file",
		},
		{
			"<tab>",
			function()
				local harpoon = require "harpoon"
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Open Harpoon",
		},
		{
			"<localleader>a",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon 1",
		},
		{
			"<localleader>s",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon 2",
		},
		{
			"<localleader>d",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon 3",
		},
		{
			"<localleader>f",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon 4",
		},
		{
			"[h",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Harpoon prev",
		},
		{
			"]h",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Harpoon next",
		},
	},
}

M.config = function()
	local status_ok, harpoon = pcall(require, "harpoon")
	if not status_ok then
		return
	end

	harpoon:setup()
end

return M
