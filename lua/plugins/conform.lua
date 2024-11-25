local M = {
  "stevearc/conform.nvim",
  event = { "BufRead", "BufReadPost" },
}

M.config = function()
  local status_ok, conform = pcall(require, "conform")
  if not status_ok then
    return
  end

  local map = require("utils.map").map
  conform.setup {
    formatters_by_ft = {
      -- Comform will stop after the first
      lua = { "stylua", stop_after_first = true },
      python = { "black", stop_after_first = true },
      javascript = { "prettierd", stop_after_first = true },
      javascriptreact = { "eslintd", stop_after_first = true },
      typescript = { "prettierd", stop_after_first = true },
      typescriptreact = { "eslintd", stop_after_first = true },
      html = { "prettierd", stop_after_first = true },
      css = { "prettierd", stop_after_first = true },
      scss = { "prettierd", stop_after_first = true },
      php = { "phpcsfixer", stop_after_first = true },
      -- Comform will run multiple formatters sequentially
      go = { "gofumpt", "goimports" },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    end,
  }

  -- Create user commands to enable and disable `format_on_save`
  vim.api.nvim_create_user_command("FormatDisable", function(args)
    -- If you run `FormatDisable!` disable `format_on_save`
    -- only for the current buffer
    if args.bang then
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
  end, {
    desc = "Disable autoformat-on-save",
    bang = true,
  })

  vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
  end, {
    desc = "Re-enable autoformat-on-save",
  })

  -- Map the keymap for FormatEnable and FormatDisable
  map("n", "<localleader>tf", function()
    if vim.g.disable_autoformat or vim.b.disable_autoformat then
      print "[COMFORM] Format on save on!"
      vim.cmd "FormatEnable"
    else
      print "[COMFORM] Format on save off!"
      vim.cmd "FormatDisable"
    end
  end, { desc = "Toggle autoformat" })
end

return M
