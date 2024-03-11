local M = { 'nvim-treesitter/nvim-treesitter' }

M.pin = true

M.dependencies = {
  'nvim-treesitter/nvim-treesitter-textobjects',
}

M.opts = {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'html', 'vimdoc' },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'ga',
      node_incremental = 'ga',
      node_decremental = 'gz',
    },
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
      }
    },
    swap = {
      enable = true,
      swap_previous = {
        ['{a'] = '@parameter.inner',
      },
      swap_next = {
        ['}a'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']f'] = '@function.outer',
        [']c'] = '@class.outer',
        [']a'] = '@parameter.inner',
      },
      goto_next_end = {
        [']F'] = '@function.outer',
        [']C'] = '@class.outer',
      },
      goto_previous_start = {
        ['[f'] = '@function.outer',
        ['[c'] = '@class.outer',
        ['[a'] = '@parameter.inner',
      },
      goto_previous_end = {
        ['[F'] = '@function.outer',
        ['[C'] = '@class.outer',
      },
    },
  },
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'cpp',
    'css',
    'csv',
    'dockerfile',
    'html',
    'jq',
    'json',
    'latex',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'meson',
    'python',
    'rst',
    'rust',
    'ssh_config',
    't32',
    'toml',
    'vim',
    'vimdoc',
    'yaml',
  },
}

function M.build()
    pcall(vim.cmd, 'TSUpdate')
end

function M.config(_, opts)
    require('nvim-treesitter.configs').setup(opts)
end

return M

