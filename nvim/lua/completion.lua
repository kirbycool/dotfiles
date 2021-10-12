local cmp = require("cmp")

vim.cmd([[set shortmess+=c]])

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({ cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ cmp.SelectBehavior.Insert }),
  },
	sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
	},
})
