setlocal nonumber norelativenumber

nmap <buffer> l <cr>
nmap <buffer> h -
nmap <buffer> f xj

" delete
nmap <buffer> D .rm

" new file/dir
nn <buffer> % :!touch %
nn <buffer> t :!touch %
nn <buffer> e :edit %
nn <buffer> d :!mkdir %
nn <buffer> m :!mkdir %

" open
nn <buffer> o :call dirvish#open('split', 0)<CR>
nn <buffer> v :call dirvish#open('vsplit', 0)<CR>
" nn <buffer> P :call dirvish#open('vsplit', 0)<CR>
nn <buffer> <c-t> :call dirvish#open('tabedit', 0)<CR>

" reload
nn <silent><buffer> <c-l> :<C-U>Dirvish<CR>

" Map `gh` to hide dot-prefixed files.  reload to toggle.
nnoremap <silent><buffer> gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
