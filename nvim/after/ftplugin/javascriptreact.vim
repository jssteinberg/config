" set fileencoding=utf-8
" Source:
" https://vimways.org/2018/death-by-a-thousand-files/
setlocal iskeyword+=-
setlocal suffixesadd+=.js,.jsx
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
" function should be considered as a macro:
setlocal define=^\\s*function
