local M = {
	"danymat/neogen",
	-- Uncomment next line if you want to follow only stable versions
	version = "*",
	keys = {
		{
			"<leader>gf",
			"<cmd>lua require('neogen').generate({ type = 'func' })<cr>",
			desc = "Generate docs",
		},
		{
			"<leader>gc",
			"<cmd>lua require('neogen').generate({ type = 'class' })<cr>",
			desc = "Generate docs",
		},
		{
			"<leader>gt",
			"<cmd>lua require('neogen').generate({ type = 'type' })<cr>",
			desc = "Generate docs",
		},
	},
}

M.config = function()
	require("neogen").setup {
		snippet_engine = "luasnip",
		languages = {
			["javascript.jsdoc"] = require "neogen.configurations.javascript",
		},
	}
end
return M
