function! statusline#gutterpadding(subtractBufferNumber) abort
  let l:gutterWidth=max([strlen(line('$')) + 1, &numberwidth])
  let l:bufferNumberWidth=a:subtractBufferNumber ? strlen(winbufnr(0)) : 0
  let l:padding=repeat(' ', l:gutterWidth - l:bufferNumberWidth)
  return l:padding
endfunction

function! statusline#fileprefix() abort
  let l:basename=expand('%:h')
  if l:basename == '' || l:basename == '.'
    return ''
  else
    " Make sure we show $HOME as ~.
    return substitute(l:basename . '/', '\C^' . $HOME, '~', '')
  endif
endfunction

function! statusline#ft() abort
  if strlen(&ft)
    return ',' . &ft
  else
    return ''
  endif
endfunction

function! statusline#fenc() abort
  if strlen(&fenc) && &fenc !=# 'utf-8'
    return ',' . &fenc
  else
    return ''
  endif
endfunction

let s:statusline_status_highlight='Identifier'

function! statusline#async_start() abort
  let s:statusline_status_highlight='Constant'
  call statusline#update_highlight()
endfunction

function! statusline#async_finish() abort
  let s:statusline_status_highlight='Identifier'
  call statusline#update_highlight()
endfunction

function! statusline#update_highlight() abort
  " Update StatusLine to use italics (used for filetype).
  let l:highlight=pinnacle#italicize('StatusLine')
  execute 'highlight User1 ' . l:highlight

  " Update MatchParen to use italics (used for blurred statuslines).
  let l:highlight=pinnacle#italicize('MatchParen')
  execute 'highlight User2 ' . l:highlight

  " Normal + bold (used for file names).
  let l:highlight=pinnacle#embolden('Normal')
  execute 'highlight User3 ' . l:highlight

  " StatusLineNC (used for path).
  highlight! link User4 StatusLineNC

  let l:prefix=has('gui') || has('termguicolors') ? 'gui' : 'cterm'
  let l:bg=synIDattr(synIDtrans(hlID('User2')), 'fg', l:prefix)
  let l:fg=synIDattr(synIDtrans(hlID('User3')), 'fg', l:prefix)

  " And opposite for the buffer number area.
  execute 'highlight User7 cterm=bold gui=bold term=bold ' .
        \ l:prefix . 'fg=' . synIDattr(synIDtrans(hlID('Normal')), 'fg', l:prefix) . ' ' .
        \ l:prefix . 'bg=' . l:fg

  " Right-hand side section + italic (used for %).
  execute 'highlight User6 ' . l:prefix . '=bold,italic ' . l:prefix . 'fg=' . l:bg . ' ' . l:prefix . 'bg=' . l:fg

  " highlight clear StatusLineNC
  " highlight! link StatusLineNC User1
endfunction
