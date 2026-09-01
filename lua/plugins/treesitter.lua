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

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require "nvim-treesitter"

    -- The main branch for Nvim 0.12 no longer uses
    -- nvim-treesitter.configs or nvim-treesitter/playground modules.
    treesitter.setup {}
    treesitter.install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("tma_treesitter", { clear = true }),
      callback = function(event)
        pcall(vim.treesitter.start, event.buf)

        if vim.treesitter.language.get_lang(vim.bo[event.buf].filetype) then
          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    vim.keymap.set("n", "<leader>tp", "<cmd>InspectTree<cr>", {
      desc = "[TS]: Inspect syntax tree",
    })
    vim.keymap.set("n", "<leader>tuc", "<cmd>Inspect<cr>", {
      desc = "[TS]: Inspect node under cursor",
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "TSUpdate",
      callback = function()
        require("nvim-treesitter.parsers").blade = {
          install_info = {
            url = "https://github.com/EmranMR/tree-sitter-blade",
            files = { "src/parser.c" },
            branch = "main",
          },
        }
      end,
    })

    vim.filetype.add {
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    }
  end,
}
