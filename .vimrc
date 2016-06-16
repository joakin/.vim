" OS detection vars {
let g:isMac = 0
if has('macunix')
  let g:isMac = 1
endif
let g:isLinux = !isMac
" }

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
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
" Auto autocomplete popup
if has('lua')
  " Plug 'Shougo/neocomplete.vim'
endif
" Highlight groups manipulation
Plug 'wincent/pinnacle'

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
Plug 'leshill/vim-json'
Plug 'digitaltoad/vim-jade'
Plug 'nono/vim-handlebars'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kchmck/vim-coffee-script'
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
Plug 'scrooloose/syntastic'
" Git commands
Plug 'tpope/vim-fugitive'
" Unix commands (Remove, Move, Chmod, Mkdir, Find, Locate, Wall, SudoWrite, SudoEdit)
Plug 'tpope/vim-eunuch'
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
" }

call plug#end()

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
set nonumber
set norelativenumber
set numberwidth=2
set synmaxcol=800 " Don't try to highlight lines longer than
set mouse=a
let mapleader=" "
let maplocalleader= "\\"
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
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" Make Y consistent with C and D. See :help Y.
nnoremap Y y$
" Make . work with a visual selection
vnoremap . :normal .<cr>
" Invisible char settings (list)
set listchars=tab:»\ ,trail:·,extends:…,precedes:…,nbsp:&,eol:¬
" Spell stuff
set spellfile=$HOME/.vim/spell/custom.utf-8.add

" Separators and fillchar
set fillchars=vert:│,fold:─,diff:━,stlnc:-
" Use the system clipboard by default
set clipboard=unnamed,unnamedplus
" }

" Font and colorscheme {
if has("gui_running")
  if isLinux
    set gfn=monospace\ 14
    set linespace=2
  elseif isMac
    set gfn=Courier\ Prime\ Source:h16
    set linespace=6
  endif

  " Gui options
  set guioptions=c
  set guioptions-=T

  " colorscheme jellybeans
  " colorscheme hemisu
  set background=light
  colorscheme PaperColor
else
  " colorscheme lucius
  " LuciusBlackLowContrast
  " LuciusWhite
  " colorscheme jkn-monochrome
  " set background=dark
  " colorscheme solarized
  " colorscheme gruvbox
  " colorscheme jellybeans
  " colorscheme badwolf
  " set background=light
  " set background=dark
  " colorscheme hemisu
  " set background=light
  " colorscheme PaperColor
  " colorscheme solarized
  " colorscheme nofrils-dark
  " colorscheme nofrils-sepia
  " colorscheme nofrils-light


  " set background=dark
  " let g:base16colorspace=256  " Access colors present in 256 colorspace
  " colorscheme base16-default
endif

" }

" Statusline {
" set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P

" set statusline=
" set statusline +=%3*\ %n\ %*  " buffer number
" set statusline +=\ \ %<%f\ \ %* " full path
" set statusline +=%4*%m%*        " modified flag
" set statusline +=%3*\ %y\ %*    " file type
" set statusline +=%3*%=%*        " align right
" set statusline +=%5*%4c\ %*     " column number
" set statusline +=%2*%5l%*       " current line
" set statusline +=%2*/%L\ \ %*   " total lines
" set statusline +=%5*\ %P\       " percentage of file
" }

" Autocommands {
if has('autocmd')
  " settings immediately take effect
  augroup instantsettings " {
    au!
    au BufWritePost $MYVIMRC :source $MYVIMRC
    au BufWritePost ~/.vim/.vimrc :source $MYVIMRC
    au BufWritePost ~/.nvim/.nvimrc :source $MYVIMRC
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
  augroup checktime_on_focus " {
    au WinEnter,FocusGained,BufEnter * :checktime
  augroup END " }
  augroup md_files_are_markdown " {
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
  augroup END " }
endif
" }

" Vim mappings {

" Opening stuff (files, windows, etc) {
" Files:
nnoremap <leader>v :e $MYVIMRC<cr>:FollowSymlink<cr>
" Windows/buffers:
nnoremap <leader>ot :tabe<cr>
nnoremap <leader>ov :vsp<cr>
nnoremap <leader>os :sp<cr>
nnoremap <leader>oq :copen<cr>
nnoremap <leader>ol :lopen<cr>
nnoremap <leader>on :enew<cr>
" }

" Fast saving & quitting {
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>u :bd<cr>
" }

