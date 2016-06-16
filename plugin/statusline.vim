scriptencoding utf-8

" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
if has('statusline')
  set statusline=
  set statusline+=%7*    " Switch to User7 highlight group.
  set statusline+=\      " Space
  set statusline+=%n     " Buffer number
  set statusline+=\      " Space
  set statusline+=%*     " Reset highlight group.

  set statusline+=%4*    " Switch to User4 highlight group.
  set statusline+=%<     " Truncation point, if not enough space
  set statusline+=%{statusline#fileprefix()} " File path
  set statusline+=%*     " Reset highlight group.
  set statusline+=%3*    " Switch to User3 highlight group (bold).
  set statusline+=\      " Space
  set statusline+=%t     " Filename.
  set statusline+=\      " Space
  set statusline+=%*     " Reset highlight group.

  set statusline+=%4*    " Switch to User4 highlight group.
  set statusline+=\      " Space
  " Needs to be all on one line:
  "   %(                   Start item group.
  "   [                    Left bracket (literal).
  "   %M                   Modified flag: ,+/,- (modified/unmodifiable) or nothing.
  "   %R                   Read-only flag: ,RO or nothing.
  "   %{statusline#ft()}   Filetype (not using %Y because I don't want caps).
  "   %{statusline#fenc()} File-encoding if not UTF-8.
  "   ]                    Right bracket (literal).
  "   %)                   End item group.
  set statusline+=%(%M%R%{statusline#ft()}%{statusline#fenc()}%)
  set statusline+=\      " Space
  set statusline+=%*     " Reset highlight group.

  set statusline+=%=     " Align right

  set statusline+=%4*    " Switch to User4 highlight group.
  set statusline+=\      " Space
  set statusline+=%l:%c/%L " Current line:Column number/total lines
  set statusline+=\      " Space
  set statusline+=%*     " Reset highlight group.

  set statusline+=%6*    " Switch to User6 highlight group.
  set statusline+=\      " Space
  set statusline+=%p     " Percentage through buffer.
  set statusline+=%%     " Literal %.
  set statusline+=%*     " Reset highlight group.

  if has('autocmd')
    augroup WincentStatusline
      autocmd!
      autocmd ColorScheme * call statusline#update_highlight()
    augroup END
  endif
endif
