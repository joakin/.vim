if has('autocmd')
  augroup joakin_autocommands " {

    au!

    " Instant settings
    au BufWritePost $MYVIMRC :source $MYVIMRC
    au BufWritePost ~/.vim/.vimrc :source $MYVIMRC
    au BufWritePost ~/.nvim/.nvimrc :source $MYVIMRC

    " Remember last cursor position
    au BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g`\"zvzz"                        |
          \ endif

    " Autoclose popups
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

    " Checktime on focus
    au WinEnter,FocusGained,BufEnter * :checktime

  augroup END
endif
" }
