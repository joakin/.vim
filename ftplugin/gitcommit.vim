setlocal colorcolumn=73
setlocal textwidth=72

" Highlight as error if the first line is too long
match ErrorMsg /\%1l.\%>51v/

setlocal spell
