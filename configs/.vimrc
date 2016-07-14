syntax on "highlight syntax

set history=1000 "command history length

"tabs
set tabstop=4 "show tab as 4 spaces
set shiftwidth=4 "set indent to X spaces
set expandtab "make _shiftwitdh_ spaces when pressing tab

set ruler "show current pos

set hlsearch "highlight search results
set lazyredraw "prevent redraw while executing macros
set showmatch "show matching brackets
set mat=2 "match blink length (X * .1 sec)

set encoding=utf8 "utf8 encoding 

"treat long lines as multiple lines
map j gj
map k gk
map Q <nop>

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"set statusline+=%f "add filepath to statusbar
"set laststatus=2 "show statusbar permanenutly

set nocompatible
filetype plugin indent on 

set listchars=eol:¶ "set symbol for newline
set number "show line numbers

"toggle whitespace indicators:
nnoremap <F2> :set nolist!<CR> 
"toggle line numbers:
nnoremap <F3> :set nonumber!<CR>

"highlight lines above 80 colums red
highlight OverLength ctermbg=darkred ctermfg=white
match OverLength /\%81v.\+/
