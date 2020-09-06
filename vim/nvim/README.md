# Neo Vim Settings

## init.vim
init.vim for neovim is similar to .vimrc for vim. It contains all the default configurations for neovim.

## plugins.vim
It contains all the plugins which I've installed. I mostly work on Go and C++ Programming languages. I created a separate file to not clutter my init.vim and it is sourced to init.vim. I use [vim-plug](https://github.com/junegunn/vim-plug) to install all the plugins.

## coc.vim
It contains the default vim configuration provided by [CoC](https://github.com/neoclide/coc.nvim)(Conquer of Completion). There are other language servers also available but I found it to be most suited for me. To understand how to configure different language servers with CoC check https://github.com/neoclide/coc.nvim/wiki/Language-servers. I created a separate file to not clutter my init.vim and it is sourced to init.vim. [coc-settings](https://github.com/bbsaurav/DotFiles/blob/master/vim/nvim/coc-settings.json) has the CoC specific settings.
#### Generation of compilation database file
To understand your source code, clangd needs to know your build flags. (This is just a fact of life in C++, source files are not self-contained).
`compile_commands.json` provides compile commands for every source file in a project. I use [scan-build](https://github.com/rizsotto/scan-build) to wrap a build so that all calls to gcc/clang are intercepted and logged into a [compilation database](http://clang.llvm.org/docs/JSONCompilationDatabase.html).
To generate compilation database file 
> intercept-build **your build command**

```intercept-build make -j32  CLANG=1 ```


## Configurations used for various Plugins
* **Leader Key:** I use space as my leader key.
```vim
let mapleader = " "
```
* **Keep Nerdtree window open on startup:** I like to keep my Nerdtree window open if start vim without any file. Below is the configuration I used in my init.vim to achieve this.
```vim
function! ShowNERDTree()
	execute ":NERDTree"
	" run NERDTreeTabs on console nvim startup
	let g:nerdtree_tabs_open_on_console_startup=1
endfunction
autocmd VimEnter * if !argc() | :call ShowNERDTree() | endif
```
* **Status Line**
```vim
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
```

* **CoC**
```vim
" Check CoC Logs
:CocInfo
" Jump to definition in a new tab
:call CocAction('jumpDefinition', 'tab drop')
```

* **Line & Character Movement**
```vim
G: Move to the last line.
gg: Move to the first line.
0: Move to the first character of the line.
$: Move to the last character of the line.
A: Move to the last character of the line in insert mode.
f{char}: move to next occurence of character {char} on the line.
F{char}: move to the previous occurence of character {char} on the line.
2f{char}: move to second occurence of character {char} on the line from the current cursor position.

```

* **Screen Positioning**
```vim
<Ctrl-u> and <Ctrl-d>: Move screen by half up and down respectively
<ctrl-b> and <Ctrl-f>: Move screen by full up and down respectively
H: Move cursor to the top line
M: Move cursor to the middle line
L: Move cursor to the last line
```

* **Easymotion Mappings**
```vim
<Leader><Leader>f{char}	: Find {char} to the right. See f.
<Leader><Leader>F{char}	: Find {char} to the left. See F.
<Leader><Leader>t{char}	: Till before the {char} to the right. See t.
<Leader><Leader>t{char}	: Till after the {char} to the left. See T.
<Leader><Leader>w	: Beginning of word forward. See w.
<Leader><Leader>W	: Beginning of WORD forward. See W.
<Leader><Leader>b	: Beginning of word backward. See b.
<Leader><Leader>B	: Beginning of WORD backward. See B.
<Leader><Leader>e	: End of word forward. See e.
<Leader><Leader>E	: End of WORD forward. See E.
<Leader><Leader>ge	: End of word backward. See ge.
<Leader><Leader>gE	: End of WORD backward. See gE.
<Leader><Leader>j	: Line downward. See j.
<Leader><Leader>k	: Line upward. See k.
<Leader><Leader>n	: Jump to latest "/" or "?" forward. See n.
<Leader><Leader>N	: Jump to latest "/" or "?" backward. See N.
<Leader><Leader>s	: Find(Search) {char} forward and backward.
```

* **CtrlP Mappings**
```vim
<Ctrl-f> and <Ctrl-b> : Cycle between modes
<Ctrl-d> : Switch to filename only search instead of full path.
<Ctrl-f> : Switch to regexp mode.
<Ctrl-j> and <Ctrl-k> : Navigate the result list, arrows can also be used
<Ctrl-t> or <Ctrl-v>, <Ctrl-x> : Open file in new tab, vertical split or horizontal split <Ctrl-s> can also be used to open in horizontal split
<Ctrl-z> and <Ctrl-o> : <Ctrl-z> to mark multiple files and <Ctrl-o> to open marked files
```