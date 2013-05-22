
" Utility functions             {{{

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

" Vundle                        {{{
"
" Vundle init                   {{{
filetype on    " test
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
" }}}

" VimL libraries and deps       {{{
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'tpope/vim-repeat'
" }}}

" Vim improvements              {{{

" Command line                  {{{
Bundle 'kien/ctrlp.vim'
" Bundle 'paradigm/SkyBison'
" }}}

" Movement                      {{{
Bundle 'matchit.zip'
Bundle 'Lokaltog/vim-easymotion'
" }}}

" Unclassified                  {{{
" Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'vim-scripts/Gundo'
" }}}

" Editing                       {{{
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"

Bundle 'godlygeek/tabular'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'
" Bundle 'kana/vim-smartinput'

Bundle 'vim-scripts/scratch.vim'

Bundle 'paradigm/vim-multicursor'
" }}}

" Text Objects                  {{{
Bundle 'kana/vim-textobj-user'
Bundle 'thinca/vim-textobj-between'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-fold'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-lastpat'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'coderifous/textobj-word-column.vim'

Bundle 'paradigm/TextObjectify'
" }}}

" Visual                        {{{
Bundle 'terryma/vim-expand-region'
" }}}

" }}}

" Coding                   {{{

" Editing                  {{{
Bundle 'mileszs/ack.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'majutsushi/tagbar'
" }}}

" Languages                {{{
" JS                       {{{
Bundle 'pangloss/vim-javascript'
" Bundle 'drslump/vim-syntax-js'
Bundle 'itspriddle/vim-jquery'
Bundle 'leshill/vim-json'
Bundle 'digitaltoad/vim-jade'
Bundle 'briancollins/vim-jst'
" }}}
" CoffeeScript             {{{
Bundle 'kchmck/vim-coffee-script'
Bundle 'mintplant/vim-literate-coffeescript'
" }}}
" Clojure                  {{{
Bundle 'tpope/vim-foreplay'
" Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
" }}}
" HTML                     {{{
Bundle 'mattn/zencoding-vim'
" }}}
" Livescript {{{
Bundle 'gkz/vim-ls'
" }}}
" CSS                      {{{
Bundle 'skammer/vim-css-color'
Bundle 'groenewege/vim-less'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'wavded/vim-stylus'
" }}}
" Markdown                 {{{
Bundle 'tpope/vim-markdown'
" }}}
" }}}

" External tools                {{{
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'guns/xterm-color-table.vim'
" }}}

" }}}

" Color schemes                 {{{
Bundle 'altercation/vim-colors-solarized'
Bundle 'cschlueter/vim-wombat'
Bundle 'shawncplus/skittles_berry'
Bundle 'phd'
Bundle 'tomasr/molokai'
Bundle 'endel/vim-github-colorscheme'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'wgibbs/vim-irblack'
Bundle 'tylerball/vim-hypertint'
Bundle 'noahfrederick/Hemisu'
Bundle 'sjl/badwolf'
Bundle 'mayansmoke'
Bundle 'morhetz/gruvbox'
" }}}

" Notes and data                {{{
Bundle 'lukaszkorecki/workflowish'
" }}}

" }}}

" Vim general settings          {{{

" Enable filetype plugin
filetype plugin on
filetype indent on

" Tab size
set softtabstop=2
set shiftwidth=2
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

set list

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

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

syntax enable "Enable syntax hl

set omnifunc=syntaxcomplete#Complete

set completeopt=menu,longest,preview

set backspace=indent,eol,start

" set number
" set relativenumber

set scrolloff=3

set laststatus=2

" Disable modeline
set nomodeline

" If run in a terminal, set the terminal title.
set title

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" set cursorline
" set cursorcolumn

" Fuck off Octal interfering with dates like 2001/05/02 when Ctrl+A/X
set nrformats-=octal

let mapleader=" "
let g:mapleader = " "
let maplocalleader= "\\"
let g:maplocalleader= "\\"

" Different cursors for different modes.
set guicursor=a:block-Cursor-blinkon0
set guicursor+=i:ver20-iCursor-blinkon400-blinkoff50
set guicursor+=v:block-vCursor-blinkon0

