nnoremap gS :Ag -Q ''<left>
nnoremap gs :Ag<cr>
xnoremap gs y:Ag -Q '"'<CR>
command! TODO execute "Ag TODO"
command! FIX execute "Ag \"FIX|XXX|HACK|OPTIMIZE\""
