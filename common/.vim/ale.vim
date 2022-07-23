packloadall
silent! helptags ALL

"traversal
nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>i :ALEGoToImplementation<CR>
nnoremap <leader>rr :ALEFindReferences -quickfix <CR>

"info
nnoremap <leader>h :ALEHover<CR>
nnoremap - :ALEDetail<CR>
nnoremap <leader>q :ALEPopulateQuickfix<CR>

"modifications
nnoremap <leader>rn :ALERename<CR>
nnoremap <leader>ca :ALECodeAction<CR>
nnoremap <leader>f :ALEFix<CR>

set omnifunc=ale#completion#OmniFunc
set signcolumn=number

let g:ale_lint_on_text_changed = 'never'
let g:ale_floating_preview = 1
let g:ale_set_loclist = 0
let g:ale_set_quicklist = 1

let g:ale_linters = {
\   'rust': ['analyzer'],
\}
let g:ale_rust_analyzer_config = {
\   'checkOnSave':
\       {
\           'command': "clippy",
\           'extraArgs': [
\               "--target-dir",
\               "/home/noah/.cache/rust-analyzer",
\               "--",
\               "-W",
\               "clippy::pedantic",
\           ],
\       },
\   'procMacro': { 'enable': 'true' },
\   'cargo': { "allFeatures": 'true' },
\   'diagnostics': { 'disabled:': 'unresolved-proc-macro' },
\}

let g:ale_fixers = {
\   'rust': ['rustfmt'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
