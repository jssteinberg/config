setlocal nonumber norelativenumber signcolumn=no

nmap <buffer> s /
nmap <buffer> ZQ :q!<cr>
nmap <buffer> <cr> <Plug>(fern-action-open-or-expand)
nmap <buffer> % <Plug>(fern-action-new-file)
nmap <buffer> v <Plug>(fern-action-open:side)
nmap <buffer> d <Plug>(fern-action-new-dir)
nmap <buffer> cd <Plug>(fern-action-cd)
nmap <buffer> R <Plug>(fern-action-move)
nmap <buffer> mf <Plug>(fern-action-mark)
nmap <buffer> mF <Plug>(fern-action-mark:toggle)
nmap <buffer> mm <Plug>(fern-action-rename)
nmap <buffer> c <Plug>(fern-action-terminal)
nmap <buffer> - <Plug>(fern-action-leave)
nmap <buffer> gh <Plug>(fern-action-hidden)
" Change <bs> to my config's globa alt buffer
nmap <buffer> <bs> :buffer#<cr>
nnoremap <buffer> N N
