function! notes#new(name) " {
  let id = tolower(system('uuidgen|tr -d "\n"'))
  let file = id . '.md'
  if filereadable(file)
    call notes#new(a:name)
  endif

  execute 'e ' . file
  call append(0, '# ' . a:name)
  silent update
  return id
endfunction " }

function! notes#make_new_note() " {
  normal! gv"zy
  let id = notes#new(@z)
  let @z = notes#make_link(id, @z)
  echo @z
  normal! gv"zP%w
endfunction " }

inoremap <Plug>(notes-search-note) <c-o>:call notes#search_note()<cr>

let s:icol = -1

function! notes#link() " {
  " Could all of this be done with fzf complete, and using the ag parameters?
  " probably! :shrug:
  let s:icol = col('.')
  call feedkeys("\<Plug>(notes-search-note)")
  return ''
endfunction " }

function! notes#search_note() " {
  call fzf#vim#ag('^# ', '', {'sink': function('notes#link_handler')})
endfunction " }

function! notes#link_handler(result) " {
  let parts = split(a:result, ':')
  let file = substitute(parts[0], '.md$', '', '')
  let line = parts[1]
  let column = parts[2]
  let title = substitute(join(parts[3:], ':'), '^# ', '', '')

  let currentLine = getline('.')
  let pos = s:icol == -1 ? col('.') - 1 : s:icol - 1

  let link = notes#make_link(file, title)

  let line = (pos > 0 ? currentLine[:pos-1] : '') . link . currentLine[pos:]
  call setline('.', line)
  call cursor(line('.'), pos + len(link))

  let s:icol = -1

  " startinsert " Doesnt work for some reason, feedkeys does
  call feedkeys('a', 'n')
endfunction " }

function notes#make_link(id, title) " {
  return '[[' . a:id . ' | ' . a:title . ']]'
endfunction " }
