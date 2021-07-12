packloadall
silent! helptags ALL

let g:ale_linters = {
\   'rust': ['analyzer'],
\}
let g:ale_rust_analyzer_config = {
\   'checkOnSave': { 'extraArgs': ["--target-dir", "/tmp/rust-analyzer"] },
\   'procMacro': { "enable": 'true' },
\   'diagnostics': { 'disabled:': 'unresolved-proc-macro' },
\}

let g:ale_fixers = {
\   'rust': ['rustfmt'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
