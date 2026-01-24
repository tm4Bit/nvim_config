local map = require("utils.map").map

map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Open Lazy" }) -- Lazy
map("n", "<leader>N", "<cmd>NullLsInfo<cr>", { desc = "Null-ls information" }) -- NullLsInfo
map("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Open Lazy" }) -- Mason
map("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "[LSP]:Restart server" }) -- Restart Lsp
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Dismiss highlight in search" }) -- Clear highlight
map("n", "<leader>C", "<cmd>e $MYVIMRC<CR>", { desc = "GoTo configuration file" }) -- GoTo configuration file
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = "[LSP]Format file" }) -- format file
map("n", "<leader>a", "<cmd>enew<cr>", { desc = "Create new file" })

-- Navigation
map("n", "]b", "<cmd>bnext<CR>", { desc = "[BUFFER]:Next buffer" })
map("n", "[b", "<cmd>bprev<CR>", { desc = "[BUFFER]:Previous buffer" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with the cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with the cursor centered" })
map("n", "n", "nzzzv", { desc = "Next occourence with cursor centered" })
map("n", "N", "Nzzzv", { desc = "Previous occourence with cursor centered" })

-- Clipboard things
map("v", "p", '"_dP', { desc = "Better paste" }) -- Better paste
map("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete char without yanking" }) -- Better paste

-- Resize buffer
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- Remap j and k
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })

-- Moving line up and down with alt-k and alt-j
map("n", "<M-j>", "V:m '>+1<CR>gv=gv<esc>", { desc = "Move line(s) upwards", silent = true })
map("n", "<M-k>", "V:m '<-2<CR>gv=gv<esc>", { desc = "Move line(s) downwards", silent = true })

-- NORMAL MODE --
map("n", "<leader>w", "<cmd>silent! w<cr>", { desc = "Save buffer" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit neovim" })
map("n", "<localleader>r", "<cmd>source %<cr>", { desc = "Source init.lua" })
map("n", "Q", "<nop>")

-- Split window
map("n", "|", "<cmd>vsplit<cr>", { desc = "Slipt window vertically" })
map("n", "-", "<cmd>split<cr>", { desc = "Slipt window vertically" })

-- Indentation
map("v", "<", "<gv", { desc = "Unindent line" })
map("v", ">", ">gv", { desc = "Indent line" })
