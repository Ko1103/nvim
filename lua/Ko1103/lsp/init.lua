local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require('Ko1103.lsp.cmp')
require("mason").setup()
require("Ko1103.lsp.mason-lspconfig")

-- for codeformatting
require('Ko1103.lsp.null-ls')