" set guicursor=n-c:block-Cursor-blinkon0
" set guicursor+=v:block-vCursor-blinkon0
" set guicursor+=i-ci:ver30-iCursor-blickwait300-blinkon200-blinkoff150

  " guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,n-c:block-Cursor-blinkon0,v:block-vCursor-blinkon0,i-ci:ver20-iCursor,i-ci:ver30-iCursor-blickwait300-blinkon200-blinkoff150,i-ci:ver30-inCursor-blickwait300-blinkon200-blinkoff150

" When available switch to open buffers in current and different tabs
set switchbuf=useopen,usetab

set conceallevel=0

" }}}

" Font and colorscheme          {{{
" Set font according to system

if 1 || !exists("g:fnd")
  if IsUnix()
      let g:fns = 17
      let g:fnc = 4
      let g:fnd = [
      \  'Inconsolata-dz for Powerline',
      \  'Monaco',
      \  'Consolas',
      \  'Source Code Pro',
      \  'Source Code Pro Light',
      \  'M+ 1m light',
      \  'Akkurat-Mono',
      \  'Menlo'
      \ ]

      set linespace=2
  else
      let g:fns = 11
      let g:fnc = -1
      let g:fnd = [
      \  'Menlo_for_Powerline',
      \  'Aurulent_Sans_Mono',
      \  'Source_Code_Pro',
      \  'Source_Code_Pro_Light',
      \  'Meslo_LG_L',
      \  'Monaco',
      \  'PragmataPro',
      \  'Envy_Code_R',
      \  'Ubuntu_Mono',
      \  'Luxi_Mono',
      \  'Cousine'
      \ ]

      set linespace=4
  endif
endif
fun! SetFont()
  if IsUnix()
    let &guifont = get(g:fnd, g:fnc) . ':h' . g:fns
  else
    let &guifont = escape(get(g:fnd, g:fnc), " ") . ':h' . g:fns
  endif
    " echo &guifont
endfun
call SetFont()
command! SetDefaultFont call SetFont()


fun! DefaultCursors()
  hi Cursor guibg=white ctermbg=15
  hi vCursor guifg=black guibg=#a3d3ff ctermfg=0 ctermbg=250
  hi iCursor guibg=#df5f00 ctermbg=166
endfun

if has("gui_running")

  " Gui options
  set guioptions=c

  set guioptions-=T
  set t_Co=256

  let s:badwolf=0
  let s:lucius=0
  let s:gruvbox=0
  let s:ir_black=1

  " ir_black colorscheme settings {{{
  if s:ir_black
    colorscheme ir_black

    hi! link FoldColumn CursorColumn
    hi! link SignColumn CursorColumn

    " Cursor colors
    call DefaultCursors()

    let g:status_line_colors="hi StatusLine guifg=#ffffff guibg=#0087AF ctermfg=33"
    exe g:status_line_colors

  endif
  " }}}

  " gruvbox colorscheme settings {{{
  if s:gruvbox
    colorscheme gruvbox
    let g:status_line_colors="hi StatusLine term=bold,reverse cterm=bold ctermfg=235 ctermbg=243 gui=bold guifg=#282828 guibg=#7c6f64"
    exe g:status_line_colors
  endif
  " }}}

  " badwolf colorscheme settings {{{
  if s:badwolf
    let g:badwolf_darkgutter = 1
    let g:badwolf_tabline = 3
    let g:badwolf_css_props_highlight = 1
    colorscheme badwolf

    " Cursor colors
    hi vCursor cterm=bold ctermfg=16 ctermbg=39 gui=bold guifg=#000000 guibg=#4abdff

    " Make folds a bit different than comments
    au ColorScheme * hi Folded ctermfg=241 ctermbg=235 guifg=#cccccc guibg=#343331

    hi link User2 StatusLineNC
    let g:status_line_colors="hi StatusLine term=bold,reverse cterm=bold ctermfg=16 ctermbg=39 gui=bold guifg=#000000 guibg=#0a9dff"
    exe g:status_line_colors

    hi User3 guifg=#666666 guibg=#080808 ctermfg=242 ctermbg=232
  endif
  " }}}

  " lucius colorscheme settings {{{
  if s:lucius
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

    " Lucius Cursor colors
    call DefaultCursors()

    hi clear StatusLine
    hi clear StatusLineNC
    let g:status_line_colors="hi StatusLine guifg=#ffffff guibg=#0087AF ctermfg=33"
    exe g:status_line_colors
    hi StatusLineNC guifg=#ffffff guibg=#585858 ctermfg=15 ctermbg=240

    hi User1 guifg=#005F00 guibg=#B5E61D
    hi User1 guifg=#ffffff guibg=#0087AF
    hi User2 guifg=#ffffff guibg=#45413b
    hi User3 guifg=#666666 guibg=#080808 ctermfg=242 ctermbg=232
    hi User4 guifg=#FA8072 guibg=#DC143C
    hi User5 guifg=#333333 guibg=#dddddd
  endif
  " }}}

