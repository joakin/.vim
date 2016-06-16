scriptencoding utf-8

" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
if has('statusline')
    set statusline=
    set statusline+=%3*    " Switch to User3 highlight group.
    set statusline+=\      " Space
    set statusline+=%n     " Buffer number
    set statusline+=\      " Space
    set statusline+=%*     " Reset highlight group.

    set statusline+=\      " Space
    set statusline+=%<%f   " Full path
    set statusline+=\      " Space
    set statusline+=%*     " Reset highlight group.

    set statusline+=%4*    " Switch to User4 highlight group.
    set statusline+=\      " Space
    set statusline+=%m     " Modified flag
    set statusline+=%*     " Reset highlight group.

    set statusline+=%3*    " Switch to User3 highlight group.
    set statusline+=\      " Space
    set statusline+=%y     " File type
    set statusline+=\      " Space
    set statusline+=%*     " Reset highlight group.

    set statusline+=%=     " Align right

    set statusline+=%2*    " Switch to User2 highlight group.
    set statusline+=\      " Space
    set statusline+=%l:%c/%L " Current line:Column number/total lines
    set statusline+=\      " Space
    set statusline+=%*     " Reset highlight group.

    set statusline+=%5*    " Switch to User5 highlight group.
    set statusline+=\      " Space
    set statusline+=%p     " Percentage through buffer.
    set statusline+=%%     " Literal %.
    set statusline+=%*     " Reset highlight group.
endif
