
" Toggle line number type {

function! g:ToggleNuMode()

  if(&nu ==? 0 && &rnu ==? 0)
    set nu rnu
  " elseif(&nu ==? 1 && &rnu ==? 0)
  "   set nonu nornu
  else
    set nonu nornu
  endif

endfunc

" }
