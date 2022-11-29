-- Leader
vim.g.mapleader = " "

-- General Keymaps

vim.keymap.set("i", "jk", "<ESC>") -- insert mode <Leader>jk to escape

vim.keymap.set("n", "<leader>cs", ":nohl<CR>") -- normal mode <Leader>cs to clear search highlights

-- window splits
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>eq", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>cl", ":close<CR>") -- close current window

-- tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- new tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>")

vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")
vim.keymap.set('n', "<leader>rf", ":RustFmt<CR>")

vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
