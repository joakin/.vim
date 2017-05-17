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

" Ale {
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
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

" Mappings {

" Vim {

" TODO: ???
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Make Y consistent with C and D. See :help Y.
nnoremap Y y$

" Make . work with a visual selection
vnoremap . :normal .<cr>

" Easier omnicompletion
inoremap <c-@> <C-X><C-O>

" Manipulate windows
nnoremap <C-W><C-F> <C-W>_:vertical resize<cr>
nnoremap <C-W><C-E> <C-W>=
nnoremap <C-W>+     <C-W>10+
nnoremap <C-W>-     <C-W>10-
nnoremap <C-W><     <C-W>20<
nnoremap <C-W>>     <C-W>20>

" Toggling settings (to complete unimpaired)
nnoremap cop :lcd %:p:h<CR>:pwd<CR>
nnoremap coN :call mappings#ToggleNuMode()<cr>
nnoremap con :call mappings#ToggleNuMode()<cr>
nnoremap coC :call mappings#ToggleConceal(1)<cr>
" Toggle "keep current line in the center of the screen" mode
nnoremap coS :let &scrolloff=999-&scrolloff<cr>

" Formatting
nnoremap Q gqip
vnoremap Q gq

" Center screen when moving
nnoremap n nzzzv
nnoremap N Nzzzv
" Same when jumping around
nnoremap g; g;zzzv
nnoremap g, g,zzzv
nnoremap <c-o> <c-o>zzzv
nnoremap <c-i> <c-i>zzzv

" Line-wise movements
noremap H ^
noremap L $
vnoremap L g_
noremap gH H
noremap gL L

" gI
" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Normal mode */# remap
nnoremap * *Nzzzv
nnoremap # #Nzzzv

" Visual Mode */# from Scrooloose
vnoremap * :<C-u>call mappings#VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call mappings#VSetSearch()<CR>??<CR><c-o>

" Folds
" Space to toggle folds.
nnoremap z<space> za
nnoremap zO zczO

