" -- Global
set number
set encoding=utf-8
" set cursorline

" -- vim-plug
call plug#begin()
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/glyph-palette.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'vim-airline/vim-airline', { 'branch': 'master' }

Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Plug 'numToStr/Comment.nvim ', { 'branch': 'master' }
Plug 'numToStr/Comment.nvim'


call plug#end()

" require plugin configs
:lua require('Ko1103')

"set statusline+=%f
"set statusline+=%m%r%h%w
"set statusline+=\ %{FugitiveStatusline()}