else
  set t_Co=256
  colorscheme lucius
  LuciusBlackLowContrast

  " Lucius Cursor colors
  call DefaultCursors()

endif

" XXX: This is not respected as it should
hi Conceal guibg=black guifg=#ff8888 ctermbg=black ctermfg=white

" }}}

" Vim OS specific settings      {{{

if IsUnix()
else
  " set shell=D:\devel\bin\Git\bin\sh.exe
  " set shellcmdflag=--login\ -c
  " set shellxquote=\"
  " set shellslash
endif
" }}}

" Statusline                    {{{

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

" }}}

" Autocommands                  {{{
if has('autocmd')
    " settings immediately take effect
    augroup instantsettings "   {{{
        au!
        au BufWritePost $MYVIMRC :source $MYVIMRC

        if !IsUnix()
            au BufWritePost ~/vimfiles/.vimrc :source $MYVIMRC
        else
            au BufWritePost /Users/jkn/Develop/projects/conf/.vim/.vimrc :source $MYVIMRC
        endif
    augroup END "   }}}

    augroup writeonfocus "   {{{
        au!
        " Autosave when focus is lost
        au FocusLost * :silent! wall
    augroup END "   }}}

    augroup rememberlastcursorpos "   {{{
        au!
        au BufReadPost *
                    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                    \   exe "normal! g`\"zvzz"                        |
                    \ endif
    augroup END "   }}}

    " augroup cline "   {{{
    "     au!
    "     au WinLeave,InsertEnter * set nocursorline
    "     au WinEnter,InsertLeave * set cursorline
    " augroup END "   }}}

    augroup status_line_colors " {{{

      if has("gui_running")
        au InsertEnter * hi StatusLine guifg=white guibg=#df5f00 ctermbg=166
        exe "au InsertLeave * " g:status_line_colors
      endif

    augroup END "                }}}

    augroup viml "   {{{
        au!
        au FileType vim setlocal foldmethod=marker foldenable
    augroup END "   }}}

    augroup php "   {{{
        au!
        au FileType php setlocal shiftwidth=4
    augroup END "   }}}

    augroup clojurescript "   {{{
        au!
        au BufRead,BufNewFile *.cljs setlocal filetype=clojure
    augroup END "   }}}

    augroup css "   {{{
        au!
        au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    augroup END "   }}}

    augroup html_markdown "   {{{
        au!
        au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    augroup END "   }}}

    augroup javascript "   {{{
        au!
        " au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

        " conceallevel=2
        au FileType javascript setlocal tabstop=2
        au FileType javascript setlocal concealcursor=nc
        au FileType javascript setlocal foldmethod=syntax
    augroup END "   }}}

    augroup json "   {{{
        au!
    augroup END "   }}}

    augroup python "   {{{
        au!
        au FileType python setlocal omnifunc=pythoncomplete#Complete
    augroup END "   }}}

    augroup xml "   {{{
        au!
        au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    augroup END "   }}}

    augroup txt "   {{{
        au!
        au FileType txt,text setlocal formatoptions+=ta2
    augroup END "   }}}

    augroup dont_wrap_us_and_fuck_with_our_indent "   {{{
        au!
        " au FileType html,php,jst setlocal nowrap
        au FileType html,php,jst setlocal formatoptions-=t
        au FileType html,php,jst setlocal indentkeys-=*<Return>
    augroup END "   }}}

    augroup workflowish "      {{{
        au!
        " au FileType workflowish setlocal noexpandtab
        " This mappings make <cr> to zoom in and <bs> to zoom out
        au FileType workflowish nmap <buffer> <cr> zq
        au FileType workflowish nmap <buffer> <bs> zp
    augroup END "   }}}

    augroup make "              {{{
        au FileType make setlocal noexpandtab
    augroup END "   }}}
