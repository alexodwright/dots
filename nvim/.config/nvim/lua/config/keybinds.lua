local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- other keybinds
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
map("n", "<leader>tp", "<cmd>Themery<cr>")
map("n", "<c-k>", "<cmd>wincmd k<CR>")
map("n", "<c-j>", "<cmd>wincmd j<CR>")
map("n", "<c-h>", "<cmd>wincmd h<CR>")
map("n", "<c-l>", "<cmd>wincmd l<CR>")
map("n", "<leader>bb", "<cmd>BufferPick<CR>")
map("n", "<leader>bc", "<cmd>BufferClose<CR>")
map("n", "<leader>ba", "<cmd>BufferCloseAllButCurrent<CR>")
map('n', '<leader>d', vim.diagnostic.open_float, { noremap=true, silent=true })
map('n', '<leader>gd', vim.lsp.buf.definition, { noremap = true, silent = true })
