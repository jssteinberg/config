" Colo Cyclone -- a plugin to come

function! SetColorscheme(colo)
	set termguicolors " colorscheme must support this
	set hlsearch " only good with a colorscheme

	silent! exe 'colorscheme ' . a:colo.name
	silent! exe 'set background=' . (exists('a:colo.bg') ? a:colo.bg : 'dark')

	if v:errmsg == ""
		if exists('a:colo.transparent')
			highlight Normal guibg=NONE
			highlight LineNr guibg=NONE
			highlight SignColumn guibg=NONE
		endif

		return 1
	else
		colorscheme default
		set notermguicolors t_Co=16 nohlsearch

		return 0
	endif
endfunction

function! ColorschemeCycleFavs()
	let i = 0

	while i < len(g:colo_favs)
		if exists("g:colo_favs[i].current") && g:colo_favs[i].current
			unlet g:colo_favs[i].current

			let next_i = (i + 1) < len(g:colo_favs) ? i + 1 : 0
			let g:colo_favs[next_i].current = 1 " may be erronous, but set as current

			call SetColorscheme(g:colo_favs[next_i])

			break
		else
			let i+=1
		endif
	endwhile
endfunction
