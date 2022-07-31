local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- require('Ko1103.lsp.configs')
-- require('Ko1103.lsp.handlers').setup()
require('Ko1103.lsp.null-ls')
