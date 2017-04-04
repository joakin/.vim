let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
let g:elm_make_show_warnings = 1
let g:elm_format_fail_silently = 1
let g:elm_make_output_file = "/dev/null"

augroup elm_autocommands
  au! BufWritePost *.elm ElmMake
augroup END
