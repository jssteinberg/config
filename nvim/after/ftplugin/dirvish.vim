setlocal nonumber norelativenumber

" Move/add
nmap <buffer> l <cr>
nmap <buffer> h -
nmap <buffer> f xj

" Manipulate
nn <buffer> e :!touch %
nn <buffer> E :edit %
nn <buffer> m :!mkdir %
nn <buffer> M :!mkdir %
nmap <expr> <buffer> D len(argv()) ? "1.rm -fr<cr>" : "D V.rm -fr<cr>"
xmap <buffer> D .rm -fr<cr>
nmap <expr> <buffer> R len(argv()) ? "1.mv <c-e> {}<cr>" : "V.mv<c-e> {}<cr>"
xmap <buffer> R .mv<c-e> {}<cr>
nmap <expr> <buffer> Y len(argv()) ? "1.cp <c-e> {}<cr>" : "V.cp<c-e> {}<cr>"
xmap <buffer> Y .cp<c-e> {}<cr>

" Open path
nn <buffer> o :call dirvish#open('split', 0)<CR>
nn <buffer> v :call dirvish#open('vsplit', 0)<CR>
nn <buffer> t :call dirvish#open('tabedit', 0)<CR>
nn <buffer> O :call dirvish#open('tabedit', 0)<CR>

" Reload
nn <silent><buffer> <c-l> :<c-u>Dirvish<cr>

" Map `gh` to hide dot-prefixed files. Reload to toggle.
nnoremap <silent><buffer> gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
