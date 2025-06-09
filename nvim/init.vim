" NETRW KEYMAPS
function! SetNetrwKeymaps() abort
	nn <buffer> s /
	nn <buffer> S ?
	nmap <buffer> <c-j> <cr>
	nmap <buffer> <c-k> v
endfunction

" AUTO COMMANDS
aug vim_config | au!
	" Set netrw maps
	autocmd filetype netrw call SetNetrwKeymaps()
augroup END

" BOOTSTRAP LAZY.NVIM, LAZYVIM AND YOUR PLUGINS
lua << EOF
  require("config.lazy")
EOF
