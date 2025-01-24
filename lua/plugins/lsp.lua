local M = { 'neovim/nvim-lspconfig' }
local utils = require('utils')

M.dependencies = {
  { 'hrsh7th/cmp-nvim-lsp' },
}

function M.config()
  local lspconfig = require('lspconfig')
  lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
      function opts(description)
        return { noremap=true, silent = true, buffer = event.buf, desc = description }
      end

      local lsp = vim.lsp.buf

      vim.keymap.set('n', '<leader>gq', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts('LSP autoformat'))

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
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts('Jump to prev diagnostics'))
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts('Jump to next diagnostics'))
    end
  })

  vim.diagnostic.config {
    virtual_text = false,
    underline = true,
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "✘",
        [vim.diagnostic.severity.WARN]  = "▲",
        [vim.diagnostic.severity.INFO]  = "»",
        [vim.diagnostic.severity.HINT]  = "⚑",
      },
    },
  }

  lspconfig.clangd.setup({
     settings = {
       args = {'-header-insertion=never'}
     }
  })
  lspconfig.rust_analyzer.setup({})
  lspconfig.pylsp.setup({})
  lspconfig.ruff.setup({})
end

return M