endif
" }}}

" Utilities                     {{{

" Font size changing            {{{

let s:fontIncrements = '1'
function! AdjustFontSize(amount)
  if has("gui_running")

    let &guifont = substitute(
     \ &guifont,
     \ ':h\zs\d\+',
     \ '\=eval(submatch(0)'.a:amount.')',
     \ '')

    let g:fns = eval(g:fns.a:amount)

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

" Font family cycle             {{{

" Cycles font family.
" a:fwd true -> goes foward through the array
function! CycleFontFamily(fwd)
  let step = a:fwd ? 1 : -1
  let limit = a:fwd ? len(g:fnd) : -1
  let rst = a:fwd ? 0 : len(g:fnd)-1
  let g:fnc += step
  if g:fnc == limit
    let g:fnc = rst
  endif
endfunction
function! CycleFont(fwd)
  call CycleFontFamily(a:fwd)
  call SetFont()
endfunc
command! CycleFontBackwards call CycleFont(0)
command! CycleFontFoward call CycleFont(1)

" }}}

" Toggle line number type       {{{

function! g:ToggleNuMode(globally)
    if(&rnu ==? 1)
      if(a:globally)
        set number
      else
        setlocal number
      endif
    else
      if(a:globally)
        set relativenumber
      else
        setlocal relativenumber
      endif
    endif
endfunc

" }}}

" Toggle conceal level       {{{

function! g:ToggleConceal(globally)
    if(&conceallevel)
      if(a:globally)
        set conceallevel=0
      else
        setlocal conceallevel=0
      endif
    else
      if(a:globally)
        set conceallevel=2
      else
        setlocal conceallevel=2
      endif
    endif
endfunc

" }}}

" Moving through indent levels  {{{
"
" Jump to the next or previous line that has the same level or a different
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
"                   false: Motion is inclusive
" fwd (bool): true: Go to next line
"             false: Go to previous line
" difflevel (bool): -1 : Go to line with less indentation level
"                    0 : Go to line with the same indentation level
"                    1 : Go to line with more indentation level
"
function! NextIndent(exclusive, fwd, difflevel)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  let difflevel0mode = 0
  if (indent(line+stepvalue) == indent && strlen(getline(line+stepvalue)))
    let difflevel0mode = 1
  endif
  if (a:difflevel == -1 && indent == 0)
    return
  endif
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    let currentindent = indent(line)

    let islevel0mode0 = a:difflevel == 0 && difflevel0mode == 0
    let islevel0mode1 = a:difflevel == 0 && difflevel0mode == 1

    let isempty = strlen(getline(line)) <= 0

    let fin0 = ( islevel0mode0 && currentindent == indent && !isempty ) ||
             \ ( islevel0mode1 && currentindent != indent ) ||
             \ ( islevel0mode1 && currentindent == indent && isempty )
    let fin1 = ( !isempty && a:difflevel == 1  && currentindent > indent )
    let fin2 = ( !isempty && a:difflevel == -1 && currentindent < indent )

    let fin = fin0 || fin1 || fin2

    " if (   ( diffindentfound == 1 && a:difflevel == 0 &&
    "      \     ( currentindent == indent &&
    "      \       currentindent == indent) ) ||
    "      \ ( diffindentfound == 0 && a:difflevel == 0 &&
    "      \     ( (indent(line-stepvalue) == indent &&
    "      \       currentindent != indent) ||
    "      \       (indent(line-stepvalue) != indent &&
    "      \        currentindent == indent)) ) ||
    if ( fin )
        if (a:exclusive || islevel0mode1)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
    else
      if ( a:difflevel == 1  && !isempty && currentindent < indent )
          return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.

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

" }}}

" Quickfix results to args      {{{

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

" Scroll fn                     {{{

" function! SmoothScroll(up)
"     if a:up
"         let scrollaction="2"
"     else
"         let scrollaction="2"
"     endif
"     exec "norm " . scrollaction
"     redraw
"     let counter=1
"     while counter<&scroll/2
"         let counter+=1
"         sleep 1m
"         redraw
"         exec "norm " . scrollaction
"     endwhile
" endfunction
" nnoremap <C-U> :call SmoothScroll(1)<Enter>M
" nnoremap <C-D> :call SmoothScroll(0)<Enter>M
" inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>Mi
" inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>Mi

