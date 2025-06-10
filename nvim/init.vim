" NETRW KEYMAPS
function! SetNetrwKeymaps() abort
	let g:netrw_preview=1 " Vertical preview
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
