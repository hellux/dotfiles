"detect filetypes
autocmd BufRead,BufNewFile *.tex set ft=tex
autocmd BufRead,BufNewFile *.ts set ft=typescript

"filetype options
autocmd FileType mail setlocal tw=72
autocmd FileType gitcommit setlocal tw=72