" }}}

" Pulse Line                    {{{

function! s:Pulse() " {{{
    let current_window = winnr()
    windo set nocursorline
    execute current_window . 'wincmd w'
    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 9
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi

    setlocal nocursorline
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()
"}}}

" FoldText                      {{{
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
" }}}

" V Search function */#         {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
" }}}

" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
nnoremap <silent> <leader>7 :call HiInterestingWord(7)<cr>
nnoremap <silent> <leader>8 :call HiInterestingWord(8)<cr>
nnoremap <silent> <leader>9 :call HiInterestingWord(9)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#00afff ctermbg=39
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#df0000 ctermbg=160
hi def InterestingWord7 guifg=#000000 ctermfg=16 guibg=#df5fff ctermbg=171
hi def InterestingWord8 guifg=#000000 ctermfg=16 guibg=#c0c0c0 ctermbg=7
hi def InterestingWord9 guifg=#000000 ctermfg=16 guibg=#00ffff ctermbg=14

" }}}

" Remove trailing whitespace     {{{

nnoremap <leader>i<space> :%s/\s\+$<cr>

" }}}

" Map search to very magic      {{{
nnoremap / /\v
nnoremap ? ?\v

" }}}

" }}}

" Vim mappings                  {{{

" Settings editing              {{{
if IsUnix()
    nnoremap <leader>ev :e $MYVIMRC<cr>
    nnoremap <leader>et :e ~/Dropbox/data/tasks/tasks.wofl<cr>:lcd %:h<cr>
    nnoremap <leader>ew :e ~/Dropbox/data/wiki/<cr>:lcd %:h<cr>
else
    nnoremap <leader>ev :e ~\vimfiles\.vimrc<cr>
    nnoremap <leader>et :e D:\devel\Dropbox\data\tasks\tasks.wofl<cr>:lcd %:h<cr>
    nnoremap <leader>ew :e D:\devel\Dropbox\data\wiki\<cr>:lcd %:h<cr>
endif
" }}}

" Fast saving & quitting      {{{
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
" }}}

" Easier omnicompletion       {{{
inoremap <C-space> <C-X><C-O>
" }}}

" Manipulate windows          {{{
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
" }}}

" Move lines of code          {{{
" with Alt+[hjkl] in all modes
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
" }}}

" Toggling settings           {{{

nnoremap <leader>s/ :nohlsearch<CR>

" Map to set local path to file current path
nnoremap <leader>sp :lcd %:p:h<CR>:pwd<CR>

" Toggle line number mode
nnoremap <leader>sl :call g:ToggleNuMode(0)<cr>
nnoremap <leader>sL :call g:ToggleNuMode(1)<cr>
" Toggle line numbers mode
nnoremap <leader>sn :setlocal number!<cr>
nnoremap <leader>sN :set number!<cr>

" Toggle background color
nnoremap <leader>sb :let &background = ( &background ==? "dark"? "light" : "dark" )<CR>

" Toggle invisibles
nnoremap <leader>si :set list!<CR>
set listchars=tab:»\ ,trail:·,extends:…,precedes:…,nbsp:&,eol:¬

" Toggle spell checking
nnoremap <leader>ss :set spell!<CR>

" Toggle conceal
nnoremap <leader>sc :call g:ToggleConceal(0)<cr>
nnoremap <leader>sC :call g:ToggleConceal(1)<cr>

" }}}

" Font size maps              {{{
nnoremap <A-=> :LargerFont<CR>
nnoremap <A--> :SmallerFont<CR>
nnoremap <A-9> :CycleFontBackwards<CR>
nnoremap <A-0> :CycleFontFoward<CR>
" }}}

" Common editing stuff        {{{
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>d "+d
vnoremap <leader>d "+d
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
" }}}

" Quick fix and location window mappings   {{{
nnoremap <leader>eq :copen<cr>
nnoremap <leader>el :lopen<cr>
" }}}

" Highlight Group(s)          {{{
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

