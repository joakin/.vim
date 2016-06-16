" OS detection vars {
let g:isMac = 0
if has('macunix')
  let g:isMac = 1
endif
let g:isLinux = !isMac
" }

source ./packages.vim

let mapleader=" "
let maplocalleader= "\\"

" Per project settings {
if has('autocmd')
  " Example of project settings.
  " augroup project_settings
  "   au!
  "   au BufNewFile,BufRead ~/dev/projects/wikimedia/* setlocal softtabstop=4 shiftwidth=4 tabstop=4
  " augroup END
  augroup wikimedia_mediawiki_project_settings
    au!
    " au BufNewFile,BufRead ~/dev/wikimedia/* let g:syntastic_javascript_checkers = ['jshint', 'jscs']
    autocmd FileType javascript if stridx(expand('%:p'), $HOME . '/dev/wikimedia/') == 0 |
        \ let b:syntastic_checkers = ['jshint', 'jscs'] | endif
  augroup END
endif
" }


" After this file is sourced, plug-in code will be evaluated.
" See ~/.vim/after for files evaluated after that.
" See `:scriptnames` for a list of all scripts, in evaluation order.
" Launch Vim with `vim --startuptime vim.log` for profiling info.
"
" To see all leader mappings, including those from plug-ins:
"
"   vim -c 'set t_te=' -c 'set t_ti=' -c 'map <space>' -c q | sort
