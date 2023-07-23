local status, cmp = pcall(require, 'cmp')
if not status then return end

local status_kind, lspkind = pcall(require, 'lspkind')
local status_luasnip, luasnip = pcall(require, 'luasnip')

if status_luasnip then
  is_expand = function(args)
    luasnip.lsp_expand(args.body)
  end
else
  is_expand = {}
end

if status_kind then
  is_format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
else
  if_format = {}
end

cmp.setup({
  snippet = {
    expand = is_expand
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 10 },
    { name = 'buffer', max_item_count = 10 },
    { name = 'luasnip' }
  }),
  formatting = {
      format = is_format 
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
