local M = { 'preservim/nerdtree' }

function M.config()
  vim.keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>", { noremap = true })
end

return M
