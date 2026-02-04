" UI
setlocal nonumber norelativenumber nocursorcolumn
let g:fern#renderer#default#leaf_symbol = "   "
let g:fern#renderer#default#collapsed_symbol = "·  "
let g:fern#renderer#default#expanded_symbol = "-  "

" Mappings
" unmap
try
	nunmap <buffer> c
	nunmap <buffer> fe
	nunmap <buffer> fi
	nunmap <buffer> t
catch | endtry

nmap <buffer> ZQ :q!<cr>
nmap <buffer> <c-l> <Plug>(fern-action-reload)
nmap <buffer> cd <Plug>(fern-action-tcd:cursor)
nmap <buffer> gc <Plug>(fern-action-terminal)
nmap <buffer> - <Plug>(fern-action-leave)
nmap <buffer> gh <Plug>(fern-action-hidden:toggle)

" Space-Enter search with faster <CR> with <Space>. The simplest sneak/leap motion!
"nn s <cmd>let b:_CR=1<cr>/
"nn S <cmd>let b:_CR=1<cr>?
"cno <expr> <space> exists("b:_CR")
"			\ && match(getcmdtype(), "\[/\|?\]") == 0 ?
"			\ "<cr>:unl b:_CR<bar>ec escape('<c-r>/','#')<cr>" : " "

" New items
nmap <buffer> % <Plug>(fern-action-new-file)
nmap <buffer> d <Plug>(fern-action-new-dir)

" Mark items
nmap <buffer> V <Plug>(fern-action-mark:toggle)
nmap <buffer> <tab> <Plug>(fern-action-mark:toggle)j
nmap <buffer> f <Plug>(fern-action-mark:toggle)j
nmap <buffer> F <Plug>(fern-action-mark:toggle)k
nmap <buffer> <esc> <Plug>(fern-action-mark:clear)

" Item actions
nmap <buffer> <cr> <Plug>(fern-action-open-or-expand)
nmap <buffer> <c-j> <Plug>(fern-action-open-or-expand)
nmap <buffer> <c-t> <Plug>(fern-action-open:tabedit)
nmap <buffer> <c-v> <Plug>(fern-action-open:vsplit)
"nmap <buffer> - <Plug>(fern-action-collapse)
nmap <buffer> - <Plug>(fern-action-collapse-or-leave)
nmap <buffer> P <Plug>(fern-action-open-or-expand)
nmap <buffer> <c-k> <Plug>(fern-action-open:side)
nmap <buffer> x <Plug>(fern-action-clipboard-move)
nmap <buffer> y <Plug>(fern-action-clipboard-copy)
nmap <buffer> p <Plug>(fern-action-clipboard-paste)
nmap <buffer> R <Plug>(fern-action-rename)
nmap <buffer> D <Plug>(fern-action-trash)
" immediately delete
nmap <buffer>
			\ <leader>D
			\ <Plug>(fern-action-remove=)y<CR>

function! s:on_highlight() abort
	" Use brighter highlight on root node
	highlight link FernRootSymbol Title
	highlight link FernRootText   Title
endfunction

augroup my-fern-highlight
	autocmd!
	autocmd User FernHighlight call s:on_highlight()
augroup END
