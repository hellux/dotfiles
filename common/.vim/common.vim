set nocompatible
filetype off

filetype plugin indent on

set encoding=utf-8

set ve=block
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set textwidth=79
set tabstop=4
set softtabstop=4

syntax on
set nohlsearch
set termguicolors
set scrolloff=5
set relativenumber
set number
set cursorline
set display=lastline
set wildmenu
set laststatus=2
set showcmd
set shortmess-=S

nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprev<cr>

let mapleader = " "

source ~/.vim/whitespace.vim
source ~/.vim/ft.vim

source ~/.vim/fzf.vim
source ~/.vim/fugitive.vim
