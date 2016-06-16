AddTabularPattern colon /:\zs/l0l1l0
AddTabularPattern spaces /[^ ]\zs\s/l0
AddTabularPattern inline_css /[{:}]/l1l1l0l1l1

noremap <leader>at       :Tabularize /
noremap <leader>aa       :Tabularize /
noremap <leader>af       :Tabularize /^.\{-}\zs
noremap <leader>al       :Tabularize /^.*\zs
noremap <leader>a\|      :Tabularize /\|<cr>
noremap <leader>a:       :Tabularize colon<cr>
noremap <leader>a<space> :Tabularize spaces<cr>
noremap <leader>a=       :Tabularize assignment<cr>
noremap <leader>acss     :Tabularize inline_css<cr>
