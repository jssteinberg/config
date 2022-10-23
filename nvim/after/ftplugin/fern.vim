" The perfect file explorer for me is a flexible tree file manager, supporting
" both drawer and window mode. It has to use the basic Netrw keymaps, but can
" extend beyond that.

setlocal nonumber norelativenumber nocursorcolumn

" unmap
nunmap <buffer> fe
nunmap <buffer> fi

nmap <buffer> s /
nmap <buffer> ZQ :q!<cr>
nmap <buffer> <cr> <Plug>(fern-action-open-or-expand)
nmap <buffer> % <Plug>(fern-action-new-file)
nmap <buffer> v <Plug>(fern-action-open:side)
nmap <buffer> d <Plug>(fern-action-new-dir)
nmap <buffer> cd <Plug>(fern-action-cd)
nmap <buffer> c <Plug>(fern-action-terminal)
nmap <buffer> - <Plug>(fern-action-leave)
nmap <buffer> gh <Plug>(fern-action-hidden)
nmap <buffer> <c-l> <Plug>(fern-action-reload)

nmap <buffer> mf <Plug>(fern-action-mark:toggle)
nmap <buffer> mF <Plug>(fern-action-mark:clear)
nmap <buffer> mm <Plug>(fern-action-move)
nmap <buffer> mc <Plug>(fern-action-copy)
nmap <buffer> R <Plug>(fern-action-rename)

" f/F to toggle and go down/up
nmap <buffer> f <Plug>(fern-action-mark:toggle)j
nmap <buffer> F <Plug>(fern-action-mark:toggle)k
