local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
	return
end

-- local lua_source = {
-- 	require("null-ls").builtins.diagnostics.stylua,
-- 	require("null-ls").builtins.formatting.stylua,
-- 	filetypes = { "lua" }
-- }
--
local b = null_ls.builtins

local with_root_file = function(builtin, file)
	return builtin.with {
		condition = function(utils)
			return utils.root_has_file(file)
		end,
	}
end

local sources = {
	--formattin
	b.formatting.prettierd,
	with_root_file(b.formatting.stylua, "stylua.toml"),

	-- diagnostics
	b.diagnostics.eslint,
	b.diagnostics.stylua,

	-- code actions
	b.code_actions.eslint_d,

	-- completion
	b.completion.spell,
}

null_ls.setup({
	debug = false,
	sources = sources,
})





-- null_ls.setup({
-- 	debug = false,
-- 	sources = {
-- 		-- for lua
-- 		lua_source,
--
-- 		-- for javascript and typescript
-- 		require("null-ls").builtins.diagnostics.eslint,
-- 		require("null-ls").builtins.code_actions.eslint_d,
-- 		-- require("null-ls").builtins.formatting.prettierd.with({
-- 		-- 	condition = function(utils)
-- 		-- 		return utils.has_file { ".prettierrc", ".prettierrc.js" }
-- 		-- 	end,
-- 		-- }),
-- 		require("null-ls").builtins.formatting.prettierd,
-- 		require("null-ls").builtins.completion.spell,
-- 	},
-- })
