setlocal nonumber norelativenumber signcolumn=no

nmap <buffer> s /
nmap <buffer> ZQ :q!<cr>
nmap <buffer> <cr> <Plug>(fern-action-open-or-expand)
nmap <buffer> % <Plug>(fern-action-new-file)
nmap <buffer> v <Plug>(fern-action-open:side)
nmap <buffer> d <Plug>(fern-action-new-dir)
nmap <buffer> cd <Plug>(fern-action-cd)
