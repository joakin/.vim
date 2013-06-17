
" Pulse Line {

function! s:Pulse() " {
  let current_window = winnr()
  windo set nocursorline
  execute current_window . 'wincmd w'
  setlocal cursorline

  redir => old_hi
  silent execute 'hi CursorLine'
  redir END
  let old_hi = split(old_hi, '\n')[0]
  let old_hi = substitute(old_hi, 'xxx', '', '')

  let steps = 9
  let width = 1
  let start = width
  let end = steps * width
  let color = 233

  for i in range(start, end, width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor
  for i in range(end, start, -1 * width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor

  execute 'hi ' . old_hi

  setlocal nocursorline
endfunction " }
command! -nargs=0 Pulse call s:Pulse()
"}

