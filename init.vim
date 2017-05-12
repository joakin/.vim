" OS detection vars {
let g:isMac = 0
if has('macunix')
  let g:isMac = 1
endif
let g:isLinux = !isMac
" }

" Plugins/Packages {
call plug#begin('~/.vim/plugged')

" Basics {
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif
" Enable repeat for plugins
Plug 'tpope/vim-repeat'
" Fix some netrw ( - for up dir, . or ! for cmd with file, cg/cl to cd/lcd, ~ )
Plug 'tpope/vim-vinegar'
" File/Buffer/Tag finder
Plug 'kien/ctrlp.vim'
" Like f but multiline and faster 's'
Plug 'justinmk/vim-sneak'
" Align text :Tabularize
Plug 'godlygeek/tabular'
" Change surrounding delimiters (cs"')
Plug 'tpope/vim-surround'
" c-a c-x for dates
Plug 'tpope/vim-speeddating'
" Tons of useful mappings
Plug 'tpope/vim-unimpaired'
" Abbreviations, Substitutions, Coercion...
Plug 'tpope/vim-abolish'
" Autocomplete (autoclose) parens brackets, quotes, etc
" Plug 'kana/vim-smartinput'
" Readline mappings
Plug 'tpope/vim-rsi'
" Auto detect indent settings
Plug 'tpope/vim-sleuth'
" Auto formatprg (gq)
Plug 'Chiel92/vim-autoformat'
" Highlights extra whitespace and :StripWhitespace
Plug 'ntpeters/vim-better-whitespace'
" Distraction free editing mode (:Goyo)
Plug 'junegunn/goyo.vim'
" Comment and uncomment code with gc{motion} (gcc gcgc)
Plug 'tpope/vim-commentary'
" }

" Text Objects {
" Custom text objects (kana dep)
Plug 'kana/vim-textobj-user'
" il al
Plug 'kana/vim-textobj-line'
" iz az
Plug 'kana/vim-textobj-fold'
" ie ae
Plug 'kana/vim-textobj-entire'
" ai ii aI iI
Plug 'qstrahl/vim-dentures'
" ic ac iC aC
Plug 'coderifous/textobj-word-column.vim'
" }

" Syntax {
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'digitaltoad/vim-jade'
Plug 'nono/vim-handlebars'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'mintplant/vim-literate-coffeescript'
Plug 'tpope/vim-markdown'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-yaml' " Vim 7.4 yaml syntax is horrible slow
Plug 'ElmCast/elm-vim'
Plug 'raichoo/purescript-vim'
Plug 'FrigoEU/psc-ide-vim/'
Plug 'chikamichi/mediawiki.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
" }

" Typescript {
Plug 'leafgarland/typescript-vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
" }

" Clojure {
" Language and repl integration
Plug 'tpope/vim-fireplace'
" Clojure syntax files
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
" }

" CSS {
Plug '1995eaton/vim-better-css-completion'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'
" }

" PHP {
Plug 'swekaj/php-foldexpr.vim'
" }

" Rust {
Plug 'racer-rust/vim-racer'
" }

" External tools {
" Search with :Ag
Plug 'rking/ag.vim'
" Syntax checking and linting
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
" Git commands
Plug 'tpope/vim-fugitive'
" Unix commands (Remove, Move, Chmod, Mkdir, Find, Locate, Wall, SudoWrite, SudoEdit)
Plug 'tpope/vim-eunuch'
" Lisp stuff
Plug 'jpalardy/vim-slime'
" }

" Internets {
" Dep for gist-vim
Plug 'mattn/webapi-vim'
" Upload gists with :Gist
Plug 'mattn/gist-vim'
" }

" Color schemes {
Plug 'jonathanfilip/vim-lucius'
Plug 'nanotech/jellybeans.vim'
Plug 'noahfrederick/Hemisu'
Plug 'fxn/vim-monochrome'
Plug 'sjl/badwolf'
Plug 'reedes/vim-colors-pencil'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-vividchalk'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'robertmeta/nofrils'
Plug 'chriskempson/base16-vim'
Plug 'ajh17/Spacegray.vim'
" }

call plug#end()
" }

let mapleader=" "
let maplocalleader= "\\"

" Settings {

" Set a short key capture time on terminal. Else it takes a second to process " Esc...
if !has("gui_running")
  set ttimeoutlen=100
endif

" Tab size
set softtabstop=2
set shiftwidth=2
set shiftround
set tabstop=2
set expandtab

set undofile    " Create undo files with history
set nowrap
set textwidth=79
set colorcolumn=80
set formatoptions=croqn1
set copyindent  " copy the previous indentation on autoindenting
set hidden      " Allow modified/unsaved buffers in the background.

set ignorecase  " Not case sensitive search
set smartcase   " Unless the search contains caps letters
set hlsearch    " highlight search terms
set gdefault    " Default g flag on substitutions

set showmatch   " Jump to bracket/parens briefly
set matchtime=1 " Time of the jump of showmatch

set directory=~/.vimswap//
set undodir=~/.vimundo//
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

set wildmode=longest,list:list,full
set omnifunc=syntaxcomplete#Complete
set number
set norelativenumber
set numberwidth=4
set synmaxcol=800 " Don't try to highlight lines longer than
set mouse=a

set switchbuf=useopen,usetab " When available switch to open buffers in current and different tabs
set scrolloff=3
set sidescrolloff=1

" FoldText {
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()
" }
"
set foldenable
set foldlevelstart=0
set foldmarker={,}

" Invisible char settings (list)
set listchars=tab:»\ ,trail:·,extends:…,precedes:…,nbsp:&,eol:¬

" Spell stuff
set spellfile=$HOME/.vim/spell/custom.utf-8.add

" Separators and fillchar
set fillchars=vert:│,fold:─,diff:━,stlnc:-

" Use the system clipboard by default
set clipboard=unnamed,unnamedplus

if has("gui_running")
  if isLinux
    set gfn=monospace\ 14
    set linespace=2
  elseif isMac
    set gfn=Courier\ Prime\ Source:h16
    set linespace=6
  endif

  set guioptions=c
  set guioptions-=T
endif

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

" Variables {

" netrw {
let g:netrw_liststyle = 1
" }

" CtrlP {
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$|^target$|^node_modules$',
\ 'file': '\.exe$\|\.so$\|\.dll|\.swp$',
\ 'link': '',
\ }
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" }

" Slime {
let g:slime_target = "tmux"
" let g:slime_no_mappings = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
" }

" Rainbow parenthesis {
let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '4',  '#268bd2'],
  \ [ '6',  '#2aa198'],
  \ ]
" }

" Syntastic {
let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi']
" }

" Gist {
if isMac
  let g:gist_clip_command = 'pbcopy'
elseif isLinux
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" }

" Goyo {
let g:goyo_width=90
let g:goyo_margin_top=1
let g:goyo_margin_bottom=1
" }

" rsi {
" Breaks macros on the terminal
let g:rsi_no_meta = 1
" }

" tsuquyomi {
" Disable quickfix in favor of syntastic
let g:tsuquyomi_disable_quickfix = 1
" }

" }
