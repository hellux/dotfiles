set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'lervag/vimtex'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

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

"fix scrolling
set mouse=a

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"set statusline+=%f "add filepath to statusbar
"set laststatus=2 "show statusbar permanently

set nocompatible
filetype plugin indent on 

set listchars=eol:¶ "set symbol for newline
set number "show line numbers

"colors
set background=dark
colorscheme solarized

"toggle whitespace indicators:
nnoremap <F2> :set nolist!<CR> 
"toggle line numbers:
nnoremap <F3> :set nonumber!<CR>

"highlight lines above 80 colums red
highlight OverLength ctermbg=darkred ctermfg=white
match OverLength /\%81v.\+/

command Copy w\ !xclip\ -i\ -sel\ -c
command Paste r\ !xclip\ -o\ -sel\ -c

set completeopt-=preview "disable preview windows in YCM
