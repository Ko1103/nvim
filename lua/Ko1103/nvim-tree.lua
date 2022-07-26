local tree_cb = require'nvim-tree.config'.nvim_tree_callback

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
	{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
	{ key = "h", cb = tree_cb "close_node" },
	{ key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- auto_close option is no longer support, instead, here is solution
-- see: https://github.com/kyazdani42/nvim-tree.lua/discussions/1115#discussioncomment-2454398
-- vim.api.nvim_create_autocmd("BufEnter", {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--       vim.cmd "quit"
--     end
--   end
-- })
