
command! -register CopyMatches call commands#CopyMatches(<q-reg>)

command! -nargs=0 Pulse call commands#Pulse()

command! -nargs=0 -bar Qargs execute 'args ' . commands#QuickfixFilenames()

command! FollowSymlink :exec "file ". resolve(expand('%:p')) | e

command! SyntaxInfo :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
