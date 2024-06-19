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
			"Open Harpoon",
		},
		{
			"<localleader>a",
			function()
				require("harpoon"):list():select(1)
			end,
			"Harpoon 1",
		},
		{
			"<localleader>s",
			function()
				require("harpoon"):list():select(2)
			end,
			"Harpoon 2",
		},
		{
			"<localleader>d",
			function()
				require("harpoon"):list():select(3)
			end,
			"Harpoon 3",
		},
		{
			"<localleader>f",
			function()
				require("harpoon"):list():select(4)
			end,
			"Harpoon 4",
		},
		{
			"[h",
			function()
				require("harpoon"):list():prev()
			end,
			"Harpoon prev",
		},
		{
			"]h",
			function()
				require("harpoon"):list():next()
			end,
			"Harpoon next",
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
