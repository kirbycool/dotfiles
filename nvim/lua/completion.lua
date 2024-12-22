local cmp = require("cmp")

vim.cmd([[set shortmess+=c]])

cmp.setup({
  preselect = cmp.PreselectMode.None,

  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item({ cmp.SelectBehavior.Insert }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ cmp.SelectBehavior.Insert }),
    ["<S-Space>"] = cmp.mapping.confirm(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
})
