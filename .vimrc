
" Utility functions {
"

let g:isUnix = 1
if has('win32') || has('win64')
  let g:isUnix = 0
endif

fun! IsUnix()
  return g:isUnix
endfun

let g:isMac = 0
if has('macunix')
  let g:isMac = 1
endif

fun! IsMac()
  return g:isMac
endfun

let g:isLinux = IsUnix() && !IsMac()
fun! IsLinux()
  return g:isLinux
endfun
" }

set nocompatible
set encoding=utf-8

" Vundle {
"
" Vundle init {
filetype off   " required for vundle

if IsUnix()
    " Usual quickstart instructions
    set runtimepath+=~/.vim/bundle/vundle/
    call vundle#rc()
else
    set runtimepath+=~/vimfiles/bundle/vundle/
    call vundle#rc('$HOME/vimfiles/bundle/')
endif

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" }

" VimL libraries and deps {
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'tpope/vim-repeat'
" }

" Vim improvements {

" Gui {
" Nice status bar
Bundle 'bling/vim-airline'
" Fix some netrw
Bundle 'tpope/vim-vinegar'
" }

" Command line {
" File/Buffer/Tag finder
Bundle 'kien/ctrlp.vim'
" }

" Movement {
Bundle 'matchit.zip'
" Like f but multiline and faster 's'
Bundle 'justinmk/vim-sneak'
" d]a) or c[i( for example
Bundle 'tommcdo/vim-ninja-feet'
" }

" Editing {
" Align text :Tabularize
Bundle 'godlygeek/tabular'
" Change surrounding delimiters (cs"')
Bundle 'tpope/vim-surround'
" c-a c-x for dates
Bundle 'tpope/vim-speeddating'
" Tons of useful mappings
Bundle 'tpope/vim-unimpaired'
" Abbreviations, Substitutions, Coercion...
Bundle 'tpope/vim-abolish'
" Autocomplete (autoclose) parens brackets, quotes, etc
Bundle 'kana/vim-smartinput'

" Readline mappings
Bundle "tpope/vim-rsi"

" Snippets
Bundle "SirVer/ultisnips"
Bundle 'honza/vim-snippets'

" Operator for exchanging text (cx)
Bundle 'tommcdo/vim-exchange'

" Auto completion popup
Bundle 'Shougo/neocomplete.vim'

" Auto detect indent settings
Bundle 'tpope/vim-sleuth'

" Operator for aligning text (gl, gL)
Bundle 'tommcdo/vim-lion'
" }

" Text Objects {
" Custom text objects (kana dep)
Bundle 'kana/vim-textobj-user'
" f{char}
Bundle 'thinca/vim-textobj-between'
" il al
Bundle 'kana/vim-textobj-line'
" iz az
Bundle 'kana/vim-textobj-fold'
" ie ae
Bundle 'kana/vim-textobj-entire'
" i/ a/ i? a?
Bundle 'kana/vim-textobj-lastpat'
" ai ii aI iI
Bundle 'qstrahl/vim-dentures'
" ic ac iC aC
Bundle 'coderifous/textobj-word-column.vim'
" }

" Visual {
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'junegunn/goyo.vim'
" }

" }

" Coding {

" Editing {
" Comment and uncomment code with gc{motion} (gcc gcgc)
Bundle 'tpope/vim-commentary'
" }

" Languages {
" JS {
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'digitaltoad/vim-jade'
" Bundle 'briancollins/vim-jst'
Bundle 'nono/vim-handlebars'
Bundle 'moll/vim-node'
Bundle 'mxw/vim-jsx'
Bundle 'marijnh/tern_for_vim'
" }
" CoffeeScript {
Bundle 'kchmck/vim-coffee-script'
Bundle 'mintplant/vim-literate-coffeescript'
" }
" Livescript {
Bundle 'gkz/vim-ls'
" }
" Clojure {
" Language and repl integration
Bundle 'tpope/vim-fireplace'
" Clojure syntax files
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'tpope/vim-classpath'
" }
" HTML {
" Bundle 'mattn/emmet-vim'
" }
" CSS {
Bundle 'groenewege/vim-less'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'wavded/vim-stylus'
" }
" Markdown {
Bundle 'tpope/vim-markdown'
" }
" Liquid {
" Bundle 'tpope/vim-liquid'
" }
" }

