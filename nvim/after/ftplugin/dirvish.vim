setlocal nonumber norelativenumber

" Empty local arglist if new divirsh buffer alone in current tab
if winnr('$') == 1
	%argd
	echo "Empty arglist"
endif

" Move/add
nmap <buffer> l <cr>
nmap <buffer> h -
nmap <buffer> f xj

" Make
nn <buffer> e :!touch %
nn <buffer> E :edit %
nn <buffer> m :!mkdir %
" Delete
nmap <expr> <buffer> D argc() ? "1.rm -fr<cr>" : "D V.rm -fr<cr>"
xmap <buffer> D .rm -fr<cr>
" Rename
nmap <buffer> R .mv<c-e> ./
xmap <buffer> R .mv<c-e> {}<cr>
" Move
nmap <expr> <buffer> M argc() ? "1.mv <c-e> {}<cr>" : ".mv<c-e> "
xmap <buffer> M .mv<c-e> {}<cr>
" Copy
nmap <expr> <buffer> C argc() ? "1.cp <c-e> {}<cr>" : "V.cp<c-e> {}<cr>"
xmap <buffer> C .cp<c-e> {}<cr>

" Open path
nn <buffer> o :call dirvish#open('split', 0)<CR>
nn <buffer> v :call dirvish#open('vsplit', 0)<CR>
nn <buffer> t :call dirvish#open('tabedit', 0)<CR>
nn <buffer> O :call dirvish#open('tabedit', 0)<CR>

" Reload
nn <silent><buffer> <c-l> :<c-u>Dirvish<cr>

" Map `gh` to hide dot-prefixed files. Reload to toggle.
nnoremap <silent><buffer> gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
