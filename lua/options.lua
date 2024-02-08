local utils = require "utils"

-- Show (relative) line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Ignore case when search pattern is all lowercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Do not wrap long lines
vim.opt.wrap = false

-- Set tab and shift width and round while shifting
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
utils.set_auto_tabshift {
  c = 4,
  cmake = 2,
  cpp = 4, 
  go = 4,
	lua = 2,
  python = 4, 
  rust = 4, 
}
vim.opt.textwidth = 100

-- Always show completion menu
vim.opt.completeopt = {'menu', 'menuone', 'preview'}

-- Open new splits right or below
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Highlight the line the cursor is in
vim.opt.cursorline = true

-- Use the pretty colors
vim.opt.termguicolors = true

-- Do not unload buffer when its abounded
hidden = true

-- Always display signcolumn
vim.opt.signcolumn = 'yes'

-- Do not write swapfiles
vim.opt.swapfile = false

-- Use the unnamed clipboard
vim.opt.clipboard = "unnamedplus"

-- Define max height of the popup window
vim.opt.pumheight = 15

-- Don't show current mode in bottom line
vim.opt.showmode = false

-- Do smart autoindenting
vim.opt.smartindent = true

-- TODO: Review these old settings
--laststatus = 3,
--vim.opt.diffopt:append("linematch:60")
