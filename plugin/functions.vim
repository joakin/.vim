
" Highlight words {
" This mini-plugin provides a few commands for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! g:HiInterestingWord(n)
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

fun! g:HiDefineColors()
    hi! def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
    hi! def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
    hi! def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#00afff ctermbg=39
    hi! def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
    hi! def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
    hi! def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#df0000 ctermbg=160
    hi! def InterestingWord7 guifg=#000000 ctermfg=16 guibg=#df5fff ctermbg=171
    hi! def InterestingWord8 guifg=#000000 ctermfg=16 guibg=#c0c0c0 ctermbg=7
    hi! def InterestingWord9 guifg=#000000 ctermfg=16 guibg=#00ffff ctermbg=14
endfun

call g:HiDefineColors()
" }

" Moving through indent levels {
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
" }

function! g:ToggleConceal(globally) " {
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
endfunc " }

function! g:ToggleNuMode() " {

  if(&nu ==? 0 && &rnu ==? 0)
    set nu rnu
  " elseif(&nu ==? 1 && &rnu ==? 0)
  "   set nonu nornu
  else
    set nonu nornu
  endif

endfunc " }

" Visual search function */# {
function! g:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
" }
