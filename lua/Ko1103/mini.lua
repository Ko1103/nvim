require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup({
	-- In which modes mappings from this `config` should be created
	modes = { insert = true, command = false, terminal = false },

	-- Global mappings. Each right hand side should be a pair information, a
	-- table with at least these fields (see more in |MiniPairs.map|):
	-- - <action> - one of 'open', 'close', 'closeopen'.
	-- - <pair> - two character string for pair to be used.
	-- By default pair is not inserted after `\`, quotes are not recognized by
	-- `<CR>`, `'` does not insert pair after a letter.
	-- Only parts of tables can be tweaked (others will use these defaults).
	mappings = {
		["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
		["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
		["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

		[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
		["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
		["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

		['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
		["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
		["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
	},
})
require("mini.statusline").setup({
	-- No need to copy this inside `setup()`. Will be used automatically.
	-- Content of statusline as functions which return statusline string. See
	-- `:h statusline` and code of default contents (used instead of `nil`).
	content = {
		-- Content for active window
		active = nil,
		-- Content for inactive window(s)
		inactive = nil,
	},

	-- Whether to use icons by default
	use_icons = true,

	-- Whether to set Vim's settings for statusline (make it always shown with
	-- 'laststatus' set to 2). To use global statusline in Neovim>=0.7.0, set
	-- this to `false` and 'laststatus' to 3.
	set_vim_settings = true,
})
require("mini.trailspace").setup({
	-- Highlight only in normal buffers (ones with empty 'buftype'). This is
	-- useful to not show trailing whitespace where it usually doesn't matter.
	only_in_normal_buffers = true,
})
