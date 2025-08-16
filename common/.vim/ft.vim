"detect filetypes
autocmd BufRead,BufNewFile *.tex set ft=tex
autocmd BufRead,BufNewFile *.ts set ft=typescript
autocmd BufRead,BufNewFile *.mac set ft=maxima

"filetype options
autocmd FileType mail setlocal tw=72
autocmd FileType gitcommit setlocal tw=72
autocmd FileType html setlocal sw=2 ts=2 sts=2
