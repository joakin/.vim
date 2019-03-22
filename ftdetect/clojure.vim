autocmd BufNewFile,BufRead *.joke setlocal filetype=clojure

function! s:isExtraClojure()
  let shebang = getline(1)
  if shebang =~# '^#!.*/bin/env\s\+joker\>' | return 1 | endif
  if shebang =~# '^#!.*/bin/joker\>' | return 1 | endif
  return 0
endfunction

au BufRead,BufNewFile * if !did_filetype() && s:isExtraClojure() | setlocal filetype=clojure | endif
