local M = { 'nvim-lualine/lualine.nvim' }

M.dependencies = {
  'nvim-tree/nvim-web-devicons'
}

function M.config()
  local utils = require('utils')
  local lualine = utils.load_module('lualine')
  lualine.setup()
end

return M
