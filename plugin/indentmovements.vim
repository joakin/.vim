
" Moving through indent levels
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