" External tools {
" Bundle 'mileszs/ack.vim'
" Search with :Ag
Bundle 'rking/ag.vim'
" Git gutter
" Bundle 'mhinz/vim-signify'
" Send text to tmux/screen pane c-c
Bundle 'jpalardy/vim-slime'
" Syntax checking and linting
Bundle 'scrooloose/syntastic'
" Git commands
Bundle 'tpope/vim-fugitive'
" }

" Internets {

" Dep for gist-vim
Bundle 'mattn/webapi-vim'
" Upload gists with :Gist
Bundle 'mattn/gist-vim'
" }

" }

" Color schemes {
Bundle 'morhetz/gruvbox'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wgibbs/vim-irblack'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'nanotech/jellybeans.vim'
Bundle 'noahfrederick/Hemisu'
Bundle 'john2x/flatui.vim'
Bundle 'fxn/vim-monochrome'
Bundle 'sjl/badwolf'
" }

" After Vundle {
" Enable filetype plugin after Vundle
filetype plugin on
filetype indent on
" }

" }

" Vim general settings {

" Key capture time on terminal. Else it takes a second to process Esc...
if !has("gui_running")
  set ttimeoutlen=100
endif

" Tab size
set softtabstop=2
set shiftwidth=2
set shiftround
set tabstop=2
set expandtab

" Create undo files with history
set undofile

set ttyfast

" Wrap text when 80 cols
set nowrap
" set wrap
set textwidth=79
set colorcolumn=80
set formatoptions=croqn1

" Make vim think that dash is part of words. i want 'this-stuff' to be a word
set iskeyword+=-

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop

" Allow modified/unsaved buffers in the background.
set hidden

set ignorecase    " Not case sensitive search
set smartcase     " Unless the search contains caps letters
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set gdefault      " Default g flag on substitutions
set showmatch     " Jump to bracket/parens briefly. Does not interrupt editing
set matchtime=1   " Time of the jump of showmatch

set magic "Set magic on, for regular expressions (default?)

" set list

set directory=~/.vimswap//
set undodir=~/.vimundo//
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Set to auto read when a file is changed from the outside
set autoread

set autowrite

" Set split directions to something normal
set splitbelow
set splitright

set wildmenu
set wildmode=list:longest

syntax enable "Enable syntax hl

set omnifunc=syntaxcomplete#Complete

set completeopt=menu,preview

set backspace=indent,eol,start

set number
set relativenumber
set numberwidth=2

set scrolloff=3

set laststatus=2

" Disable modeline
set nomodeline

" If run in a terminal, set the terminal title.
set title

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

set mouse=a

set nocursorline
set nocursorcolumn

" Fuck off Octal interfering with dates like 2001/05/02 when Ctrl+A/X
set nrformats-=octal

let mapleader=" "
let g:mapleader = " "
let maplocalleader= "\\"
let g:maplocalleader= "\\"

" When available switch to open buffers in current and different tabs
set switchbuf=useopen,usetab

set conceallevel=0

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

" Matchit (old) {
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
" }

nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Make Y consistent with C and D. See :help Y.
nnoremap Y y$

" Make . work with a visual selection
vnoremap . :normal .<cr>

" Invisible char settings (list)
set listchars=tab:»\ ,trail:·,extends:…,precedes:…,nbsp:&,eol:¬

" Spell stuff
set spelllang=en
set spellfile=$HOME/Dropbox/data/vim/spell/custom.utf-8.add

" Separators and fillchar
set fillchars=vert:│,fold:─,diff:━,stlnc:-

" }

" Font and colorscheme {

if has("gui_running")

  " Linux font
  if IsLinux()
    set gfn=DejaVu\ Sans\ Mono\ 14
    set linespace=2
  endif

  " Mac font
  if IsMac()
    " set gfn=Fira\ Mono\ OT:h15
    " set gfn=PragmataPro:h17
    " set linespace=4
    " set gfn=M+\ 1m\ light:h16
    " set gfn=Onuava:h16
    " set gfn=Inconsolata:h23
    " set gfn=Monaco:h20
    " set gfn=Edlo:h18
    " set gfn=Monosten\ A:h18
    " set linespace=6

    set gfn=Menlo:h20
    set linespace=4
  endif
  " Akkurat-Mono\ 13

  " set linespace=2

  " Gui options
  set guioptions=c
  set guioptions-=T

  set background=dark
  " colorscheme gruvbox
  " colorscheme ir_black
  colorscheme jellybeans
  " colorscheme monochrome
  " colorscheme lucius
  " LuciusBlackLowContrast
  " set background=dark
  " colorscheme hemisu
