local lspconfig = require("lspconfig")

local handle = io.popen("bundle info sorbet-static")
local sorbetPath = handle:read("*all") .. "/libexec/sorbet"
handle:close()

if not lspconfig.sorbet then
	lspconfig.configs.sorbet = {
		default_config = {
			cmd = { sorbetPath, "tc", "--lsp", "--enable-all-experimental-lsp-features", "--disable-watchman" },
			filetypes = { "ruby" },
			root_dir = lsp.util.root_pattern("sorbet/"),
		},
	}
end

lspconfig.sorbet.setup({
	init_options = { documentFormatting = false, codeAction = true },
})
