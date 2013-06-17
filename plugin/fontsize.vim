
" Font size changing {

if has("gui_running")
  let s:fontIncrements = '1'
  function! AdjustFontSize(amount)
    if has("gui_running")

      let &guifont = substitute(
       \ &guifont,
       \ ':h\zs\d\+',
       \ '\=eval(submatch(0)'.a:amount.')',
       \ '')

    else
      echoerr "You need to run gui version of Vim to use this function."
    endif
  endfunction

  function! LargerFont()
    call AdjustFontSize('+'.s:fontIncrements)
  endfunction
  command! LargerFont call LargerFont()

  function! SmallerFont()
    call AdjustFontSize('-'.s:fontIncrements)
  endfunction
  command! SmallerFont call SmallerFont()
endif

" }

