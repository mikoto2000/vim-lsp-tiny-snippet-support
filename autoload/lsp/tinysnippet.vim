let s:pattern_of_tabstop_or_placeholder = '\(\${\d\{-\}:\w\{-\}}\|\$\d\)'

function! lsp#tinysnippet#move_to_top_of_new_text() abort
    try
        let l:user_data = json_decode(v:completed_item['user_data'])
    catch
        return
    endtry

    if type(l:user_data) != type({})
        return
    endif

    let l:position = l:user_data['vim-lsp/textEdit']['range']['start']
    let l:row = l:position['line'] + 1
    let l:col = l:position['character'] + 1

    call cursor(l:row, l:col)
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
