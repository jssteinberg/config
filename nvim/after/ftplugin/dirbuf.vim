if get(g:, "no_dirbuf_setup", 1)
	lua require("dirbuf").setup({ sort_order = "directories_first" })
	let g:no_dirbuf_setup = 0
endif

setlocal nolist nowrap

nn <buffer> l <Plug>(dirbuf_enter)
nn <buffer> h <Plug>(dirbuf_up)
nn <buffer> <c-s> :lua require("dirbuf").enter("split")<CR>
nn <buffer> <c-p> :lua require("dirbuf").enter("vsplit")<CR>
