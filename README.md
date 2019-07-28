vim-lsp-tiny-snippet-support.vim
================================

vim-lsp に最低限のスニペットサポートを追加するプラグイン。


Usage:
------

`lsp#tinysnippet#select_next()`, `lsp#tinysnippet#select_prev()` を、
お好みのキーにマッピングしてください。

設定例 :

```vim
inoremap <silent> <C-j> <Esc>:call lsp#tinysnippet#select_next()<Enter>
nnoremap <silent> <C-j> <Esc>:call lsp#tinysnippet#select_next()<Enter>
vnoremap <silent> <C-j> <Esc>:call lsp#tinysnippet#select_next()<Enter>
inoremap <silent> <C-k> <Esc>:call lsp#tinysnippet#select_prev()<Enter>
nnoremap <silent> <C-k> <Esc>:call lsp#tinysnippet#select_prev()<Enter>
vnoremap <silent> <C-k> <Esc>:call lsp#tinysnippet#select_prev()<Enter>
```

`lsp#tinysnippet#select_next()`, `lsp#tinysnippet#select_prev()` を実行すると、
タブストップ、または、プレースホルダーへジャンプし、選択状態にします。

`c` キー押下で変更操作を行ってください。


Requirements:
-------------

`vim-lsp-tiny-snippet-support` は、
`async.vim`, `vim-lsp` よりも前に読み込む必要があります。

設定例 :

```vim
packadd vim-lsp-tiny-snippet-support
packadd async.vim
packadd vim-lsp
```


TODO:
-----

- [ ] : ヘルプの整備
- [ ] : capability の `textDocument` を丸ごと上書きでなくて `snippetSupport` だけ追加するように修正


License:
--------

Copyright (C) 2019 mikoto2000

This software is released under the MIT License, see LICENSE

このソフトウェアは MIT ライセンスの下で公開されています。 LICENSE を参照してください。


Author:
-------

mikoto2000 <mikoto2000@gmail.com>

