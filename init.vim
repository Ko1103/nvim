" -- vim-plug
call plug#begin()
Plug 'lambdalisue/glyph-palette.vim'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

Plug 'tpope/vim-fugitive'

" colortheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'bluz71/vim-moonfly-colors'

" fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" explorer tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" highlight code
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'lewis6991/gitsigns.nvim'
Plug 'ahmedkhalf/project.nvim'
Plug 'editorconfig/editorconfig-vim'

" lsp
" Plug 'williamboman/nvim-lsp-installer'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'weilbith/nvim-lsp-smag'

" lint & formatter
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" luasnip
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" for typescript
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

" for debug with jest
Plug 'mfussenegger/nvim-dap'
Plug 'David-Kunz/jester'

Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }

call plug#end()

" require plugin configs
:lua require('Ko1103')
