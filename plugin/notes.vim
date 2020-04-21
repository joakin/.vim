imap <expr> <Plug>(notes-link) notes#link()
xnoremap <Plug>(notes-make-new-note) :<c-u>call notes#make_new_note()<cr>

command! -nargs=0 NoteReferences exec 'Ag ' . expand('%:t:r')
command! -nargs=0 NoteLink call notes#search_note()
command! -nargs=1 NoteNew call notes#new(<q-args>)
