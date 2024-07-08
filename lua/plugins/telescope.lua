local M = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
    { "<leader>;", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "List buffers" },
    { "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Find words" },
    { "<leader>f'", "<cmd>lua require('telescope.builtin').marks()<cr>", desc = "Find marks" },
    { "<leader>fc", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "Find word under cursor" },
    { "<leader>fC", "<cmd>lua require('telescope.builtin').commands()<cr>", desc = "Find commands" },
    { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Find help" },
    { "<leader>fH", "<cmd>lua require('telescope.builtin').highlights()<cr>", desc = "Find highlights" },
    { "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = "List keymaps" },
    { "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", desc = "Find man" },
    { "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "Find old files" },
    { "<leader>fr", "<cmd>lua require('telescope.builtin').registers()<cr>", desc = "Find registers" },
    { "<leader>f<CR>", "<cmd>lua require('telescope.builtin').resume()<cr>", desc = "Resume previous search" },
    {
      "<leader>f.",
      "<cmd>lua require('telescope.builtin').find_files { hidden = true, no_ignore = true }<cr>",
      desc = "Find all files",
    },
    {
      "<leader>f/",
      "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
      desc = "Find words in current buffer",
    },
  },
}

M.config = function()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    return
  end

  local get_icon = require("utils.icons").get_icon
  local actions = require "telescope.actions"

  telescope.setup {
    defaults = {
      prompt_prefix = get_icon("Telescope", 2),
      selection_caret = get_icon("Selected", 1),
      path_display = { "smart" },
      file_ignore_patterns = { ".git/", "node_modules" },
      mappings = {
        i = {
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          [";"] = actions.close,
        },
        n = {
          [";"] = actions.close,
        },
      },
      -- layout_strategy = "vertical",
      layout_config = {
        height = 0.75,
        width = 0.65,
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      preview = true,
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
        previewer = true,
      },
      grep_string = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      find_files = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
      marks = {
        theme = "dropdown",
        previewer = true,
        initial_mode = "normal",
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          -- even more opts
          -- selection_caret = " ",
        },
      },
    },
  }
  telescope.load_extension "ui-select"
end

return M
