" Colo Cyclone -- a plugin to come

function! SetColorscheme(colo)
	set termguicolors " colorscheme must support this
	set hlsearch " only good with a colorscheme

	" Set bg no matter what
	exe 'set background=' . (exists('a:colo.bg') ? a:colo.bg : 'dark')
	silent! exe 'colorscheme ' . a:colo.name

	if v:errmsg == "" && exists('a:colo.transparent')
		highlight Normal guibg=NONE
		highlight LineNr guibg=NONE
		highlight SignColumn guibg=NONE
	elseif v:errmsg != ""
		silent colorscheme default
		silent set notermguicolors t_Co=16 nohlsearch
		silent let v:errmsg = ""
	endif
endfunction

function! ColoNext()
	let l:i = 0

	while l:i < len(g:colo_favs)
		if exists("g:colo_favs[l:i].current") && g:colo_favs[l:i].current
			unlet g:colo_favs[l:i].current

			let l:next_i = (l:i + 1) < len(g:colo_favs) ? l:i + 1 : 0
			let g:colo_favs[l:next_i].current = 1 " may be erronous, but set as current

			call SetColorscheme(g:colo_favs[l:next_i])

			break
		else
			let l:i+=1
		endif
	endwhile
endfunction
