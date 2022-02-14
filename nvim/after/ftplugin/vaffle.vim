setlocal nonumber norelativenumber signcolumn=no

nmap <buffer> % <Plug>(vaffle-new-file)
nmap <buffer> d <Plug>(vaffle-mkdir)
nmap <buffer> - <Plug>(vaffle-open-parent)
nmap <buffer> D <Plug>(vaffle-delete-selected)
nmap <buffer> <c-l> <c-l><Plug>(vaffle-refresh)
nmap <buffer> R <Plug>(vaffle-rename-selected)
nmap <buffer> gh <Plug>(vaffle-toggle-hidden)
