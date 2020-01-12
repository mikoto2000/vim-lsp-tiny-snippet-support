if exists('g:vim_lsp_tiny_snippet_loaded')
    finish
endif
let g:vim_lsp_tiny_snippet_loaded = 1

let g:lsp_get_supported_capabilities = get(g:, 'lsp_get_supported_capabilities', [function('lsp#tinysnippet#lsp_get_snippet_supported_capability')])
let g:lsp_snippet_expand = [function('lsp#tinysnippet#expand')]

function! lsp#tinysnippet#lsp_get_snippet_supported_capability(server_info) abort
    let l:snippet_supported_capability = lsp#default_get_supported_capabilities(a:server_info)

    " `snippetSupport` を有効化
    let l:snippet_supported_capability['textDocument']['completion']['completionItem']['snippetSupport'] = v:true

    return l:snippet_supported_capability
endfunction

