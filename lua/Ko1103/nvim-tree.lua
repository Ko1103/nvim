local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		adaptive_size = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = "u", action = "dir_up" },
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
		-- custom = {
		-- 	"^.git$",
		-- },
	},
})
