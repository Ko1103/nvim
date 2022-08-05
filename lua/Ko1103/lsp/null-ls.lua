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
	--formattin
	b.formatting.prettierd,
	with_root_file(b.formatting.stylua, "stylua.toml"),
	b.formatting.terraform_fmt,

	-- diagnostics
	b.diagnostics.eslint,

	-- code actions
	b.code_actions.eslint_d,

	-- completion
	b.completion.spell,
}

null_ls.setup({
	debug = false,
	sources = sources,
})
