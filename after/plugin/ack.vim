nnoremap gS :Ack! -Q ''<left>
nnoremap gs :Ack!<cr>
xnoremap gs "zy:exec 'Ack! -Q ' . shellescape(@z)<CR>
command! TODO execute "Ack! TODO"
command! FIX execute "Ack! \"FIX|XXX|HACK|OPTIMIZE\""
