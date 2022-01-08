setlocal nonumber norelativenumber signcolumn=no

nmap <buffer> s /
nmap <buffer> <cr> <Plug>(fern-action-open-or-expand)
nmap <buffer> cd <Plug>(fern-action-cd)
nmap <buffer> v <Plug>(fern-action-open:side)
nmap <buffer> d <Plug>(fern-action-new-dir)
