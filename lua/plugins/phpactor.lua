local M = {
  "phpactor/phpactor",
  ft = "php",
  build = "composer install --no-dev -o",
}

M.config = function()
  local map = require("utils.map").map

  map("n", "<leader>pc", "<cmd>PhpactorCacheClear<cr>", { desc = "Phpactor" })
  map("n", "<leader>pnc", "<cmd>PhpactorClassNew<cr>", { desc = "Phpactor" })
  map("n", "<leader>pem", "<cmd>PhpactorExtractMethod<cr>", { desc = "Phpactor" })
  map("n", "<leader>pic", "<cmd>PhpactorImportClass<cr>", { desc = "Phpactor" })
  map("n", "<leader>pgd", "<cmd>PhpactorGotoDefinition<cr>", { desc = "Phpactor" })
  map("n", "<leader>pcm", "<cmd>PhpactorContextMenu<cr>", { desc = "Phpactor" })
  map("n", "<leader>pn", "<cmd>PhpactorNavigate<cr>", { desc = "Phpactor" })
  map("n", "<leader>pT", "<cmd>PhpactorTransform<cr>", { desc = "Phpactor" })
  map("n", "<leader>pce", "<cmd>PhpactorClassExpand<cr>", { desc = "Phpactor" })
  map("n", "<leader>ph", "<cmd>PhpactorHover<cr>", { desc = "Phpactor" })
  map("n", "<leader>pE", "<cmd>PhpactorExtractExpression<cr>", { desc = "Phpactor" })
  map("n", "<leader>pC", "<cmd>PhpactorExtractConstant<cr>", { desc = "Phpactor" })
end

return M
