local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require('nvim-lsp-installer').setup({
	automatic_installation = true,
})

-- require'lspconfig'.tsserver.setup{}
-- require'lspconfig'.sumneko_lua.setup{} -- ensure you installed lang server with brew
require('Ko1103.lsp.cmp')
require('Ko1103.lsp.configs')
-- require('Ko1103.lsp.handlers').setup()
-- require('Ko1103.lsp.null-ls')
