-----------------------------------
-- Define keymaps of Neovim and installed plugins
-----------------------------------

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------
-- Shortcuts 
-----------------------------------
local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-----------------------------------
-- Plugins
-----------------------------------

-- NvimTree
keymap('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
keymap('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
keymap('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file