" "Focus" the current line
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
nnoremap z<cr> mzzMzvzczOzz1<c-e>`z:Pulse<cr>

" Command line maps
cnoremap <expr>%% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" Colon and Semi-colon mappings
" Easier : reach, and saner ; map
" Now, ; goes avanti with f/F t/T and <shift-;> goes backwards
" Also command line goes to , which is better than <shift-;>
nnoremap , :
xnoremap , :
nnoremap : ,
xnoremap : ,

" Easy filetype changing
nnoremap coft :set filetype=txt<cr>
nnoremap cofj :set filetype=javascript<cr>
nnoremap cofm :set filetype=markdown<cr>
nnoremap cofv :set filetype=vim<cr>
nnoremap cofc :set filetype=clojure<cr>
nnoremap coff :set filetype=
nnoremap cof :set filetype=

" Moving back and forth between lines of same or lower indentation
nnoremap  <silent> <c-k> :call      mappings#NextIndent(0, 0, 0 )<CR>_
nnoremap  <silent> <c-j> :call      mappings#NextIndent(0, 1, 0 )<CR>_
nnoremap  <silent> <c-h> :call      mappings#NextIndent(0, 0, -1)<CR>_
nnoremap  <silent> <c-l> :call      mappings#NextIndent(0, 1, 1 )<CR>_
"nnoremap <silent> <c-L> :call      mappings#NextIndent(0, 0, 1 )<CR>_
"nnoremap <silent> <c-H> :call      mappings#NextIndent(0, 1, -1)<CR>_
vnoremap  <silent> <c-k> <Esc>:call mappings#NextIndent(0, 0, 0 )<CR>m'gv''
vnoremap  <silent> <c-j> <Esc>:call mappings#NextIndent(0, 1, 0 )<CR>m'gv''
vnoremap  <silent> <c-h> <Esc>:call mappings#NextIndent(0, 0, -1)<CR>m'gv''
vnoremap  <silent> <c-l> <Esc>:call mappings#NextIndent(0, 1, 1 )<CR>m'gv''
"vnoremap <silent> <c-L> <Esc>:call mappings#NextIndent(0, 0, 1 )<CR>m'gv''
"vnoremap <silent> <c-H> <Esc>:call mappings#NextIndent(0, 1, -1)<CR>m'gv''
onoremap <silent> <c-k> :<c-u>normal V<c-v><c-k><cr>
onoremap <silent> <c-j> :<c-u>normal V<c-v><c-j><cr>
onoremap <silent> <c-h> :<c-u>normal V<c-v><c-h>j<cr>
onoremap <silent> <c-l> :<c-u>normal V<c-v><c-l>k<cr>
"onoremap <silent> <c-L> _:call     mappings#NextIndent(0, 0, 1 )<CR>_
"onoremap <silent> <c-H> $:call     mappings#NextIndent(0, 1, -1)<CR>$

" Highlight Word {
function! g:Interestingwords_update_highlight () " {
  hi! def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
  hi! def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
  hi! def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#00afff ctermbg=39
  hi! def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
  hi! def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
  hi! def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#df0000 ctermbg=160
  hi! def InterestingWord7 guifg=#000000 ctermfg=16 guibg=#df5fff ctermbg=171
  hi! def InterestingWord8 guifg=#000000 ctermfg=16 guibg=#c0c0c0 ctermbg=7
  hi! def InterestingWord9 guifg=#000000 ctermfg=16 guibg=#00ffff ctermbg=14
endfunction " }
call g:Interestingwords_update_highlight()
if has('autocmd')
  augroup InterestingWords
    autocmd!
    autocmd ColorScheme * call g:Interestingwords_update_highlight()
  augroup END
endif
nnoremap <silent> <leader>1 :call mappings#HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call mappings#HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call mappings#HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call mappings#HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call mappings#HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call mappings#HiInterestingWord(6)<cr>
nnoremap <silent> <leader>7 :call mappings#HiInterestingWord(7)<cr>
nnoremap <silent> <leader>8 :call mappings#HiInterestingWord(8)<cr>
nnoremap <silent> <leader>9 :call mappings#HiInterestingWord(9)<cr>
" }

" Map search to very magic by default
nnoremap / /\v
nnoremap ? ?\v

" CTRL+SHIFT+6 to something easier
nnoremap <leader>n <c-^>

if has('nvim')
  " Terminal settings {
  tnoremap <ESC> <C-\><C-n>
  " }
endif

" }

" Leader {

" Substitute shortcut
nnoremap <leader>r :%s/
xnoremap <leader>r :s/

" Opening stuff (files, windows, etc)
" Files:
nnoremap <leader>v :e $MYVIMRC<cr>:FollowSymlink<cr>
" Windows/buffers:
nnoremap <leader>ot :tabe<cr>
nnoremap <leader>ov :vsp<cr>
nnoremap <leader>os :sp<cr>
nnoremap <leader>oq :copen<cr>
nnoremap <leader>ol :lopen<cr>
nnoremap <leader>on :enew<cr>

" Fast saving & quitting
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>u :bd<cr>

" }

" }

" Commands {

command! -register CopyMatches call commands#CopyMatches(<q-reg>)

command! -nargs=0 Pulse call commands#Pulse()

command! -nargs=0 -bar Qargs execute 'args ' . commands#QuickfixFilenames()

command! FollowSymlink :exec "file ". resolve(expand('%:p')) | e

command! SyntaxInfo :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" }

" Statusline {

" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
if has('statusline')
  set statusline=
  set statusline+=%3*    " Switch to User3 highlight group.
  set statusline+=\      " Space
  set statusline+=%n     " Buffer number
  set statusline+=\      " Space
  set statusline+=%*     " Reset highlight group.

  set statusline+=%4*    " Switch to User4 highlight group.
  set statusline+=\      " Space
  set statusline+=%<     " Truncation point, if not enough space
  set statusline+=%{statusline#fileprefix()} " File path
  set statusline+=%*     " Reset highlight group.
  set statusline+=%3*    " Switch to User3 highlight group (bold).
  set statusline+=\      " Space
  set statusline+=%t     " Filename.
  set statusline+=\      " Space
  set statusline+=%*     " Reset highlight group.

  set statusline+=%4*    " Switch to User4 highlight group.
  set statusline+=\      " Space
  " Needs to be all on one line:
  "   %(                   Start item group.
  "   [                    Left bracket (literal).
  "   %M                   Modified flag: ,+/,- (modified/unmodifiable) or nothing.
  "   %R                   Read-only flag: ,RO or nothing.
  "   %{statusline#ft()}   Filetype (not using %Y because I don't want caps).
  "   %{statusline#fenc()} File-encoding if not UTF-8.
  "   ]                    Right bracket (literal).
  "   %)                   End item group.
  set statusline+=%(%M%R%{statusline#ft()}%{statusline#fenc()}%)
  set statusline+=\      " Space
  set statusline+=%*     " Reset highlight group.

  set statusline+=%=     " Align right

  set statusline+=%4*    " Switch to User4 highlight group.
  set statusline+=\      " Space
  set statusline+=%l:%c/%L " Current line:Column number/total lines
  set statusline+=\      " Space
  set statusline+=%*     " Reset highlight group.

  set statusline+=%3*    " Switch to User3 highlight group.
  set statusline+=\      " Space
  set statusline+=%p     " Percentage through buffer.
  set statusline+=%%     " Literal %.
  set statusline+=%*     " Reset highlight group.

  if has('autocmd')
    augroup Statusline
      autocmd!
      autocmd ColorScheme * call statusline#update_highlight()
    augroup END
  endif
endif

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

iabbrev funciton function
iabbrev funcitons functions
" }

" Autocommands {
if has('autocmd')

  augroup joakin_autocommands

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

    " Make current window more obvious by turning off/adjusting some features
    " in non-current windows.
    if exists('+colorcolumn')
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * if autocmds#should_colorcolumn() | let &l:colorcolumn='+' . join(range(0, 254), ',+') | endif
      autocmd FocusLost,WinLeave * if autocmds#should_colorcolumn() | let &l:colorcolumn=join(range(1, 255), ',') | endif
    endif
    autocmd InsertLeave,VimEnter,WinEnter * if autocmds#should_cursorline() | setlocal cursorline | endif
    autocmd InsertEnter,WinLeave * if autocmds#should_cursorline() | setlocal nocursorline | endif
    if has('statusline')
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * call autocmds#focus_statusline()
      autocmd FocusLost,WinLeave * call autocmds#blur_statusline()
    endif

    autocmd BufEnter,FocusGained,VimEnter,WinEnter * call autocmds#split_resize()

  augroup END

endif
" }

" Project settings {
if has('autocmd')

  " Example of project settings {
  " augroup project_settings
  "   au!
  "   au BufNewFile,BufRead ~/dev/projects/wikimedia/* setlocal softtabstop=4 shiftwidth=4 tabstop=4
  " augroup END
  " }

  " Wikimedia projects {
  if has('autocmd')
    augroup wikimedia_mediawiki_project_settings
      au!
      au BufNewFile,BufRead ~/dev/wikimedia/* call Setup_wikimedia_project()
      " */wikimedia/*
      " autocmd FileType javascript if stridx(expand('%:p'), $HOME . '/dev/wikimedia/') == 0 |
      "     \ let b:syntastic_checkers = ['jshint', 'jscs'] | endif
    augroup END
  endif

  function! Setup_wikimedia_project()
    let g:syntastic_javascript_checkers = ['eslint']
    if &ft =~ "^javascript"
      setlocal tabstop=3
      setlocal noexpandtab
      setlocal shiftwidth=0
      " Disable autoformatting with formatprg
      let b:format_on_save = 0
    endif
  endfunction
  " }

endif
" }
