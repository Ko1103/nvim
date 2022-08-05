-- local status_ok, configs = pcall(require, "nvim-treesitter.configs")
-- if not status_ok then
-- 	return
-- end
--
-- configs.setup({
-- 	ensure_installed = {"all"}, -- one of "all" or a list of languages
-- 	highlight = {
-- 		enable = true, -- false will disable the whole extension
-- 		disable = { "css" }, -- list of language that will be disabled
-- 	},
-- 	autopairs = {
-- 		enable = true,
-- 	},
-- 	indent = { enable = true, disable = { "python", "css" } },
-- })

require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = {
		"css",
		"dart",
		"dockerfile",
		"dot",
		"go",
		"gomod",
		"graphql",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"json",
		"kotlin",
		"lua",
		"make",
		"markdown",
		"proto",
		"pug",
		"python",
		"ql",
		"ruby",
		"rust",
		"scala",
		"sql",
		"swift",
		"toml",
		"vim",
		"vue",
		"yaml",
		"hcl", -- Hashi Corp
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- auto_install = true,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}
