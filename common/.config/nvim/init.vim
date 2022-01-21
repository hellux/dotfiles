set runtimepath+=~/.vim
set packpath+=~/.vim

"revert nvim defaults to vim defaults
set noautoread
set backspace=""
set belloff=""
set complete=".,w,b,u,t,i"
set nocscopeverbose
set display=""
set fillchars="vert:|,fold:-eob:~"
set formatoptions="tcq"
set nohidden
set nohlsearch
set noincsearch
set laststatus=1
set listchars="eol:$"
set sessionoptions="blank,buffers,curdir,folds"
set sidescroll=0
set nosmarttab
set startofline
set switchbuf=""
set viewoptions="folds,options,cursor,curdir"
set wildoptions=""

source ~/.vim/common.vim

colorscheme gruvbox
set background=dark

source ~/.config/nvim/lsp.vim
