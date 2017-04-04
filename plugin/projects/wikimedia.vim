if has('autocmd')
  augroup wikimedia_mediawiki_project_settings
    au!
    au BufNewFile,BufRead ~/dev/wikimedia/mediawiki-vagrant/* call Setup_wikimedia_project()
    " */wikimedia/*
    " autocmd FileType javascript if stridx(expand('%:p'), $HOME . '/dev/wikimedia/') == 0 |
    "     \ let b:syntastic_checkers = ['jshint', 'jscs'] | endif
  augroup END
endif

function! Setup_wikimedia_project()
  let g:syntastic_javascript_checkers = ['eslint']
  if &ft =~ "^javascript"
    " Disable autoformatting with formatprg
    let b:format_on_save = 0
  endif
endfunction
