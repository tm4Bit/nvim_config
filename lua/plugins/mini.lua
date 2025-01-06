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
		local modified_icon = get_icon("Modified", 1)
    statusline.section_filename = function()
      return get_icon("File", 1) .. "%f%r" .. " " .. (vim.bo.modified and modified_icon or "")
    end
  end,
}

return M
