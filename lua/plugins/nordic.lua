local M = { 'AlexvZyl/nordic.nvim' }

M.lazy = false
M.priority = 9999

function M.config()
  local utils = require('utils')
  utils.load_module('nordic').load()
end

return M
