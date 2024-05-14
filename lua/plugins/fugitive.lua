local M = { 'tpope/vim-fugitive' }

function M.config()
  vim.keymap.set("n", "<Leader>gg", "<cmd>tabe<cr><cmd>tabm0<cr><cmd>Git<cr>")
end

return M
