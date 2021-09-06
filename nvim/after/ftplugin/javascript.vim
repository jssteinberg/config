set fileencoding=utf-8
set tabstop=2
set shiftwidth=2
" Source:
" https://vimways.org/2018/death-by-a-thousand-files/
setlocal suffixesadd+=.js
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
" function should be considered as a macro:
setlocal define=^\\s*function