" Easier omnicompletion {
inoremap <c-@> <C-X><C-O>
" }

" Manipulate windows {
nnoremap <C-W><C-F> <C-W>_:vertical resize<cr>
nnoremap <C-W><C-E> <C-W>=
nnoremap <C-W>+     <C-W>10+
nnoremap <C-W>-     <C-W>10-
nnoremap <C-W><     <C-W>20<
nnoremap <C-W>>     <C-W>20>
" }

" Toggling settings (to complete unimpaired) {
nnoremap cop :lcd %:p:h<CR>:pwd<CR>
nnoremap coN :call g:ToggleNuMode()<cr>
nnoremap coC :call g:ToggleConceal(1)<cr>
" Toggle "keep current line in the center of the screen" mode
nnoremap coS :let &scrolloff=999-&scrolloff<cr>
" }

" Formatting {
nnoremap Q gqip
vnoremap Q gq
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
noremap H ^
noremap L $
vnoremap L g_
noremap gH H
noremap gL L
" }

" gI {
" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.
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
nnoremap zO zczO
" }

" "Focus" the current line {
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
nnoremap z<cr> mzzMzvzz1<c-e>`z:Pulse<cr>
" }

" netrw {
let g:netrw_liststyle = 1
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
nnoremap cofv :set filetype=vim<cr>
nnoremap cofc :set filetype=clojure<cr>
nnoremap coff :set filetype=
nnoremap cof :set filetype=
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
if exists("*HiDefineColors")
  call g:HiDefineColors()
endif
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

" Map search to very magic by default {
nnoremap / /\v
nnoremap ? ?\v
" }

" CTRL+SHIFT+6 to something easier {
nnoremap <leader>n <c-^>
" }

" Insert mode {
" }

" }

" Commands {
" Resolve symlink (useful for fugitive) {
command! FollowSymlink :exec "file ". resolve(expand('%:p')) | e
" }
" Highlight Group(s) {
command! SyntaxInfo :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }
" }

" Plugin settings & mappings {

" Neocomplete {
if has('lua')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplcache_force_overwrite_completefunc = 1
endif
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
nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap <leader>t :CtrlPTag<CR>
" }

" Tabularize stuff {
noremap <leader>at       :Tabularize /
noremap <leader>aa       :Tabularize /
noremap <leader>af       :Tabularize /^.\{-}\zs
noremap <leader>al       :Tabularize /^.*\zs
noremap <leader>a\|      :Tabularize /\|<cr>
noremap <leader>a:       :Tabularize colon<cr>
noremap <leader>a<space> :Tabularize spaces<cr>
noremap <leader>a=       :Tabularize assignment<cr>
noremap <leader>acss     :Tabularize inline_css<cr>
" }

" Ag {
nnoremap gS :Ag -Q ''<left>
nnoremap gs :Ag<cr>
xnoremap gs y:Ag -Q '"'<CR>
command! TODO execute "Ag TODO"
command! FIX execute "Ag \"FIX|XXX|HACK|OPTIMIZE\""
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
" }

" Startify {
" let g:startify_custom_header =
"   \ map(split(system('fortune | cowsay -f tux -W 76'), '\n'), '"   ". v:val') + ['','']
" }

" Syntastic {
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['standard']
" }

" Better whitespace {
highlight ExtraWhitespace ctermbg=52 guibg=#550000
" }

" Gist {
if isMac
  let g:gist_clip_command = 'pbcopy'
elseif isLinux
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

command! -nargs=? -range=% GistAnon <line1>,<line2>Gist -a <f-args>
" }

" Fugitive {
nnoremap <leader>gg :Git 
nnoremap <leader>ga :Git add -p<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit --verbose<cr>
nnoremap <leader>gl :Glog -- <cr>
nnoremap <leader>gdd :Gvdiff<cr>
nnoremap <leader>gdl :Gvdiff HEAD^1<cr>
nnoremap <leader>gm :Gmove 
nnoremap <leader>gp :Git pp<cr>
" }

" Goyo {
nnoremap <C-W><C-G> :Goyo<cr>
nnoremap <C-W>g     :Goyo<cr>
nnoremap <leader>G     :Goyo<cr>
let g:goyo_width=90
let g:goyo_margin_top=1
let g:goyo_margin_bottom=1
" }

" Sneak {
"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" : map (what was , before)
map : <Plug>SneakPrevious
" }

" rsi {
" Breaks macros on the terminal
let g:rsi_no_meta = 1
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


