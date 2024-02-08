local ok, utils = pcall(require, 'utils')

if not ok then
  local msg = 'lua/utils.lua not found.'
  vim.notify(msg, vim.log.levels.ERROR)
  return
end

utils.load_module('autocmds')
utils.load_module('functions')
utils.load_module('keymaps')
utils.load_module('options')
utils.load_module('plugin-manager')
