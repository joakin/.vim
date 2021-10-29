" Hemisu light setup
" set background=light
" colorscheme hemisu
" hi ColorColumn ctermbg=255

" set background=light
" set background=dark
" colorscheme PaperColor

" colorscheme gruvbox

" colorscheme solarized

" colorscheme spacegray

" hi Normal ctermbg=none
" hi NonText ctermbg=none
" hi ColorColumn ctermbg=none

" Setup with transparent background for the terminal
augroup vimrc
  autocmd!
  autocmd ColorScheme * call Highlights()
augroup END

function Highlights()
  if &background == 'dark'
    hi Normal ctermbg=none
    hi LineNr ctermbg=none
    hi NonText ctermbg=none
    hi ColorColumn ctermbg=none
    hi SignColumn ctermbg=none
    hi VertSplit ctermbg=none
    hi Folded ctermbg=234 ctermfg=59
    hi StatusLine cterm=none ctermbg=none
    hi StatusLineNC cterm=none ctermfg=239 ctermbg=232
    hi Comment ctermfg=240
    hi CursorLine ctermbg=233
    " hi StatusLine ctermbg=none ctermfg=249
    " Normal         xxx ctermfg=250 guifg=#B3B8C4 guibg=#111314
    "

    " Errors in Red
    hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
    " Warnings in Yellow
    hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
    " Info and Hints in White
    hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
    hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White
  endif
endfunction

colorscheme gruvbox
