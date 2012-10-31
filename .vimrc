
" Utility functions ----------------------- {{{

let g:isUnix = 1
if has('win32') || has('win64')
    let g:isUnix = 0
endif
fun! IsUnix()
    return g:isUnix
endfun
" }}}

set nocompatible
set encoding=utf-8

" Vundle -------------- {{{
filetype off                   " required for vundle

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

" Vim improvements
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'michaeljsmith/vim-indent-object'
" Bundle 'vim-scripts/Gundo'
" Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdtree'
Bundle 'matchit.zip'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'
Bundle 'vim-scripts/scratch.vim'

" Programming plugins
" JS
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
" CoffeeScript
Bundle 'kchmck/vim-coffee-script'
" Clojure
Bundle 'vim-scripts/VimClojure'
" HTML
Bundle 'mattn/zencoding-vim'

" Syntax
if IsUnix()
    Bundle 'vim-pandoc/vim-pandoc'
else
    Bundle 'tpope/vim-markdown'
endif
Bundle 'skammer/vim-css-color'
Bundle 'groenewege/vim-less'
Bundle 'itspriddle/vim-jquery'
Bundle 'leshill/vim-json'

" External tools
Bundle 'tpope/vim-fugitive'

" Color schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'cschlueter/vim-wombat'
Bundle 'shawncplus/skittles_berry'
Bundle 'phd'
Bundle 'tomasr/molokai'
Bundle 'endel/vim-github-colorscheme'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'wgibbs/vim-irblack'

" }}}

" Vim general settings ------------ {{{
" Enable filetype plugin
filetype plugin on
filetype indent on

" Gui options
set guioptions=c

" Tab size
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" Create undo files with history
set undofile

set ttyfast

" Wrap text when 80 cols
set nowrap
" set wrap
set textwidth=79
set colorcolumn=80
set formatoptions=tcroqn21

" Make vim think that dash is part of words. i want 'this-stuff' to be a word
set iskeyword+=-

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop

set ignorecase    " Not case sensitive search
set smartcase     " Unless the search contains caps letters
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set gdefault      " Default g flag on substitutions
set showmatch     " Jump to bracket/parens briefly. Does not interrupt editing
set matchtime=1   " Time of the jump of showmatch

set magic "Set magic on, for regular expressions (default?)

set directory=~/.vimswap//
set undodir=~/.vimundo//

" Set to auto read when a file is changed from the outside
set autoread

" Set split directions to something normal
set splitbelow
set splitright

set wildmenu
set wildmode=list:longest

syntax enable "Enable syntax hl

set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start

set number
set relativenumber

set scrolloff=3

set laststatus=2

set cursorline
set cursorcolumn

let mapleader=","
let g:mapleader = ","
let maplocalleader= "\\"
let g:maplocalleader= "\\"
" Make \ behave as default ,
" nnoremap \ ,

" }}}

" Font and colorscheme -------------------- {{{

fun! SetFont()
    " Set font according to system
    if IsUnix()
        " set guifont=DejaVu\ Sans\ Mono:h17
        " set guifont=Akkurat-Mono:h15
        " set linespace=4
        " set guifont=M+\ 1m\ light:h20
        set guifont=Source\ Code\ Pro\ Light:h19
    else
        " set guifont=Monoxil_Regular:h10
        set guifont=Aurulent_Sans_Mono:h10
        " set guifont=Inconsolata-g:h13
        " set guifont=Source_Code_Pro:h10
        " set guifont=Source_Code_Pro_Light:h11
        " set guifont=Dejavu_Sans_Mono:h9
    endif
endfun
call SetFont()
command! SetDefaultFont call SetFont()

if has("gui_running")
  set guioptions-=T
  set t_Co=256

  "set background=dark
  "colorscheme solarized
  colorscheme lucius
  LuciusBlackLowContrast

" LuciusDark (dark default): http://i.imgur.com/LsZbF.png
" LuciusDarkHighContrast: http://i.imgur.com/e70i9.png
" LuciusDarkLowContrast: http://i.imgur.com/Hmw8s.png
" LuciusBlack: http://i.imgur.com/iD4ri.png
" LuciusBlackHighContrast: http://i.imgur.com/lHvTJ.png
" LuciusBlackLowContrast: http://i.imgur.com/oZLkg.png
" LuciusLight (light default): http://i.imgur.com/soYD8.png
" LuciusLightLowContrast: http://i.imgur.com/95I86.png
" LuciusWhite: http://i.imgur.com/wDzkz.png
" LuciusWhiteLowContrast: http://i.imgur.com/jlUf4.png

else
  set t_Co=256
  colorscheme lucius
  LuciusBlackLowContrast
endif

" }}}

" Statusline -------------- {{{

"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
"hi clear StatusLine
"hi clear StatusLineNC
hi StatusLine guifg=#ffffff guibg=#0087AF ctermfg=66
hi StatusLineNC guifg=#ffffff guibg=#585858 ctermfg=8 ctermbg=232

