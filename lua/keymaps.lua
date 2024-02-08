vim.g.mapleader = ","

-- Remap Esc to the ergonomic jk
vim.keymap.set("i", "jk", "<ESC>")

-- Splits and tab navigation
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<s-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<s-l>", ":tabnext<CR>")

-- Disable highlight of last search
vim.keymap.set("n", "<c-n>", ":nohl<CR>")

-- Convenient block indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Show textwidth indicator
vim.keymap.set("n", "<F7>", ":ToggleShowWidth<CR>")

-- Enable spell check
vim.keymap.set("n", "<leader>s", ":set spell!<CR>")
