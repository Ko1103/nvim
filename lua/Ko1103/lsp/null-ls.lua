-- require("null-ls").setup({
--     sources = {
--         require("null-ls").builtins.formatting.stylua,
-- 	-- for javascript and typescript
--         require("null-ls").builtins.diagnostics.eslint,
--         require("null-ls").builtins.formatting.prettierd,
--         require("null-ls").builtins.completion.spell,
--     },
-- })

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
	return
end

null_ls.setup({
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
	sources = {
		-- for lua
		require("null-ls").builtins.diagnostics.stylua,
		require("null-ls").builtins.formatting.stylua,
		-- for javascript and typescript
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.code_actions.eslint_d,
		require("null-ls").builtins.formatting.prettierd,
		require("null-ls").builtins.completion.spell,
	},
})
