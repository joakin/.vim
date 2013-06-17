
" Toggle conceal level {

function! g:ToggleConceal(globally)
    if(&conceallevel)
      if(a:globally)
        set conceallevel=0
      else
        setlocal conceallevel=0
      endif
    else
      if(a:globally)
        set conceallevel=2
      else
        setlocal conceallevel=2
      endif
    endif
endfunc

" }
