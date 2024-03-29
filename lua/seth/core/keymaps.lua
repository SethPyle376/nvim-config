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

vim.keymap.set('n', "<leader>ft", ":FloatermNew <CR>")
vim.keymap.set('n', "<leader>fn", ":FloatermNext <CR>")
vim.keymap.set('n', "<leader>t", ":FloatermPrev <CR>")
vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")
vim.keymap.set('n', "<leader>rf", ":RustFmt<CR>")

vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

vim.keymap.set("n", "<leader>br", ":call vimspector#ToggleBreakpoint()<CR>")
vim.keymap.set("n", "<leader>aw", ":call vimspector#AddWatch()<CR>")
vim.keymap.set("n", "<leader>ev", ":call vimspector#Evaluate()<CR>")

vim.keymap.set("n", "<leader>bp", ":BufferPick<CR>")
vim.keymap.set("n", "<leader>h", ":BufferPrevious<CR>")
vim.keymap.set("n", "<leader>l", ":BufferNext<CR>")

vim.cmd([[
nmap <F5> <cmd>call vimspector#Launch()<cr>
nmap <F6> <cmd>call vimspector#Continue()<cr>
nmap <F9> <cmd>call vimspector#StepOver()<cr>
nmap <F9> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])

