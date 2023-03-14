lua require("dirbuf").setup({ sort_order = "directories_first" })

setlocal nolist

nn <buffer> l <Plug>(dirbuf_enter)
nn <buffer> h <Plug>(dirbuf_up)
nn <buffer> <c-o> :lua require("dirbuf").enter("split")<CR>
nn <buffer> <c-p> :lua require("dirbuf").enter("vsplit")<CR>
