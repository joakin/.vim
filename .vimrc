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

" Language settings {
" For reference
" Places where :find and gf look for files
"   set path+=c:\\asd
"   set path+=./asd
" and suffixes autocomplete on that files
"   set suffixesadd=.java
" and files/folders to ignore on completion
"   set wildignore+=.class,classes

" General settings {
set path=.
set path+=**

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=target/                          " Clojure
set wildignore+=node_modules/                    " JS

" }

" CSS {
set suffixesadd+=.css,.styl,.less,.sass,.scss
" }

" Javascript {
set suffixesadd+=.jsx,.js,.json,.coffee,.litcoffee,.ls,.hbs,.jst,.underscore,.jade,.hbs

" Plugin 'othree/javascript-libraries-syntax.vim'
let g:javascript_conceal=1
command! -range=% JSBeautifyJSON <line1>,<line2>!js-beautify -f - -b expand
command! -range=% JSBeautify <line1>,<line2>!js-beautify -f -
command! -range=% JSBeautify <line1>,<line2>!js-beautify -f -
command! -range=% StandardFormat <line1>,<line2>!standard --format --stdin
" }

" Clojure {
set wildignore+=.class,classes
set suffixesadd+=.clj,.cljs
" }

" Rust {
let g:racer_cmd = "~/.cargo/bin/racer"
let $RUST_SRC_PATH=$HOME . "/.cargo/src/rustc-1.6.0/src"
" }

" Elm {
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
"}

" Purescript {
let g:psc_ide_syntastic_mode = 1
au FileType purescript nmap <localleader>t :PSCIDEtype<CR>
au FileType purescript nmap <localleader>s :PSCIDEapplySuggestion<CR>
au FileType purescript nmap <localleader>a :PSCIDEaddTypeAnnotation<CR>
au FileType purescript nmap <localleader>i :PSCIDEimportIdentifier<CR>
au FileType purescript nmap <localleader>r :PSCIDEload<CR>
au FileType purescript nmap <localleader>p :PSCIDEpursuit<CR>
au FileType purescript nmap <localleader>c :PSCIDEcaseSplit<CR>
au FileType purescript nmap <localleader>qd :PSCIDEremoveImportQualifications<CR>
au FileType purescript nmap <localleader>qa :PSCIDEaddImportQualifications<CR>
" }

"}

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