hi User1 guifg=#005F00 guibg=#B5E61D
hi User1 guifg=#ffffff guibg=#0087AF
hi User2 guifg=#ffffff guibg=#585858
hi User3 guifg=#666666 guibg=#000000
hi User4 guifg=#FA8072 guibg=#DC143C
hi User5 guifg=#333333 guibg=#dddddd
set statusline=
set statusline +=%3*\ [%n]\ %*  " buffer number
" set statusline +=%5*%{&ff}%*  " file format
set statusline +=\ \ %<%f\ \ %* " full path
set statusline +=%4*%m%*        " modified flag
set statusline +=%3*\ %y\ %*    " file type
set statusline +=%3*%=%*        " align right
set statusline +=%5*%4c\ %*     " column number
set statusline +=%2*%5l%*       " current line
set statusline +=%2*/%L\ \ %*   " total lines
set statusline +=%5*\ %P\       " percentage of file

" }}}

" Autocommands --------- {{{
if has('autocmd')
    " settings immediately take effect
    augroup instantsettings
        au!
        au BufWritePost $MYVIMRC :source $MYVIMRC

        if !IsUnix()
            au BufWritePost ~/vimfiles/.vimrc :source $MYVIMRC
        else
            au BufWritePost /Users/jkn/Develop/projects/conf/.vim/.vimrc :source $MYVIMRC
        endif
    augroup END

    augroup writeonfocus
        au!
        " Autosave when focus is lost
        au FocusLost * :wa
    augroup END

    augroup rememberlastcursorpos
        au!
        au BufReadPost *
                    \ if line("'\"") > 0 && line ("'\"") <= line("$")   |
                    \   exe "normal! g'\""                              |
                    \ endif
    augroup END

    augroup viml
        au!
        au FileType vim setlocal foldmethod=marker
    augroup END

    augroup php
        au!
        au FileType php setlocal shiftwidth=4
    augroup END

    augroup jst
        au!
        " Syntax for JST
        au BufNewFile,BufRead *.jst set syntax=jst
        au BufNewFile,BufRead *.tpl set syntax=jst
    augroup END

    augroup clojurescript
        au!
        au BufRead,BufNewFile *.cljs setlocal filetype=clojure
    augroup END

    augroup css
        au!
        au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    augroup END

    augroup html_markdown
        au!
        au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    augroup END

    augroup javascript
        au!
        au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    augroup END

    augroup python
        au!
        au FileType python setlocal omnifunc=pythoncomplete#Complete
    augroup END

    augroup xml
        au!
        au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    augroup END

    augroup coffeescript
        au!
        au BufNewFile,BufReadPost *.coffee setlocal shiftwidth=2 expandtab
    augroup END

    augroup txt
        au!
        au FileType txt setlocal formatoptions+=a
    augroup END

    augroup dont_wrap_us
        au!
        au FileType html,php setlocal nowrap
        au FileType html,php setlocal formatoptions-=croqn21
    augroup END
endif
" }}}

" Utilities ---------------------------- {{{

" Font size changing ------------------- {{{

let s:fontIncrements = '1'
function! AdjustFontSize(amount)
  if has("gui_running")

    let &guifont = substitute(
     \ &guifont,
     \ ':h\zs\d\+',
     \ '\=eval(submatch(0)'.a:amount.')',
     \ '')

  else
    echoerr "You need to run gui version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize('+'.s:fontIncrements)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize('-'.s:fontIncrements)
endfunction
command! SmallerFont call SmallerFont()

" }}}

" Toggle line number type --------------------------- {{{

function! g:ToggleNuMode()
    if(&rnu ==? 1)
        set number
    else
        set relativenumber
    endif
endfunc

" }}}

