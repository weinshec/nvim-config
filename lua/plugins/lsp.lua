local M = { 'neovim/nvim-lspconfig' }
local user = {}
local utils = require('utils')

M.dependencies = {
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
}

M.cmd = 'Lsp'

function M.config()
  local lz = utils.load_module('lsp-zero')

  user.lspconfig(lz)
  user.diagnostics(lz)

  vim.api.nvim_create_user_command(
    'Lsp',
    function(input)
      if input.args == '' then
        return
      end

      lz.use(input.args, {})
    end,
    { desc = 'Initialize a language server', nargs = '?' }
  )
end

function user.lspconfig(lsp)

  lsp.extend_lspconfig()
  lsp.on_attach(user.lsp_attach)

  lsp.set_server_config({
    -- single_file_support = false,
    -- disable LSP semantic highlighting
    on_init = function(client)
      client.server_capabilities.semanticTokensProvider = nil
    end,
  })

  -- NOTE: Put language server specific settings here 
  lsp.store_config('clangd', {
     settings = {
       args = {'-header-insertion=never'}
     }
  })
end

function user.lsp_attach(_, bufnr)
  vim.api.nvim_buf_create_user_command(0, 'LspFormat', function(input)
    vim.lsp.buf.format({ async = input.bang })
  end, {})

  local lsp = vim.lsp.buf
  function opts(description)
    return { noremap=true, silent = true, buffer = bufnr, desc = description }
  end

  vim.keymap.set('n', '<leader>gq', '<cmd>LspFormat<CR>', opts('LSP autoformat'))

  vim.keymap.set('n', 'K', lsp.hover, opts('Hover'))
  vim.keymap.set('n', 'gd', lsp.definition, opts('Goto defintion'))
  vim.keymap.set('n', 'gD', lsp.declaration, opts('Goto declaration'))
  vim.keymap.set('n', 'gi', lsp.implementation, opts('List implementations (qf)'))
  vim.keymap.set('n', 'go', lsp.type_definition, opts('Goto type definition'))
  vim.keymap.set('n', 'gr', lsp.references, opts('List references (qf)'))
  vim.keymap.set('n', 'gs', lsp.signature_help, opts('Display signature help'))
  vim.keymap.set('n', '<space>rn', lsp.rename, opts('Rename symbol'))
  vim.keymap.set('n', '<space>ca', lsp.code_action, opts('Show code actions'))

  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts('Open diagnostics (floating)'))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts(''))
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts(''))
end


function user.diagnostics(lsp)
  local augroup = vim.api.nvim_create_augroup
  local autocmd = vim.api.nvim_create_autocmd

  lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
  })

  vim.diagnostic.config({
    virtual_text = false,
  })

  local group = augroup('diagnostic_cmds', { clear = true })

  autocmd('ModeChanged', {
    group = group,
    pattern = { 'n:i', 'v:s' },
    desc = 'Disable diagnostics while typing',
    callback = function(e) vim.diagnostic.disable(e.buf) end
  })

  autocmd('ModeChanged', {
    group = group,
    pattern = 'i:n',
    desc = 'Enable diagnostics when leaving insert mode',
    callback = function(e) vim.diagnostic.enable(e.buf) end
  })
end

return M
