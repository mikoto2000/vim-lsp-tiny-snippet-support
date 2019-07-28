if exists('g:vim_lsp_tiny_snippet_loaded')
    finish
endif
let g:vim_lsp_tiny_snippet_loaded = 1

let g:lsp_get_supported_capabilities = get(g:, 'lsp_get_supported_capabilities', [function('lsp#tinysnippet#lsp_get_snippet_supported_capability')])

function! lsp#tinysnippet#lsp_get_snippet_supported_capability(server_info) abort
    let l:snippet_supported_capability = lsp#default_get_supported_capabilities(a:server_info)

    " TODO: `textDocument` 上書きでなく、
    " `snippetSupport` の設定だけするように修正
    let l:snippet_supported_capability['textDocument'] = {
    \   'completion': {
    \       'completionItem': {
    \           'snippetSupport': v:true
    \       }
    \   }
    \ }
    return l:snippet_supported_capability
endfunction

augroup tiny_snippet_init
    autocmd!
    autocmd User lsp_complete_done call lsp#tinysnippet#move_to_top_of_new_text()
augroup END

