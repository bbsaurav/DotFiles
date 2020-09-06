" plugins
"
source ~/.config/nvim/plugins.vim

" settings
"
filetype on "detect file based on type
filetype plugin on "Load a plugin for the file when it is being editted if available
filetype indent on "maintain indentation
set number "enable line numbers
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set showmatch
set incsearch
set hlsearch
" Set Space as leader
let mapleader = " "
" Delete trailing whiteshpaces
nmap <silent> <leader>dtw :%s/\s\+$//e<CR>

" VSCode Dark colorscheme
"colorscheme codedark

" Gruvbox colorscheme
" autocmd vimenter * colorscheme gruvbox

" Solarized colorscheme
"syntax enable
"set background=dark
"colorscheme solarized

" onedark vim colorscheme
syntax on
colorscheme onedark

" Dracula colorscheme
"packadd! dracula
"syntax enable
"colorscheme dracula

" Set statusline to show branch, filename and cursor position
set laststatus=2
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

" Keep NERDTree open when nvim starts without any file
" Ensure that if NERDTree is loaded through Plug then it is not
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } and only
" Plug 'scrooloose/nerdtree'
function! ShowNERDTree()
	execute ":NERDTree"
	" run NERDTreeTabs on console nvim startup
	let g:nerdtree_tabs_open_on_console_startup=1
endfunction
autocmd VimEnter * if !argc() | :call ShowNERDTree() | endif


" ctrl+n to toggle NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" Use gd for coc.nvim instead of vim-go
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goformat"
let g:go_fmt_options = {
  \ "gofmt": '-s "indent=4 shift=4"'
  \ }
"let g:go_fmt_autosave = 0

"NERDCommenter Keys Mapping
vmap <C-k><C-u> <plug>NERDCommenterToggle
nmap <C-k><C-u> <plug>NERDCommenterToggle

" NERDTree GitStatus Custom Map
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",
    \ "Modified"  : "#d9bf91",
    \ "Renamed"   : "#51C9FC",
    \ "Untracked" : "#FCE77C",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#FFBD61",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }
let g:NERDTreeGitStatusPorcelainVersion = 1

" NERDTree Show Hidden Files
let g:NERDTreeShowHidden = 1

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" NERDTree Window size
let g:NERDTreeWinSize = 40

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" ctrlp
let g:ctrlp_user_command = [
	\ '.git',
	\ 'cd %s && git ls-files . -co --exclude-standard',
	\ 'find %s -type f'
	\ ]

" ctrlp update window configuration
let g:ctrlp_match_window = 'top,order:btt,min:1,max:20,results:20'

source ~/.config/nvim/coc.vim

" Show error when writing to columns more than 80
match ErrorMsg '\%>80v.\+'
set colorcolumn=80

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
