local compe = require("compe")

vim.cmd([[set shortmess+=c]])

vim.o.completeopt = "noinsert,menuone,noselect"

-- Use enter to select and start a new line rather than just select
-- Navigate the completion menu with tab and s-tab
vim.api.nvim_exec(
	[[
    inoremap <expr> <CR> pumvisible() ? "\<c-y>\<cr>" : "\<CR>"
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  ]],
	true
)

compe.setup({
	enabled = true,
	autocomplete = true,
	min_length = 1,
	preselect = "enable",
	documentation = true,

	source = {
		path = true,
		buffer = true,
		calc = false,
		vsnip = false,
		nvim_lsp = true,
		nvim_lua = true,
		spell = false,
		tags = false,
		snippets_nvim = false,
		treesitter = true,
	},
})
