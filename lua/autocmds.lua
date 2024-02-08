-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear=true })
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout=500 })
  end,
  group = highlight_group,
})

-- Disable comment leader on new line created by 'o'/'O'
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "o" }
    end,
})
