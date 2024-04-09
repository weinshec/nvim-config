local M = { 'tpope/vim-fugitive' }

M.keys = {
  { "<leader>gg", "<cmd>tabe<cr><cmd>tabm0<cr><cmd>Git<cr>", desc = "Git" },
}

return M
