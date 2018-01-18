nnoremap gS :Ack! -Q ''<left>
nnoremap gs :Ack!<cr>
xnoremap gs y:Ack! -Q '"'<CR>
command! TODO execute "Ack! TODO"
command! FIX execute "Ack! \"FIX|XXX|HACK|OPTIMIZE\""
