sort ,^.*[\/],

setlocal nonumber norelativenumber

nmap <buffer> l <cr>

" new file/dir
nn <buffer> % :!touch %
nn <buffer> t :!touch %
nn <buffer> e :edit %
nn <buffer> d :!mkdir %
nn <buffer> m :!mkdir %

" open
nn <silent><buffer> <c-t> :call dirvish#open('tabedit', 0)<CR>
