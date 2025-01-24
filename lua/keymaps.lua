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

-- Quicklist navigation
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[q", ":cprevious<CR>")

-- Show textwidth indicator
vim.keymap.set("n", "<F7>", ":ToggleShowWidth<CR>")

-- Enable spell check
vim.keymap.set("n", "<leader>s", ":set spell!<CR>")

-- Switch between hex and normal mode
vim.keymap.set("n", "<leader>hr",    ":%!xxd -g1<CR> :set filetype=xxd<CR>")
vim.keymap.set("n", "<Leader>hw",    ":%!xxd -r<CR> :set binary<CR> :set filetype=<CR>")
