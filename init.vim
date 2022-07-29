" -- vim-plug
call plug#begin()
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/glyph-palette.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

Plug 'tpope/vim-fugitive'

" colortheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'bluz71/vim-moonfly-colors'

" new plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'numToStr/Comment.nvim'
Plug 'lewis6991/gitsigns.nvim'

" lsp
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

call plug#end()

" require plugin configs
:lua require('Ko1103')
