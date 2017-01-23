if has('autocmd')
  augroup wikimedia_mediawiki_project_settings
    au!
    au BufNewFile,BufRead ~/dev/wikimedia/mediawiki-vagrant/* let g:syntastic_javascript_checkers = ['eslint']
    " */wikimedia/*
    " autocmd FileType javascript if stridx(expand('%:p'), $HOME . '/dev/wikimedia/') == 0 |
    "     \ let b:syntastic_checkers = ['jshint', 'jscs'] | endif
  augroup END
endif
