local M = { 'numToStr/Comment.nvim' }

M.lazy = false

M.opts = {
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  mappings = {
    basic = true,
    extra = true,
    extended = false,
  },
  pre_hook = nil,
  post_hook = nil,
}

return M
