call plug#begin()

Plug 'tpope/vim-sensible'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jistr/vim-nerdtree-tabs'
" VSCode Dark color theme
"Plug 'tomasiser/vim-code-dark'
"Plug 'morhetz/gruvbox'
"Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
"Plug 'dracula/vim', { 'as': 'dracula' }
" NERDTree GIT Plugin to check git status
Plug 'Xuyuanp/nerdtree-git-plugin'
" Open files using CTRL + P
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'jackguo380/vim-lsp-cxx-highlight'
" Easymotion
Plug 'easymotion/vim-easymotion'

call plug#end()