" Moving through indent levels --------- {{{
"
" Jump to the next or previous line that has the same level or a different
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
"                   false: Motion is inclusive
" fwd (bool): true: Go to next line
"             false: Go to previous line
" difflevel (bool): true: Go to line with different indentation level
"                   false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
"                    false: Don't skip blank lines
function! NextIndent(exclusive, fwd, difflevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if (   ( a:difflevel == 0  && indent(line) == indent) ||
         \ ( a:difflevel == 1  && indent(line) > indent)  ||
         \ ( a:difflevel == -1 && indent(line) < indent))
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    else
      if ( a:difflevel == 1  && indent(line) < indent )
          return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> <s-space> :call      NextIndent(0, 0, 0,  1)<CR>_
nnoremap <silent> <space>   :call      NextIndent(0, 1, 0,  1)<CR>_
nnoremap <silent> <s-tab>   :call      NextIndent(0, 0, -1, 1)<CR>_
nnoremap <silent> <tab>     :call      NextIndent(0, 1, 1,  1)<CR>_
nnoremap <silent> <s-cr>    :call      NextIndent(0, 0, 1,  1)<CR>_
nnoremap <silent> <cr>      :call      NextIndent(0, 1, -1, 1)<CR>_
vnoremap <silent> <s-space> <Esc>:call NextIndent(0, 0, 0,  1)<CR>m'gv''
vnoremap <silent> <space>   <Esc>:call NextIndent(0, 1, 0,  1)<CR>m'gv''
vnoremap <silent> <s-tab>   <Esc>:call NextIndent(0, 0, -1, 1)<CR>m'gv''
vnoremap <silent> <tab>     <Esc>:call NextIndent(0, 1, 1,  1)<CR>m'gv''
vnoremap <silent> <s-cr>    <Esc>:call NextIndent(0, 0, 1,  1)<CR>m'gv''
vnoremap <silent> <cr>      <Esc>:call NextIndent(0, 1, -1, 1)<CR>m'gv''
" Comment these since I have IndentObject plugin installed
" onoremap <silent> <s-space> :call      NextIndent(0, 0, 0, 1)<CR>
" onoremap <silent> <space>   :call      NextIndent(0, 1, 0, 1)<CR>
" onoremap <silent> <s-tab>   :call      NextIndent(1, 0, 1, 1)<CR>
" onoremap <silent> <tab>     :call      NextIndent(1, 1, 1, 1)<CR>
" }}}

" Quickfix results to args --------------------------- {{{

function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()

" }}}

" }}}

" Vim mappings -------------------- {{{

" vimrc editing
if IsUnix()
    nnoremap <leader>ev :tabe $MYVIMRC<cr>
else
    nnoremap <leader>ev :tabe ~\vimfiles\.vimrc<cr>
endif

" Fast saving & quitting
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>sq :Bclose<cr>

" Easier omnicompletion
inoremap <C-space> <C-X><C-O>

" Move between splits
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Manipulate windows
nnoremap <leader>sf <C-W>_:vertical resize<cr> 
nnoremap <leader>se <C-W>= 
nnoremap <leader>sj <C-W>10+
nnoremap <leader>sk <C-W>10-
nnoremap <leader>sl <C-W>20>
noremap <leader>sh <C-W>20<

" Move lines of code with Alt+[hjkl] in all modes
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
nnoremap <A-h> <<
nnoremap <A-l> >>
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
inoremap <A-h> <Esc><<`]a
inoremap <A-l> <Esc>>>`]a
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
vnoremap <A-h> <gv
vnoremap <A-l> >gv

" Remap leader+/ to clear search highlights
nnoremap <leader>/ :set hlsearch!<CR>

" Map to set local path to file current path
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Toggle line number mode
nnoremap <leader>el :call g:ToggleNuMode()<cr>

" Toggle background color
nnoremap <leader>eb :let &background = ( &background ==? "dark"? "light" : "dark" )<CR>

" Toggle invisibles
nnoremap <leader>ei :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▶\ ,eol:¬

" Toggle spell checking
nnoremap <leader>es :set spell!<CR>

nnoremap <A-=> :LargerFont<CR>
nnoremap <A--> :SmallerFont<CR>
nnoremap <A-0> :SetDefaultFont<CR>

" Common editing stuff
nnoremap <leader>a ggVG
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>d "+d
vnoremap <leader>d "+d
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P


" Quick fix window mappings
nnoremap <leader>eq :copen<cr>

" Operator-pending mappings
" Samples from learnvimscriptthehardway for future reference
" onoremap p i(
" onoremap in( :<c-u>normal! f(vi(<cr>

" }}}

" Plugin settings & mappings -------------------- {{{

" CtrlP
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$',
	\ 'file': '\.exe$\|\.so$\|\.dll|\.swp$',
	\ 'link': '',
	\ }
nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap <leader>f <c-p><c-\>
" nnoremap <leader>f :CtrlP<CR>

" Tagbar
nnoremap <silent> <F2> :TagbarToggle<CR>

" NERDTree
noremap <F1> :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>

" Tabularize stuff
noremap <leader>tt :Tabularize /
noremap <leader>t: :Tabularize colon<cr>
noremap <leader>t<space> :Tabularize spaces<cr>
noremap <leader>t= :Tabularize assignment<cr>
noremap <leader>tcss :Tabularize inline_css<cr>

" Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 2
let g:indent_guides_enable_on_vim_startup = 1

" VimClojure
" Highlight clojure functions
let vimclojure#HighlightBuiltins = 1
" Enable rainbow parenthesis
let vimclojure#ParenRainbow = 1
let vimclojure#DynamicHighlighting = 1

" Snipmate stuff
let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases['less'] = 'css'
let g:snipMate.scope_aliases['php'] = 'php,html'

" Pandoc
if IsUnix()
    " Pandoc setting
    " Use hard wraps
    let g:pandoc_use_hard_wraps = 1
endif

" Scratch
nnoremap <leader>et :tabe<cr>:Scratch<cr>

" }}}

" Abbreviations -------------------- {{{

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

" }}}

