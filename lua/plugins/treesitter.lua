local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPre",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/playground",
  },
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

  local map = require("utils.map").map

  map("n", "<leader>tp", "<cmd>TSPlaygroundToggle<cr>", { desc = "[TS]:Playground toggle" })
  map("n", "<leader>tuc", "<cmd>TSHighlightCapturesUnderCursor<cr>", { desc = "[TS]:Playground toggle" })

  treesitter.setup {
    ensure_installed = parsers,
    auto_install = true,
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
  }

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.blade = {
    install_info = {
      url = "https://github.com/EmranMR/tree-sitter-blade",
      files = { "src/parser.c" },
      branch = "main",
    },
    filetype = "blade",
  }

  vim.filetype.add {
    pattern = {
      [".*%.blade%.php"] = "blade",
    },
  }
end

return M
