setlocal synmaxcol=1000
setlocal noexpandtab
" setlocal fileencoding=utf-8
setlocal noswapfile

let g:markdown_fenced_languages = ['css', 'javascript', "sh", "bash"]

nn <buffer> <leader>ac o```<esc>o```<esc>kA
