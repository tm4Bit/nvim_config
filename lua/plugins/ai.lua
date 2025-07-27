return {
  "olimorris/codecompanion.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
    {
      "OXY2DEV/markview.nvim",
      ft = { "markdown", "codecompanion" },
      opts = {
        preview = {
          filetypes = { "markdown", "codecompanion" },
          ignore_buftypes = {},
        },
      },
    },
  },
  opts = {
    display = {
      chat = {
        auto_scroll = false,
        icons = {
          buffer_pin = " ",
          buffer_watch = "󰈈 ",
        },
        debug_window = {
          width = vim.o.columns - 5,
          height = vim.o.lines - 2,
        },
        window = {
          layout = "float",
          position = nil,
          border = "single",
          height = 0.95,
          width = 0.65,
          relative = "editor",
          full_height = true,
          sticky = false,
          opts = {
            breakindent = true,
            cursorcolumn = false,
            cursorline = false,
            foldcolumn = "0",
            linebreak = true,
            list = false,
            numberwidth = 1,
            signcolumn = "no",
            spell = false,
            wrap = true,
          },
        },
      },
    },
    strategies = {
      chat = {
        roles = {
          ---The header name for the LLM's messages
          llm = function(adapter)
            return "CodeCompanion (" .. adapter.formatted_name .. ")"
          end,
          ---The header name for your messages
          ---@type string
          user = "tma",
        },
      },
    },
  },
  config = function(_, opts)
    local map = require("utils.map").map
    require("codecompanion").setup(opts)

    local progress = require "fidget.progress"
    local handles = {}
    local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestStarted",
      group = group,
      callback = function(e)
        handles[e.data.id] = progress.handle.create {
          title = "CodeCompanion",
          message = "Thinking...",
          lsp_client = { name = e.data.adapter.formatted_name },
        }
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestFinished",
      group = group,
      callback = function(e)
        local h = handles[e.data.id]
        if h then
          h.message = e.data.status == "success" and "Done" or "Failed"
          h:finish()
          handles[e.data.id] = nil
        end
      end,
    })

    map("n", "<localleader>c", "<cmd>CodeCompanion<cr>", { desc = "Code Companion" })
    map(
      { "n", "v" },
      "<leader>cc",
      "<cmd>CodeCompanionChat Toggle<cr>",
      { noremap = true, silent = true, desc = "Code Companion Toggle Chat" }
    )
    map(
      { "n", "v" },
      "<leader>ca",
      "<cmd>CodeCompanionActions<cr>",
      { noremap = true, silent = true, desc = "Code Companion Actions" }
    )
    map("v", "<leader>ci", ":CodeCompanion ", { desc = "Code Companion Inline" })
    map(
      "v",
      "ga",
      "<cmd>CodeCompanionChat Add<cr>",
      { noremap = true, silent = true, desc = "Code Companion Add snippet to chat" }
    )
  end,
}
