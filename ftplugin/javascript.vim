
setlocal omnifunc=javascriptcomplete#CompleteJS
setlocal conceallevel=0
setlocal tabstop=2
setlocal concealcursor=nc
setlocal foldmethod=syntax

set suffixesadd+=.jsx,.js,.json,.coffee,.litcoffee,.ls,.hbs,.jst,.underscore,.jade,.hbs

command! -range=% JSBeautifyJSON <line1>,<line2>!js-beautify -f - -b expand
command! -range=% JSBeautify <line1>,<line2>!js-beautify -f -
command! -range=% JSBeautify <line1>,<line2>!js-beautify -f -
command! -range=% StandardFormat <line1>,<line2>!standard-format --stdin

let g:javascript_conceal=1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇐"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

let g:javascript_plugin_flow = 1

" Allow jsx syntax on .js files
let g:jsx_ext_required = 0

" Set formatprg
" Disabled because of w0rp/ale
" setlocal formatprg=prettier\ --stdin

" Enable formatting by default
" augroup js_autocommands
"   au! BufWritePre *.js call autocmds#format_file()
" augroup END
