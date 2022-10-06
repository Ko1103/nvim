-----------------------------------
-- Define keymaps of Neovim and installed plugins
-----------------------------------

-- Change leader to a comma
vim.g.mapleader = ","

-----------------------------------
-- Shortcuts
-----------------------------------
local function keymap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

keymap("n", "<Esc><Esc>", ":nohl<CR>")

-----------------------------------
-- Plugins
-----------------------------------

-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>") -- open/close
keymap("n", "<leader>f", ":NvimTreeRefresh<CR>") -- refresh
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>") -- search file

-- Telescope
keymap("n", "<C-p>", '<cmd>lua require("telescope.builtin").git_files()<CR>')
keymap("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<CR>')
keymap("n", "<leader>ff", '<cmd>lua require("telescope.builtin").file_files()<CR>')
keymap("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<CR>')
keymap("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<CR>')
keymap("n", "<leader>fs", '<cmd>lua require("telescope.builtin").grep_string()<CR>')

-- Jester
keymap("n", "<leader>jc", '<cmd>lua require"jester".debug_file()<CR>') -- Debug current file
keymap("n", "<leader>jt", '<cmd>lua require"jester".debug()<CR>') -- Debug nearest test(s) under the cursor
