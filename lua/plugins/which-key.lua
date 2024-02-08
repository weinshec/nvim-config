local M = { "folke/which-key.nvim" }

function M.config()
  vim.keymap.set('n', '<leader>w', ':WhichKey<CR>')
  vim.o.timeout = true
  vim.o.timeoutlen = 300
end

M.opts = {}

return M
