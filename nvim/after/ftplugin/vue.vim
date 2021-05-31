" Source:
" https://vimways.org/2018/death-by-a-thousand-files/
setlocal suffixesadd+=.js
setlocal suffixesadd+=.vue
setlocal suffixesadd+=.scss
setlocal suffixesadd+=.stylus
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
" function should be considered as a macro:
setlocal define=^\\s*function
