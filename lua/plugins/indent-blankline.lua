local M = { 'lukas-reineke/indent-blankline.nvim' }

M.main = "ibl"

M.opts = {
  indent = {
    char = "│",
  },
  exclude = {
    filetypes = {
      "log",
      "fugitive",
      "gitcommit",
      "vimwiki",
      "markdown",
      "txt",
      "text",
      "help",
      "git",
      "", -- for all buffers without a file type
    },
    buftypes = {
      "terminal",
      "nofile",
    },
  },
}

return M
