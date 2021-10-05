local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
	init_options = { documentFormatting = false, codeAction = true },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = lspconfig.util.root_pattern("tsconfig.json"),

	on_attach = function(client)
		-- Disable formatting by pretending ther server can't format
		client.resolved_capabilities.document_formatting = false
	end,
})
