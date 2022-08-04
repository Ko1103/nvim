local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- require('nvim-lsp-installer').setup({
-- 	automatic_installation = true,
-- })
require("mason").setup()
require("Ko1103.lsp.mason-lspconfig")
-- require'lspconfig'.tsserver.setup{}
-- require'lspconfig'.sumneko_lua.setup{} -- ensure you installed lang server with brew
require('Ko1103.lsp.cmp')
-- require('Ko1103.lsp.configs')

-- for codeformatting
require('Ko1103.lsp.null-ls')
