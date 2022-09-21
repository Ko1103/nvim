local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local b = null_ls.builtins
local with_root_file = function(builtin, file)
	return builtin.with({
		condition = function(utils)
			return utils.root_has_file(file)
		end,
	})
end

local sources = {
	b.formatting.prettierd,
	b.formatting.terraform_fmt,
	b.formatting.rustfmt,
	with_root_file(b.formatting.stylua, "stylua.toml"),
	b.diagnostics.eslint_d,
	b.code_actions.eslint_d,
	-- b.completion.spell,
}

null_ls.setup({
	debug = false,
	sources = sources,
})
