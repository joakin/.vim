
fun! IsUnix()
    if has('win32') || has('win64')
        return 0
    else
        return 1
    endif
endfun

set nocompatible
set encoding=utf-8

filetype off                   " required for vundle

if IsUnix()
    " Usual quickstart instructions
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
else
    set rtp+=~/vimfiles/bundle/vundle/
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
Bundle 'tpope/vim-surround'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'vim-scripts/Gundo'
" Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdtree'
Bundle 'matchit.zip'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-speeddating'

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
Bundle 'ChrisKempson/Vim-Tomorrow-Theme'
Bundle 'cschlueter/vim-wombat'
Bundle 'shawncplus/skittles_berry'
Bundle 'phd'
Bundle 'tomasr/molokai'
Bundle 'endel/vim-github-colorscheme'
Bundle 'vim-scripts/Lucius'

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

" Wrap text when 80 cols
set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop

set ignorecase    " Not case sensitive search
set smartcase     " Unless the search contains caps letters
" set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set magic "Set magic on, for regular expressions (default?)

set dir=~/.vimswap//
set undodir=~/.vimundo//

" Set to auto read when a file is changed from the outside
set autoread

" Set split directions to something normal
set splitbelow
set splitright

set wildmenu

syntax enable "Enable syntax hl

set ofu=syntaxcomplete#Complete

if !IsUnix()
    set bs=2
endif

set number
set rnu

set scrolloff=3

set laststatus=2

set cursorline
set cursorcolumn

let mapleader=","
let g:mapleader = ","
" Make \ behave as default ,
nnoremap \ ,

" Set font according to system
if IsUnix()
  set gfn=DejaVu\ Sans\ Mono:h15
  " set gfn=Akkurat-Mono:h15
  set linespace=4
  " set gfn=M+\ 1m\ light:h24
else
  " set gfn=Monoxil_Regular:h10
  set gfn=Aurulent_Sans_Mono:h10
  " set gfn=Dejavu_Sans_Mono:h9
endif

if has("gui_running")
  set guioptions-=T
  set t_Co=256

  "set background=dark
  "colorscheme solarized
  colorscheme lucius

else
  set t_Co=256
  colorscheme lucius
endif

"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
"hi clear StatusLine
"hi clear StatusLineNC
"hi StatusLine guifg=#ffffff guibg=#0087AF ctermfg=66
"hi StatusLineNC guifg=#ffffff guibg=#585858 ctermfg=8 ctermbg=232

"hi User1 guifg=#005F00 guibg=#B5E61D
"hi User1 guifg=#ffffff guibg=#0087AF
"hi User2 guifg=#ffffff guibg=#585858
"hi User3 guifg=#666666 guibg=#000000
"hi User4 guifg=#FA8072 guibg=#DC143C
"hi User5 guifg=#333333 guibg=#dddddd
set statusline=
set statusline +=%3*\ [%n]\ %*  " buffer number
" set statusline +=%5*%{&ff}%*  " file format
set statusline +=\ \ %<%f\ \ %* " full path
set statusline +=%4*%m%*        " modified flag
set statusline +=%3*\ %y\ %*    " file type
set statusline +=%3*%=%*        " align right
set statusline +=%2*%5l%*       " current line
set statusline +=%2*/%L\ \ %*   " total lines
" set statusline +=%5*%4c\ %*   " column number
set statusline +=%5*\ %P\       " percentage of file


" Fast saving
nmap <leader>w :w<cr>

" Easier omnicompletion
imap <C-space> <C-X><C-O>

" Move between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

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
function! g:ToggleNuMode()
    if(&rnu == 1)
        set nu
    else
        set rnu
    endif
endfunc
nnoremap <leader>sl :call g:ToggleNuMode()<cr>

" Toggle background color
nnoremap <leader>sb :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Toggle invisibles
nmap <leader>si :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Toggle spell checking
nmap <leader>ss :set spell!<CR>


" Common editing stuff
nmap <leader>a ggVG
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>d "+d
vmap <leader>d "+d
nmap <leader>p "+p
vmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>P "+P


" Plugin mappings

" CtrlP
nmap <leader>b :CtrlPBuffer<CR>
" nmap <leader>f :CtrlP<CR>

" Tagbar
nnoremap <silent> <F2> :TagbarToggle<CR>

" Gundo
" nnoremap <leader>u :GundoToggle<CR>

" NERDTree
noremap <F1> :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>

" Tabularize stuff
noremap <leader>et: :Tabularize colon<cr>
noremap <leader>et<space> :Tabularize spaces<cr>
noremap <leader>et= :Tabularize assignment<cr>
noremap <leader>etcss :Tabularize inline_css<cr>

" Autocommands
if has('autocmd')
    " settings immediately take effect
    augroup instantsettings
        au!
        au BufWritePost $MYVIMRC :source $MYVIMRC
        au BufLeave $MYVIMRC :source $MYVIMRC
    augroup END

    augroup writeonfocus
        " Autosave when focus is lost
        au!
        au FocusLost * :wa
    augroup END

    augroup rememberlastcursorpos
        au!
        au BufReadPost *
                    \ if line("'\"") > 0 && line ("'\"") <= line("$")   |
                    \   exe "normal! g'\""                              |
                    \ endif
    augroup END

    augroup php
        au!
        au FileType php  set shiftwidth=4
    augroup END

    augroup jst
        au!
        " Syntax for JST
        au BufNewFile,BufRead *.jst set syntax=jst
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
        au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
    augroup END

    if IsUnix()
        augroup txt
            au!
            au BufNewFile,BufRead *.txt set filetype=pandoc
        augroup END
    endif

endif

" Plugin settings

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$',
	\ 'file': '\.exe$\|\.so$\|\.dll|\.swp$',
	\ 'link': '',
	\ }
nmap <leader>f <c-p><c-\>

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

if IsUnix()
    " Pandoc setting
    " Use hard wraps
    let g:pandoc_use_hard_wraps = 1
endif

