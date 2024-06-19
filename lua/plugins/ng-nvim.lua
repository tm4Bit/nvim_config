local M = {
  "joeveiga/ng.nvim",
  ft = "typescript",
	keys = {
		{ "<leader>at", "<cmd>lua require('ng').goto_template_for_component()<cr>", desc = "GoTo template"},
		{ "<leader>ac", "<cmd>lua require('ng').goto_component_with_template_file()<cr>", desc = "GoTo template"},
	}
}

return M
