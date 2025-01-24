local M = { 'hrsh7th/nvim-cmp' }
local user = { autocomplete = true }
local utils = require('utils')

M.dependencies = {
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'L3MON4D3/LuaSnip' },
}

function M.config()
  local cmp = utils.load_module('cmp')
  local luasnip = utils.load_module('luasnip')

  local select_opts = { behavior = cmp.SelectBehavior.Select }
  local cmp_enable = cmp.get_config().enabled

  local icon = {
    nvim_lsp = 'λ',
    luasnip = '⋗',
    buffer = 'Ω',
    path = '🖫',
    nvim_lua = 'Π',
    omni = 'Π',
    tags = 't',
  }

  user.config = {
    enabled = function()
      if user.autocomplete then
        return cmp_enable()
      end

      return false
    end,
    completion = {
      completeopt = 'menu,menuone',
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sources = {
      { name = 'path' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lsp', keyword_length = 2 },
      { name = 'buffer',   keyword_length = 3 },
      { name = 'luasnip',  keyword_length = 2 },
    },
    view = {
      docs = {
        auto_open = false,
      }
    },
    window = {
      completion = {
        border = 'rounded',
        max_height = 15,
        max_width = 90,
        zindex = 50,
      },
      documentation = {
        border = 'rounded',
        max_height = 15,
        max_width = 90,
        zindex = 50,
      }
    },
    formatting = {
      fields = { 'menu', 'abbr', 'kind' },
      format = function(entry, item)
        item.menu = icon[entry.source.name]
        return item
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
      ['<C-g>'] = cmp.mapping(function(fallback)
        if cmp.visible_docs() then
          cmp.close_docs()
        elseif cmp.visible() then
          cmp.open_docs()
        else
          fallback()
        end
      end),

      ['<M-u>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.abort()
        else
          cmp.complete()
        end
      end),

      ['<CR>'] = cmp.mapping.confirm({select = true}),
      ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.confirm({ select = true })
          else
              fallback()
          end
      end, { 'i', 's' }),

    },
  }

  cmp.setup(user.config)
end

return M
