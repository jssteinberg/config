" Colo Cyclone

function! SetColorscheme(colo)
	exe 'set termguicolors hlsearch | colorscheme '.a:colo.name
	exe 'set background=' . (exists('a:colo.bg') ? a:colo.bg : 'dark')
	if exists('a:colo.transparent')
		highlight Normal guibg=NONE
		highlight LineNr guibg=NONE
		highlight SignColumn guibg=NONE
	endif
	if v:errmsg != ""
		colorscheme default | set notermguicolors t_Co=16 nohlsearch | colorscheme default
		return 0
	else | return 1 | endif
endfunction

function! ColorschemeCycleFavs()
	let i = 0 | while i < len(g:colo_favs)
		if exists("g:colo_favs[i].current") && g:colo_favs[i].current
			unlet g:colo_favs[i].current
			let next_i = (i + 1) < len(g:colo_favs) ? i + 1 : 0
			let g:colo_favs[next_i].current = SetColorscheme(g:colo_favs[next_i])
			return 1
		else | let i+=1 | endif
	endwhile
endfunction
