let g:ColorColumnBlacklist = ['diff', 'qf']
let g:CursorlineBlacklist = []
let g:MkviewFiletypeBlacklist = ['diff', 'gitcommit']

function! autocmds#attempt_select_last_file() abort
  let l:previous=expand('#:t')
  if l:previous != ''
    call search('\v<' . l:previous . '>')
  endif
endfunction

function! autocmds#should_colorcolumn() abort
  return index(g:ColorColumnBlacklist, &filetype) == -1
endfunction

function! autocmds#should_cursorline() abort
  return index(g:CursorlineBlacklist, &filetype) == -1
endfunction

function! autocmds#blur_statusline() abort
  " Default blurred statusline (buffer number: filename).
  let l:blurred='%{statusline#gutterpadding(0)}'
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='%<' " truncation point
  let l:blurred.='%f' " filename
  let l:blurred.='%=' " split left/right halves (makes background cover whole)
  call s:update_statusline(l:blurred, 'blur')
endfunction

function! autocmds#focus_statusline() abort
  " `setlocal statusline=` will revert to global 'statusline' setting.
  call s:update_statusline('', 'focus')
endfunction

function! s:update_statusline(default, action) abort
  let l:statusline = s:get_custom_statusline(a:action)
  if type(l:statusline) == type('')
    " Apply custom statusline.
    execute 'setlocal statusline=' . l:statusline
  elseif l:statusline == 0
    " Do nothing.
    "
    " Note that order matters here because of Vimscript's insane coercion rules:
    " when comparing a string to a number, the string gets coerced to 0, which
    " means that all strings `== 0`. So, we must check for string-ness first,
    " above.
    return
  else
    execute 'setlocal statusline=' . a:default
  endif
endfunction

function! s:get_custom_statusline(action) abort
  if &ft == 'qf'
    " return 'Quickfix\ %<%=\ ℓ\ %l/%L\ @\ %c%V\ %1*%p%%%*'
    return 0
  endif

  return 1 " Use default.
endfunction

function! autocmds#split_resize()
  if &textwidth > winwidth(0)
    exe "vertical resize" . &textwidth
  endif
  if winheight(0) < 12
    exe "resize" . 12
  endif
  " Original implementation
  " Resize the current split to at least (80,12) but no more than (140,60)
  " or 2/3 of the available space otherwise.
  " let hmax = max([winwidth(0), float2nr(&columns*0.66), 80])
  " let vmax = max([winheight(0), float2nr(&lines*0.66), 12])
  " exe "vertical resize" . (min([hmax, 140]))
  " exe "resize" . (min([vmax, 60]))
endfunction

