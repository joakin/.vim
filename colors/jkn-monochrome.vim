
"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/monochrome.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "jkn-monochrome"

let g:airline_theme = "tomorrow"

hi clear StatusLine
hi clear StatusLineNC

"Set up your new & improved colors
hi clear CursorColumn
hi link CursorColumn CursorLine

hi ColorColumn ctermbg=233 guibg=#121212

hi FoldColumn       ctermbg=234  ctermfg=242  guibg=#1c1c1c guifg=#6c6c6c cterm=NONE           gui=NONE
hi Folded           ctermbg=234  ctermfg=242  guibg=#1c1c1c guifg=#6c6c6c cterm=NONE           gui=NONE

