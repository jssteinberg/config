vim.o.statusline = " b:%n %f %=%r%w%y%<[%{&spelllang}] l:%l/%L c:%c "

-- legacy
--
-- function! WindowNumber()
-- 	return tabpagewinnr(tabpagenr())
-- endfunction
--
-- " Use in statusline as `%{StatusGitInfo()}`
-- function! StatusGitInfo()
-- 	if exists("*fugitive#head")
-- 		let l:gitStatus = fugitive#head()
-- 		return strlen(l:gitStatus) ? '(' . l:gitStatus . ')' : ''
-- 	endif
-- 	return ''
-- endfunction
--
-- set laststatus=2
-- set ruler
-- set rulerformat=%=<%P\ %M%t%<>
-- set statusline=\ %M%{WindowNumber()}\ ╲b%n\ ╲%f\ %{StatusGitInfo()}%=%r%w%y%<[%{&spelllang}]╱\ l:%l/%L\ c:%c