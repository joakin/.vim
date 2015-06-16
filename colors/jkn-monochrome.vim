
set background=dark

"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "jkn-monochrome"

let g:airline_theme = "tomorrow"

hi Normal                   guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi Cursor                   guifg=Black     ctermfg=16   guibg=LightGray ctermbg=252   gui=NONE      cterm=NONE      term=NONE
hi CursorLine               guifg=LightGray ctermfg=NONE guibg=#202020   ctermbg=234   gui=NONE      cterm=NONE      term=NONE
hi CursorLineNr             guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=bold      cterm=bold      term=bold
hi FoldColumn               ctermbg=234     ctermfg=242  guibg=#1c1c1c   guifg=#6c6c6c cterm=NONE    gui=NONE
hi Folded                   ctermbg=234     ctermfg=242  guibg=#1c1c1c   guifg=#6c6c6c cterm=NONE    gui=NONE
hi LineNr                   guifg=DarkGray  ctermfg=248  guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi Statement                guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=bold      cterm=bold      term=bold
hi PreProc                  guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=bold      cterm=bold      term=bold
hi String                   guifg=#778899   ctermfg=31   guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi Comment                  guifg=#737373   ctermfg=23   guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi Constant                 guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi Type                     guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=bold      cterm=bold      term=bold
hi Function                 guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi Identifier               guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi Special                  guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi MatchParen               guifg=Black     ctermfg=16   guibg=LightGray ctermbg=252   gui=NONE      cterm=NONE      term=NONE
hi pythonEscape             guifg=#778899   ctermfg=31   guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi javaScriptFunction       guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=bold      cterm=bold      term=bold
hi elixirDelimiter          guifg=#778899   ctermfg=31   guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi Search                   guifg=White     ctermfg=15   guibg=#778899   ctermbg=31    gui=NONE      cterm=NONE      term=NONE
hi Visual                   guifg=White     ctermfg=15   guibg=#778899   ctermbg=31    gui=NONE      cterm=NONE      term=NONE
hi NonText                  guifg=DarkGray  ctermfg=248  guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi Directory                guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=bold      cterm=bold      term=bold
hi Title                    guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=bold      cterm=bold      term=bold
hi markdownHeadingDelimiter guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=bold      cterm=bold      term=bold
hi markdownHeadingRule      guifg=White     ctermfg=15   guibg=Black     ctermbg=NONE  gui=bold      cterm=bold      term=bold
hi markdownLinkText         guifg=#778899   ctermfg=31   guibg=Black     ctermbg=NONE  gui=underline cterm=underline term=underline
hi Todo                     guifg=Black     ctermfg=16   guibg=Yellow    ctermbg=226   gui=bold      cterm=bold      term=bold
hi Pmenu                    guifg=White     ctermfg=15   guibg=#778899   ctermbg=31    gui=NONE      cterm=NONE      term=NONE
hi PmenuSel                 guifg=#778899   ctermfg=31   guibg=White     ctermbg=15    gui=NONE      cterm=NONE      term=NONE
hi helpSpecial              guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi helpHyperTextJump        guifg=#778899   ctermfg=31   guibg=Black     ctermbg=NONE  gui=underline cterm=underline term=underline
hi helpNote                 guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimOption                guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimGroup                 guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimHiClear               guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimHiGroup               guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimHiAttrib              guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimHiGui                 guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimHiGuiFgBg             guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimHiCTerm               guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimHiCTermFgBg           guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimSynType               guifg=LightGray ctermfg=NONE guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE
hi vimCommentTitle          guifg=#737373   ctermfg=23   guibg=Black     ctermbg=NONE  gui=NONE      cterm=NONE      term=NONE

hi SignColumn term=reverse cterm=reverse gui=reverse

hi clear CursorColumn
hi link CursorColumn CursorLine

" hi clear StatusLine
" hi clear StatusLineNC

hi ColorColumn ctermbg=233 guibg=#121212

