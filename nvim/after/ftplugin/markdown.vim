setlocal synmaxcol=1000
setlocal noexpandtab
setlocal noswapfile
setlocal conceallevel=0

let g:markdown_fenced_languages = [
			\"bash",
			\"css",
			\"javascript",
			\"html",
			\"lua",
			\"scss",
			\"sh",
			\"vim",
			\"zsh",
			\]

nn <buffer> <leader>ac o```<esc>o```<esc>kA
