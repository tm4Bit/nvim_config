local map = require("utils.map").map

map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Open Lazy" })                                      -- Lazy
map("n", "<leader>N", "<cmd>NullLsInfo<cr>", { desc = "Null-ls information" })                      -- NullLsInfo
map("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Open Lazy" })                                     -- Mason
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = "Format file" }) -- format file
map("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "Lsp Restart" })                             -- Restart Lsp
map("n", "<leader>c", "<cmd>bdelete<cr>", { desc = "Close the current buffer" })                    -- close buffer
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Dismiss highlight in search" })              -- Clear highlight
map("n", "<leader>C", "<cmd>e $MYVIMRC<CR>", { desc = "GoTo configuration file" })                  -- GoTo configuration file
map("v", "p", '"_dP', { desc = "Better paste" })                                                    -- Better paste
map("i", "kj", "<esc>", { desc = "Better escape" })                                                 -- better escape

-- Resize buffer
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- Split
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "-", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Remap j and k
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })

-- Moving line up and down with alt-k and alt-j
map("n", "<M-j>", "V:m '>+1<CR>gv=gv<esc>", { desc = "Move line(s) upwards", silent = true })
map("n", "<M-k>", "V:m '<-2<CR>gv=gv<esc>", { desc = "Move line(s) downwards", silent = true })

-- NORMAL MODE --
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save buffer" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit neovim" })
map("n", "<localleader>r", "<cmd>source %<cr>", { desc = "Source init.lua" })

-- Split window
map("n", "|", "<cmd>vsplit<cr>", { desc = "Slipt window vertically" })
map("n", "-", "<cmd>split<cr>", { desc = "Slipt window vertically" })

-- Indentation
map("v", "<", "<gv", { desc = "Unindent line" })
map("v", ">", ">gv", { desc = "Indent line" })
