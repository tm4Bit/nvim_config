local M = {
  "b0o/incline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
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
      falling = 75,
      rising = 75,
    },

    render = function(props)
      local function get_harpoon_items()
        local harpoon = require "harpoon"
        local marks = harpoon:list().items
        local current_file_path = vim.fn.expand "%:p:."
        local component = {}

        for id, item in ipairs(marks) do
          if item.value == current_file_path then
            table.insert(component, { id .. " ", guifg = "#FFFFFF", gui = "bold" })
          else
            table.insert(component, { id .. " ", guifg = "#57534E" })
          end
        end

        if #component > 0 then
          table.insert(component, 1, { " ", get_icon("Harpoon", 1), guifg = "#61AfEf" })
        end
        return component
      end

      local function get_filename()
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local component = {}

        table.insert(component, { " ", filename, " ", gui = "bold,italic" })

        if modified then
          table.insert(component, { get_icon("Modified", 1) })
        end

        if ft_icon then
          table.insert(component, 1, { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) })
        end
        return component
      end

      return {
        { get_harpoon_items() },
        { get_filename() },
        -- guibg = "#44406e",
      }
    end,
  }
end

return M