" Panic Button                 {{{
nnoremap <f9> mzggg?G`z
" }}}

" Formatting                   {{{
nnoremap Q gqip
vnoremap Q gq
" }}}

" Sudo to write                {{{
cnoremap w!! w !sudo tee % >/dev/null
" }}}

" Center screen when moving     {{{
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zzzv
nnoremap g, g,zzzv
nnoremap <c-o> <c-o>zzzv
nnoremap <c-i> <c-i>zzzv
" }}}

" Line-wise movements          {{{
" Easier to type
noremap H ^
noremap L $
vnoremap L g_
" Mantain
noremap gH H
noremap gL L
" }}}

" gI                           {{{
" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.
" }}}

" Toggle "keep current line in the center of the screen" mode {{{
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>
" }}}

" Normal mode */# remap         {{{
nnoremap * *Nzzzv
nnoremap # #Nzzzv
" }}}

" Visual Mode */# from Scrooloose {{{
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
" }}}

" List navigation               {{{
nnoremap <left>  :cprev<cr>zvzz
nnoremap <right> :cnext<cr>zvzz
nnoremap <up>    :lprev<cr>zvzz
nnoremap <down>  :lnext<cr>zvzz
" }}}

" Folds                         {{{

set nofoldenable
set foldlevelstart=1

" Space to toggle folds.
nnoremap <c-space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" }}}

" "Focus" the current line       {{{
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-cr> mzzMzvzz3<c-e>`z:Pulse<cr>
" }}}

" netrw                       {{{
let g:netrw_liststyle = 1
noremap <F1> :e.<CR>
noremap <leader>n :e.<CR>
noremap <leader>N :e %:h<CR>
" }}}

" Command line maps             {{{

cnoremap <expr>%% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <c-n> <down>
cnoremap <c-p> <up>

cnoremap <a-l> <right>
cnoremap <a-h> <left>
cnoremap <a-f> <c-right>
cnoremap <a-b> <c-left>

cnoremap <c-a> <c-b>

cnoremap <a-bs> <c-w>

" }}}

" Substitute shortcut           {{{

nnoremap <leader>r :%s/
xnoremap <leader>r :s/

" }}}

" Insert mode stuff (shame) {{{
inoremap <c-d> <c-k>
inoremap <c-l> <Del>
inoremap <c-k> <c-o>D
inoremap <c-u> <c-o>d0
inoremap <c-e> <c-o>$
inoremap <c-a> <c-o>_
inoremap <c-f> <c-o>l
inoremap <c-b> <c-o>h
inoremap <a-f> <c-o>w
inoremap <a-b> <c-o>b
inoremap <a-a> <c-o>(
inoremap <a-e> <c-o>)
inoremap <a-d> <c-o>dw
inoremap <a-bs> <c-o>db
" }}}

" Colon and Semi-colon mappings   {{{
" Easier : reach, and saner ; map
" Now, ; goes avanti with f/F t/T and <shift-;> goes backwards
" Also command line goes to , which is better than <shift-;>
nnoremap , :
xnoremap , :
nnoremap : ,
xnoremap : ,
" }}}

" Easy filetype changing        {{{
nnoremap <leader>sft :set filetype=txt<cr>
nnoremap <leader>sfj :set filetype=javascript<cr>
nnoremap <leader>sfm :set filetype=markdown<cr>
nnoremap <leader>sfw :set filetype=workflowish<cr>
nnoremap <leader>sfv :set filetype=vim<cr>
nnoremap <leader>sff :set filetype=
" }}}

" }}}

" Plugin settings & mappings    {{{

" CtrlP                         {{{

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
" nnoremap <leader>t :CtrlPTag<CR>

" }}}

" Tagbar                         {{{
nnoremap <silent> <F2> :TagbarToggle<CR>
" }}}

" Tabularize stuff                         {{{

noremap <leader>at       :Tabularize /
noremap <leader>aa       :Tabularize /
noremap <leader>a:       :Tabularize colon<cr>
noremap <leader>a<space> :Tabularize spaces<cr>
noremap <leader>a=       :Tabularize assignment<cr>
noremap <leader>acss     :Tabularize inline_css<cr>

" }}}

" VimClojure                         {{{
" Highlight clojure functions
let vimclojure#HighlightBuiltins = 1
" Enable rainbow parenthesis
let vimclojure#ParenRainbow = 1
let vimclojure#DynamicHighlighting = 1
" }}}

