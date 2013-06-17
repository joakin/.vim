
" Toggle line number type {

function! g:ToggleNuMode(globally)

  if(&nu ==? 0 && &rnu ==? 0)
    set nu
  elseif(&nu ==? 1 && &rnu ==? 0)
    set nonu rnu
  else
    set nonu nornu
  endif

endfunc

" }
