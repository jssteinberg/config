setlocal nonumber norelativenumber signcolumn=no

nmap <buffer> % <Plug>(vaffle-new-file)
nmap <buffer> <c-n> <Plug>(vaffle-new-file)
nmap <buffer> d <Plug>(vaffle-mkdir)
nmap <buffer> - <Plug>(vaffle-open-parent)
nmap <buffer> D <Plug>(vaffle-delete-selected)
nmap <buffer> <c-l> <c-l><Plug>(vaffle-refresh)
nmap <buffer> R <Plug>(vaffle-rename-selected)
nmap <buffer> gh <Plug>(vaffle-toggle-hidden)
nmap <buffer> cd <Plug>(vaffle-chdir-here)

nmap <buffer> f <Plug>(vaffle-toggle-current)
nmap <buffer> x <Plug>(vaffle-move-selected)

nmap <buffer> o <Plug>(vaffle-open-selected-split)
nmap <buffer> v <Plug>(vaffle-open-selected-vsplit)

nmap <buffer> <c-c> <Plug>(vaffle-fill-cmdline)