" Snipmate stuff                         {{{
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['less'] = 'css'
let g:snipMate.scope_aliases['php'] = 'php,html'
let g:snipMate.scope_aliases['jst'] = 'js,html'
let g:snipMate.scope_aliases['ejs'] = 'js,html'
" }}}

" Pandoc                         {{{
" if IsUnix()
"     " Pandoc setting
"     " Use hard wraps
"     let g:pandoc_use_hard_wraps = 1
" endif
" }}}

" Scratch                         {{{
nnoremap <leader>es :Scratch<cr>
" }}}

" Ack commands abbr             {{{

nnoremap <leader>/ :Ack 
command! TODO execute "Ack TODO"
command! FIX execute "Ack \"FIX|XXX|HACK|OPTIMIZE\""

" }}}

" EasyMotion                    {{{
let g:EasyMotion_leader_key = 's'
let g:EasyMotion_keys="jklfdsaghtrewqyuiopvcxzbnmJKLFDSAGHTREWQYUIOPVCXZBNM"
hi EasyMotionShade ctermfg=darkgrey guifg=darkgrey guibg=black
hi EasyMotionTarget ctermfg=darkred guifg=yellow guibg=darkred
" }}}

" AceJump                       {{{
nnoremap ss :call AceJump()<CR>
" }}}


" Multicursor                   {{{

nnoremap <leader>m    :<c-u>call MultiCursorPlaceCursor()<cr>
xnoremap <leader>m    :<c-u>call MultiCursorVisual()<cr>
nnoremap <leader><cr> :<c-u>call MultiCursorManual()<cr>
nnoremap <leader>cd   :<c-u>call MultiCursorRemoveCursors()<cr>
nnoremap <leader>c/   :<c-u>call MultiCursorSearch('')<cr>
let g:multicursor_quit = "<c-c>"

" To get a sublime text like interface
" Have to use xmap to get advantage of */# remaps. If I remap : this will break
nnoremap <c-p>  :<c-u>call MultiCursorPlaceCursor()<cr>N
nnoremap <c-n>  :<c-u>call MultiCursorPlaceCursor()<cr>n
xmap     <c-p> #,<c-u>call MultiCursorPlaceCursor()<cr>N
xmap     <c-n> *,<c-u>call MultiCursorPlaceCursor()<cr>n

" }}}

" Skybison                               {{{
"
" let g:skybison_fuzz = 2
" nnoremap <leader>;  :<c-u>call SkyBison("")<cr>
" " nnoremap <leader>b 2:<c-u>call SkyBison("b ")<cr>
" " nnoremap <leader>e  :<c-u>call SkyBison("e ")<cr>
" " nnoremap <leader>h 2:<c-u>call SkyBison("h ")<cr>
" cnoremap <c-l> <c-r>=SkyBison("")<cr><cr>
" 
" }}}

" }}}

" Abbreviations                 {{{

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

" Language settings             {{{

" For reference
" Places where :find and gf look for files
"   set path+=c:\\asd
"   set path+=./asd
"
" and suffixes autocomplete on that files
"   set suffixesadd=.java


" Javascript                    {{{
" Bundle 'othree/javascript-libraries-syntax.vim'

let g:javascript_conceal=1

command! -range=% JSBeautifyJSON <line1>,<line2>!js-beautify -f - -b expand
command! -range=% JSBeautify <line1>,<line2>!js-beautify -f -

" }}}

" }}}

" Per project settings          {{{

if has('autocmd')

    " augroup esearchFE_settings
    "     au!
    "     if !IsUnix()
    "         au BufNewFile,BufRead d:/devel/projects/eSearchFE/* setlocal softtabstop=4 shiftwidth=4 tabstop=4
    "     endif
    " augroup END
    " augroup website_framework_settings
    "     au!
    "     if !IsUnix()
    "         au BufNewFile,BufRead d:/devel/projects/WebsiteFramework/* setlocal softtabstop=4 shiftwidth=4 tabstop=4
    "     endif
    " augroup END
    augroup fsp_settings
        au!
        if !IsUnix()
            " au BufNewFile,BufRead d:/devel/projects/fsp/* setlocal softtabstop=4 shiftwidth=4 tabstop=4
        endif
    augroup END

endif

" }}}


