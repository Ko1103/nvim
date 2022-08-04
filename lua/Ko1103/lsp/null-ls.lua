local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
	return
end

null_ls.setup({
	debug = false,
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
