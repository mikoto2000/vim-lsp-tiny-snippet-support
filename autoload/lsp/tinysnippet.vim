let s:pattern_of_tabstop_or_placeholder = '\(\${\d\{-\}:\w\{-\}}\|\$\d\)'

function! lsp#tinysnippet#expand(params) abort
    let l:text = a:params.snippet

    " 改行正規化
    let l:text = substitute(l:text, '\r\n', '\n', 'g')

    " 行数計算
    let l:text_lines = split(l:text, '\n')
    let l:text_line_num = len(l:text_lines)

    " 文字挿入
    silent execute printf('normal! i%s', a:params.snippet)

    " 縦方向の移動
    if l:text_line_num > 1
        silent execute printf('normal! %sk$', l:text_line_num - 1)
    endif

    " 横方向の移動
    silent execute printf('normal! %sh', strlen(l:text_lines[0]) - 1)
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
