setlocal synmaxcol=1000
setlocal noexpandtab
setlocal noswapfile

let g:markdown_fenced_languages = [
			\"bash",
			\"css",
			\"javascript",
			\"html",
			\"lua",
			\"sh",
			\"vim",
			\"zsh",
			\]

nn <buffer> <leader>ac o```<esc>o```<esc>kA
