" Substitute shortcut
nnoremap <leader>r :%s/
xnoremap <leader>r :s/

" Opening stuff (files, windows, etc)
" Files:
nnoremap <leader>v :e $MYVIMRC<cr>:FollowSymlink<cr>
" Windows/buffers:
nnoremap <leader>ot :tabe<cr>
nnoremap <leader>ov :vsp<cr>
nnoremap <leader>os :sp<cr>
nnoremap <leader>oq :copen<cr>
nnoremap <leader>ol :lopen<cr>
nnoremap <leader>on :enew<cr>

" Fast saving & quitting
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>u :bd<cr>
