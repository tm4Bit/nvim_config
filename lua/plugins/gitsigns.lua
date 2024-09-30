local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
}

M.opts = {
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "-" },
    topdelete = { text = "-" },
    changedelete = { text = "~-" },
    untracked = { text = "#" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 200,
    ignore_whitespace = true,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
}

M.config = function(_, opts)
  require("gitsigns").setup(opts)

  local function map(mode, lhs, rhs, keymap_opt)
    opts = vim.tbl_extend("force", { noremap = true, silent = true }, keymap_opt or {})
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- Navigation
  map("n", "]g", "<cmd>Gitsigns next_hunk<cr>", { desc = "[GIT]:Next hunk" })
  map("n", "[g", "<cmd>Gitsigns prev_hunk<cr>", { desc = "[GIT]:Previous hunk" })

  -- Actions
  map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "[GIT]:Stage hunk" })
  map("v", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "[GIT]:Stage selected hunk" })
  map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "[GIT]:Reset hunk" })
  map("v", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "[GIT]:Reset selected hunk" })
  map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "[GIT]:Stage buffer" })
  map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "[GIT]:Undo stage hunk" })
  map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "[GIT]:Reset Buffer" })
  map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "[GIT]:Preview hunk" })
  map("n", "<leader>gb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { desc = "[GIT]:Blame line" })
  map("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[GIT]:Blame line toggle" })
  map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "[GIT]:Git diff" })
  map("n", "<leader>gD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', { desc = "[GIT]:diff" })
  map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "[GIT]:Toggle delete" })
end

return M
