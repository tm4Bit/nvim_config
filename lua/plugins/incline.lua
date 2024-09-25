local M = {
  "b0o/incline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- event = "VeryLazy",
}

M.config = function()
  local helpers = require "incline.helpers"
  local devicons = require "nvim-web-devicons"
  local get_icon = require("utils.icons").get_icon
  require("incline").setup {
    window = {
      padding = 0,
      margin = { horizontal = 0 },
    },
    debounce_threshold = {
      falling = 50,
      rising = 1,
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      if filename == "" then
        filename = "[No Name]"
      end
      local ft_icon, ft_color = devicons.get_icon_color(filename)
      local modified = vim.bo[props.buf].modified
      return {
        ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
        " ",
        { filename, gui = modified and "bold,italic" or "bold" },
        " ",
        -- modified and { get_icon("Modified", 1), guifg = ft_color } or "",
        modified and { get_icon("Modified", 1) } or "",
        -- guibg = "#44406e",
      }
    end,
  }
end

return M
