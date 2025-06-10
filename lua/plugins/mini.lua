local M = {
  "echasnovski/mini.nvim", -- Collection of various small independent plugins/modules
  event = "VeryLazy",
  config = function()
    local get_icon = require("utils.icons").get_icon

    require("mini.ai").setup { n_lines = 500 }
    require("mini.indentscope").setup {
      symbol = get_icon "LineLeft",
    }
    require("mini.surround").setup {}

    local statusline = require "mini.statusline"
    statusline.setup {
      use_icons = true,
      set_vim_settings = false,
    }
    statusline.section_location = function()
      return "%2l:%-2v"
    end
    statusline.section_filename = function()
      local modified = vim.bo.modified
      return get_icon("File", 1) .. "%f%r" .. " " .. (modified and get_icon("Modified", 1) or "")
    end
    local diff = require "mini.diff"
    diff.setup {
      -- Disabled by default
      source = diff.gen_source.none(),
    }
  end,
}

return M
