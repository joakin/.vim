let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
let g:elm_make_show_warnings = 1
let g:elm_format_fail_silently = 1
let g:elm_make_output_file = "/dev/null"

augroup elm_autocommands
  " Disabled in favor of ALE errors for now
  " au! BufWritePost *.elm ElmMake
augroup END

" Don't autodetect indent settings for elm files
let b:sleuth_automatic = 0
setlocal expandtab
set shiftwidth=4
