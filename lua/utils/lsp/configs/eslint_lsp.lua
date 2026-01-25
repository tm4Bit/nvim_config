return {
  settings = {
    workingDirectory = { mode = "auto" },
  },
  -- Forçamos o lspconfig a reconhecer os novos nomes de arquivo como marcadores de raiz
  root_dir = function(fname)
    local util = require "lspconfig.util"
    return util.root_pattern(
      "eslint.config.js",
      "eslint.config.mjs",
      "eslint.config.cjs",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.json",
      "package.json",
      ".git"
    )(fname)
  end,
}
