let s:pattern_of_tabstop_or_placeholder = '\(\${\d\{-\}:\w\{-\}}\|\$\d\)'

function! lsp#tinysnippet#expand(params) abort
    execute printf('normal! i%s', a:params.snippet)
    execute printf('normal! %sh', strlen(a:params.snippet) - 1)
endfunction


""" {{{ LSP形式のタブストップ($1)かプレースホルダ(${1:xxx}, $1)までジャンプする
function! lsp#tinysnippet#select_next() abort
    call lsp#tinysnippet#select_tabstop_or_placeholder('', 'e')
endfunction

function! lsp#tinysnippet#select_prev() abort
    call lsp#tinysnippet#select_tabstop_or_placeholder('eb', 'b')
endfunction

function! lsp#tinysnippet#select_tabstop_or_placeholder(first_search_option, second_search_option) abort
    normal 

    " 次のマークまで移動
    let l:line = search(s:pattern_of_tabstop_or_placeholder, a:first_search_option)

    " 見つからなければ何もしない
    if l:line == 0
        return
    endif

    " マーク末尾までを選択
    normal v
    call search(s:pattern_of_tabstop_or_placeholder, a:second_search_option)
endfunction
""" }}} LSP形式のタブストップ($1)かプレースホルダ(${1:xxx}, $1)までジャンプする
