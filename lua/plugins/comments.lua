local M = {
  "numToStr/Comment.nvim",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}

M.config = function()
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    return
  end

  -- Comment.nvim calculates the contextual commentstring in its pre_hook.
  -- Disable the plugin's legacy CursorHold autocmd, which can run in buffers
  -- without an active parser on Nvim 0.12.
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }

  local map = require("utils.map").map

  comment.setup {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
      ---Line-comment toggle keymap
      line = "gcc",
      ---Block-comment toggle keymap
      block = "gbc",
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      ---Line-comment keymap
      line = "gc",
      ---Block-comment keymap
      block = "gb",
    },
    ---LHS of extra mappings
    extra = {
      ---Add comment on the line above
      above = "gcO",
      ---Add comment on the line below
      below = "gco",
      ---Add comment at the end of line
      eol = "gcA",
    },
    ---Enable keybindings
    -- NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
    },

    pre_hook = function(ctx)
      local U = require "Comment.utils"
      local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

      -- Only calculate commentstring for tsx filetypes
      if vim.bo.filetype == "typescriptreact" then
        -- Determine the location where to calculate commentstring from
        local location = nil
        if ctx.ctype == U.ctype.blockwise then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        local ok, commentstring = pcall(
          require("ts_context_commentstring.internal").calculate_commentstring,
          { key = type, location = location }
        )

        if ok and commentstring then
          return commentstring
        end
      end

      -- Comment.nvim's bundled Treesitter detection assumes get_parser()
      -- always returns a tree, which is no longer true on Nvim 0.12. The
      -- native option is correct for regular filetypes (tmux uses "# %s").
      return vim.bo.commentstring ~= "" and vim.bo.commentstring or nil
    end,
  }

  -- Extra mappings
  map("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
  end, { desc = "[COMMENT]:Toggle comment line" })
  map(
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = "[COMMENT]:Toggle comment for selection" }
  )
end

return M