else

  " set background=dark

  " Black bg:
  " colorscheme lucius
  " LuciusBlackHighContrast
  " colorscheme ir_black
  "
  " Dark bg: (slow)
  colorscheme jellybeans
  " colorscheme badwolf
  "
  " Light bg:
  " set background=light
  " colorscheme hemisu
  " colorscheme flatui
  "

endif

" set t_Co=256

" XXX: This is not respected as it should
hi Conceal guibg=black guifg=#ff8888 ctermbg=black ctermfg=darkred

" }

" Statusline {

"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P

set statusline=
set statusline +=%3*\ %n\ %*  " buffer number
" set statusline +=%5*%{&ff}%*  " file format
set statusline +=\ \ %<%f\ \ %* " full path
set statusline +=%4*%m%*        " modified flag
set statusline +=%3*\ %y\ %*    " file type
set statusline +=%3*%=%*        " align right
set statusline +=%5*%4c\ %*     " column number
set statusline +=%2*%5l%*       " current line
set statusline +=%2*/%L\ \ %*   " total lines
set statusline +=%5*\ %P\       " percentage of file

" }

" Autocommands {
if has('autocmd')
  " settings immediately take effect
  augroup instantsettings " {
    au!
    au BufWritePost $MYVIMRC :source $MYVIMRC

    if !IsUnix()
      au BufWritePost ~/vimfiles/.vimrc :source $MYVIMRC
    else
      au BufWritePost /Users/jkn/Develop/projects/conf/.vim/.vimrc :source $MYVIMRC
    endif
  augroup END " }

  augroup writeonfocus " {
    au!
    " Autosave when focus is lost
    au FocusLost * :silent! wall
  augroup END " }

  augroup rememberlastcursorpos " {
    au!
    au BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g`\"zvzz"                        |
          \ endif
  augroup END " }

  augroup autoclose_popups " {
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  augroup END " }
endif
" }

" Vim mappings {

" Settings editing {
if IsUnix()
    nnoremap <leader>ev :e $MYVIMRC<cr>
    nnoremap <leader>et :e ~/Dropbox/data/tasks/tasks.wofl<cr>:lcd %:h<cr>
    nnoremap <leader>ew :e ~/Dropbox/data/wiki/<cr>:lcd %:h<cr>
else
    nnoremap <leader>ev :e ~\vimfiles\.vimrc<cr>
    nnoremap <leader>et :e D:\devel\Dropbox\data\tasks\tasks.wofl<cr>:lcd %:h<cr>
    nnoremap <leader>ew :e D:\devel\Dropbox\data\wiki\<cr>:lcd %:h<cr>
endif
" }

" Fast saving & quitting {
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
" }

" Easier completion {
inoremap <c-@> <C-X><C-U>
" }

" Manipulate windows {
nnoremap <C-W><C-F>     <C-W>_:vertical resize<cr>
nnoremap <C-W><C-E>     <C-W>=
nnoremap <C-W><Down>    <C-W>10+
nnoremap <C-W><C-Down>  <C-W>10+
nnoremap <C-W><Up>      <C-W>10-
nnoremap <C-W><C-Up>    <C-W>10-
nnoremap <C-W><Left>    <C-W>20<
nnoremap <C-W><C-Right> <C-W>20>
nnoremap <C-W><Right>   <C-W>20>
nnoremap <C-W><C-Left>  <C-W>20<

nnoremap <leader>ot :tabe<cr>
nnoremap <leader>os :sp<cr>:enew<cr>
nnoremap <leader>ov :vsp<cr>:enew<cr>
" }

" Move lines of code {
" with arrows in all modes
nnoremap <Down>  :m+<CR>==
nnoremap <Up>    :m-2<CR>==
nnoremap <Left>  <<
nnoremap <Right> >>
inoremap <Down>  <Esc>:m+<CR>==gi
inoremap <Up>    <Esc>:m-2<CR>==gi
inoremap <Left>  <Esc><<`]a
inoremap <Right> <Esc>>>`]a
vnoremap <Down>  :m'>+<CR>gv=gv
vnoremap <Up>    :m-2<CR>gv=gv
vnoremap <Left>  <gv
vnoremap <Right> >gv
vnoremap < <gv
vnoremap > >gv
" }

" Toggling settings {

" Map to set local path to file current path
nnoremap cop :lcd %:p:h<CR>:pwd<CR>

" Toggle line number mode
nnoremap con :call g:ToggleNuMode()<cr>

" Toggle conceal
nnoremap coC :call g:ToggleConceal(1)<cr>

" }

" Common editing stuff {
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>d "+d
vnoremap <leader>d "+d
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
" }

" Quick fix and location window mappings {
nnoremap <leader>eq :copen<cr>
nnoremap <leader>el :lopen<cr>

" Make preview window closing also close location and quickfix windows
nnoremap <silent> <C-W>z :wincmd z<Bar>cclose<Bar>lclose<CR>
" }

" Highlight Group(s) {
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }

" Panic Button {
nnoremap <f9> mzggg?G`z
" }

