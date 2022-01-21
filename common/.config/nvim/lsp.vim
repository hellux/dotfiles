packadd nvim-lspconfig

"traversal
nnoremap <leader>d <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>i <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>r <cmd>lua vim.lsp.buf.references()<CR>

"info
nnoremap <leader>h <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>s <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap - <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <leader>q <cmd>lua vim.diagnostic.setloclist()<CR>

"actions
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>

"formatting
nnoremap <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

lua << EOF

-- enable lsp omnifunc
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end
local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup { on_attach = on_attach }
end

-- hide inline warnings/lints
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

EOF