" Formatting {
nnoremap Q gqip
vnoremap Q gq
" }

" Sudo to write {
cnoremap w!! w !sudo tee % >/dev/null
" }

" Center screen when moving {
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zzzv
nnoremap g, g,zzzv
nnoremap <c-o> <c-o>zzzv
nnoremap <c-i> <c-i>zzzv
" }

" Line-wise movements {
" Easier to type
noremap H ^
noremap L $
vnoremap L g_
" Mantain
noremap gH H
noremap gL L
" }

" gI {
" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.
" }

" Toggle "keep current line in the center of the screen" mode {
nnoremap <leader>c :let &scrolloff=999-&scrolloff<cr>
" }

" Normal mode */# remap {
nnoremap * *Nzzzv
nnoremap # #Nzzzv
" }

" Visual Mode */# from Scrooloose {
vnoremap * :<C-u>call g:VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call g:VSetSearch()<CR>??<CR><c-o>
" }

" Folds {

set nofoldenable
set foldlevelstart=1
set foldmarker={,}

" Space to toggle folds.
nnoremap z<space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" }

" "Focus" the current line {
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap z<cr> mzzMzvzz3<c-e>`z:Pulse<cr>
" }

" netrw {
let g:netrw_liststyle = 1
noremap <F1> :e.<CR>
noremap <leader>n :e.<CR>
noremap <leader>N :e %:h<CR>
" }

" Command line maps {

cnoremap <expr>%% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" }

" Substitute shortcut {

nnoremap <leader>r :%s/
xnoremap <leader>r :s/

" }

" Colon and Semi-colon mappings {
" Easier : reach, and saner ; map
" Now, ; goes avanti with f/F t/T and <shift-;> goes backwards
" Also command line goes to , which is better than <shift-;>
nnoremap , :
xnoremap , :
nnoremap : ,
xnoremap : ,
" }

" Easy filetype changing {
nnoremap coft :set filetype=txt<cr>
nnoremap cofj :set filetype=javascript<cr>
nnoremap cofm :set filetype=markdown<cr>
nnoremap cofw :set filetype=workflowish<cr>
nnoremap cofv :set filetype=vim<cr>
nnoremap cofc :set filetype=clojure<cr>
nnoremap coff :set filetype=
" }

" Moving back and forth between lines of same or lower indentation {

nnoremap  <silent> <c-k> :call      NextIndent(0, 0, 0 )<CR>_
nnoremap  <silent> <c-j> :call      NextIndent(0, 1, 0 )<CR>_
nnoremap  <silent> <c-h> :call      NextIndent(0, 0, -1)<CR>_
nnoremap  <silent> <c-l> :call      NextIndent(0, 1, 1 )<CR>_
"nnoremap <silent> <c-L> :call      NextIndent(0, 0, 1 )<CR>_
"nnoremap <silent> <c-H> :call      NextIndent(0, 1, -1)<CR>_
vnoremap  <silent> <c-k> <Esc>:call NextIndent(0, 0, 0 )<CR>m'gv''
vnoremap  <silent> <c-j> <Esc>:call NextIndent(0, 1, 0 )<CR>m'gv''
vnoremap  <silent> <c-h> <Esc>:call NextIndent(0, 0, -1)<CR>m'gv''
vnoremap  <silent> <c-l> <Esc>:call NextIndent(0, 1, 1 )<CR>m'gv''
"vnoremap <silent> <c-L> <Esc>:call NextIndent(0, 0, 1 )<CR>m'gv''
"vnoremap <silent> <c-H> <Esc>:call NextIndent(0, 1, -1)<CR>m'gv''
onoremap <silent> <c-k> :<c-u>normal V<c-v><c-k><cr>
onoremap <silent> <c-j> :<c-u>normal V<c-v><c-j><cr>
onoremap <silent> <c-h> :<c-u>normal V<c-v><c-h>j<cr>
onoremap <silent> <c-l> :<c-u>normal V<c-v><c-l>k<cr>
"onoremap <silent> <c-L> _:call     NextIndent(0, 0, 1 )<CR>_
"onoremap <silent> <c-H> $:call     NextIndent(0, 1, -1)<CR>$

" }

" Highlight Word {
nnoremap <silent> <leader>1 :call g:HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call g:HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call g:HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call g:HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call g:HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call g:HiInterestingWord(6)<cr>
nnoremap <silent> <leader>7 :call g:HiInterestingWord(7)<cr>
nnoremap <silent> <leader>8 :call g:HiInterestingWord(8)<cr>
nnoremap <silent> <leader>9 :call g:HiInterestingWord(9)<cr>
" }

" Remove trailing whitespace {
nnoremap <leader>i<space> :%s/\s\+$<cr>
" }

" Substitute word with first spell suggestion {
nnoremap <leader>is z=1<CR><CR>
" }

" Map search to very magic {
nnoremap / /\v
nnoremap ? ?\v
" }

" }

" Plugin settings & mappings {

" Ultisnips {
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
" }

" CtrlP {

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$|^node_modules$|^target$',
\ 'file': '\.exe$\|\.so$\|\.dll|\.swp$',
\ 'link': '',
\ }
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<CR>

" }

" Tabularize stuff {
noremap <leader>at       :Tabularize /
noremap <leader>aa       :Tabularize /
noremap <leader>a\|       :Tabularize /\|<cr>
noremap <leader>a:       :Tabularize colon<cr>
noremap <leader>a<space> :Tabularize spaces<cr>
noremap <leader>a=       :Tabularize assignment<cr>
noremap <leader>acss     :Tabularize inline_css<cr>

" }

" Scratch {
nnoremap <leader>es :enew<cr>
" }

" Ag {
nnoremap <leader>/ :Ag 
command! TODO execute "Ag TODO"
command! FIX execute "Ag \"FIX|XXX|HACK|OPTIMIZE\""
" }

" Ack commands abbr {
" nnoremap <leader>/ :Ack 
" command! TODO execute "Ack TODO"
" command! FIX execute "Ack \"FIX|XXX|HACK|OPTIMIZE\""
" }

" Multiplecursors (terryma) {
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
" }

" Slime {
let g:slime_target = "tmux"
" let g:slime_no_mappings = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
nmap <c-c> <Plug>SlimeMotionSend
imap <c-c><c-c> 
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
" let g:rbpt_colorpairs = [
"   \ ['104', '#887FD5'],
"   \ ['75', '#70BFFF'],
"   \ ['86', '#55F1E1'],
"   \ ['83', '#63EB63'],
"   \ ['227', '#EFEF66'],
"   \ ['215', '#FFBB44'],
"   \ ['213', '#EB77EC'],
"   \ ['104', '#887FD5'],
"   \ ['75', '#70BFFF'],
"   \ ['86', '#55F1E1'],
"   \ ['83', '#63EB63'],
"   \ ['227', '#EFEF66'],
"   \ ['215', '#FFBB44'],
"   \ ['213', '#EB77EC'],
"   \ ['104', '#887FD5'],
"   \ ['75', '#70BFFF'],
"   \ ]
" }

" Airline {
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '' " ▶
let g:airline_right_sep = '' " ◀
let g:airline_branch_prefix = '' " ⎇  ±

if exists('g:loaded_airline')
  AirlineRefresh
endif
" }

" Signify {
" let g:signify_vcs_list = [ 'git' ]
" let g:signify_sign_overwrite = 0
" }

" Startify {
" let g:startify_custom_header =
"   \ map(split(system('fortune | cowsay -f tux -W 76'), '\n'), '"   ". v:val') + ['','']
" }

" Syntastic {
" let g:syntastic_check_on_open=1
" }

" Emmet {
let g:user_emmet_leader_key = '<F3>'
" }

" Neocomplete {
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#disable_auto_complete = 1
" }

" Better whitespace {
highlight ExtraWhitespace ctermbg = 52 guibg = #550000
" }

" Gist {
if IsMac()
  let g:gist_clip_command = 'pbcopy'
endif
if IsLinux()
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" }

" Fugitive {
nnoremap <leader>gg :Git 
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gm :Gmove 
" }

" Goyo {
nnoremap <C-W><C-G> :Goyo<cr>
nnoremap <C-W>g     :Goyo<cr>
" }

" }

" Abbreviations {

iabbrev @@    joaquin@chimeces.com
iabbrev wweb  http://chimeces.com
iabbrev ssig  <cr>Joaquin Oltra<cr>joaquin@chimeces.com<cr>

iabbrev alice1 Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, `and what is the use of a book,' thought Alice `without pictures or conversation?'<cr>
iabbrev alice2 So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her.<cr>
iabbrev alice3 There was nothing so very remarkable in that; nor did Alice think it so very much out of the way to hear the Rabbit say to itself, `Oh dear! Oh dear! I shall be late!' (when she thought it over afterwards, it occurred to her that she ought to have wondered at this, but at the time it all seemed quite natural); but when the Rabbit actually took a watch out of its waistcoat-pocket, and looked at it, and then hurried on, Alice started to her feet, for it flashed across her mind that she had never before seen a rabbit with either a waistcoat-pocket, or a watch to take out of it, and burning with curiosity, she ran across the field after it, and fortunately was just in time to see it pop down a large rabbit-hole under the hedge.<cr>
iabbrev alice4 In another moment down went Alice after it, never once considering how in the world she was to get out again.<cr><cr>The rabbit-hole went straight on like a tunnel for some way, and then dipped suddenly down, so suddenly that Alice had not a moment to think about stopping herself before she found herself falling down a very deep well.<cr>
iabbrev alice5 Either the well was very deep, or she fell very slowly, for she had plenty of time as she went down to look about her and to wonder what was going to happen next. First, she tried to look down and make out what she was coming to, but it was too dark to see anything; then she looked at the sides of the well, and noticed that they were filled with cupboards and book-shelves; here and there she saw maps and pictures hung upon pegs. She took down a jar from one of the shelves as she passed; it was labelled `ORANGE MARMALADE', but to her great disappointment it was empty: she did not like to drop the jar for fear of killing somebody, so managed to put it into one of the cupboards as she fell past it.<cr>
iabbrev alice6 <cr>There was a table set out under a tree in front of the house, and the March Hare and the Hatter were having tea at it: a Dormouse was sitting between them, fast asleep, and the other two were using it as a cushion, resting their elbows on it, and talking over its head. `Very uncomfortable for the Dormouse,' thought Alice; `only, as it's asleep, I suppose it doesn't mind.'<cr><cr>The table was a large one, but the three were all crowded together at one corner of it: `No room! No room!' they cried out when they saw Alice coming. `There's plenty of room!' said Alice indignantly, and she sat down in a large arm-chair at one end of the table.<cr>
iabbrev alice7 <cr>The Hatter was the first to break the silence. `What day of the month is it?' he said, turning to Alice: he had taken his watch out of his pocket, and was looking at it uneasily, shaking it every now and then, and holding it to his ear.<cr><cr>Alice considered a little, and then said `The fourth.'<cr><cr>`Two days wrong!' sighed the Hatter. `I told you butter wouldn't suit the works!' he added looking angrily at the March Hare.<cr><cr>`It was the best butter,' the March Hare meekly replied.<cr><cr>`Yes, but some crumbs must have got in as well,' the Hatter grumbled: `you shouldn't have put it in with the bread-knife.'<cr><cr>The March Hare took the watch and looked at it gloomily: then he dipped it into his cup of tea, and looked at it again: but he could think of nothing better to say than his first remark, `It was the best butter, you know.'<cr>

" }

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
set path=**

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=target/                          " Clojure

" }

" CSS {
set suffixesadd+=.css,.styl,.less,.sass,.scss
" }

" Javascript {
set suffixesadd+=.js,.json,.coffee,.litcoffee,.ls,.hbs,.jst,.underscore,.jade,.hbs

" Bundle 'othree/javascript-libraries-syntax.vim'
let g:javascript_conceal=1
command! -range=% JSBeautifyJSON <line1>,<line2>!js-beautify -f - -b expand
command! -range=% JSBeautify <line1>,<line2>!js-beautify -f -
" }

" Clojure {
set wildignore+=.class,classes
set suffixesadd+=.clj,.cljs
" }

"}

" Per project settings {
if has('autocmd')
  " Example of project settings.
  " augroup project_settings
  "   au!
  "   if !IsUnix()
  "     au BufNewFile,BufRead d:/devel/projects/fsp/* setlocal softtabstop=4 shiftwidth=4 tabstop=4
  "   endif
  " augroup END
endif
" }


