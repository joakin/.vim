" syntax highlighting for Alma (https://alma-lang.org/)

if exists('b:current_syntax')
  finish
endif

" Keywords
syn keyword almaConditional else if of then case
syn keyword almaAlias alias
syn keyword almaTypedef contained type port
syn keyword almaImport exposing as import module where

" Operators
" alma/core
syn match almaOperator contained "\(<|\||>\|||\|&&\|==\|/=\|<=\|>=\|++\|::\|+\|-\|*\|/\|//\|^\|<>\|>>\|<<\|<\|>\|%\)"
" alma/parser
syn match almaOperator contained "\(|.\||=\)"
" alma/url
syn match almaOperator contained "\(</>\|<?>\)"

" Types
syn match almaType "\<[A-Z][0-9A-Za-z_-]*"
syn keyword almaNumberType number

" Modules
syn match almaModule "\<\([A-Z][0-9A-Za-z_'-\.]*\)\+\.[A-Za-z]"me=e-2
syn match almaModule "^\(module\|import\)\s\+[A-Z][0-9A-Za-z_'-\.]*\(\s\+as\s\+[A-Z][0-9A-Za-z_'-\.]*\)\?\(\s\+exposing\)\?" contains=almaImport

" Delimiters
syn match almaDelimiter  "[,;]"
syn match almaBraces  "[()[\]{}]"

" Functions
syn match almaTupleFunction "\((,\+)\)"

" Comments
syn keyword almaTodo TODO FIXME XXX contained
syn match almaLineComment "--.*" contains=almaTodo,@spell
syn region almaComment matchgroup=almaComment start="{-|\=" end="-}" contains=almaTodo,almaComment,@spell fold

" Strings
syn match almaStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match almaStringEscape "\\[nrfvbt\\\"]" contained
syn region almaString start="\"" skip="\\\"" end="\"" contains=almaStringEscape,@spell
syn region almaTripleString start="\"\"\"" skip="\\\"" end="\"\"\"" contains=almaStringEscape,@spell
syn match almaChar "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"

" Lambda
syn region almaLambdaFunc start="\\"hs=s+1 end="->"he=e-2

" Debug
syn match almaDebug "Debug.\(log\|todo\|toString\)"

" Numbers
syn match almaInt "-\?\<\d\+\>"
syn match almaFloat "-\?\(\<\d\+\.\d\+\>\)"

" Identifiers
syn match almaTopLevelDecl "^\s*[a-zA-Z][a-zA-z0-9_]*\('\)*\s\+:\(\r\n\|\r\|\n\|\s\)\+" contains=almaOperator
syn match almaFuncName /^\l\w*/

" Folding
syn region almaTopLevelTypedef start="type" end="\n\(\n\n\)\@=" contains=ALL fold
syn region almaTopLevelFunction start="^[a-zA-Z].\+\n[a-zA-Z].\+=" end="^\(\n\+\)\@=" contains=ALL fold
syn region almaCaseBlock matchgroup=almaCaseBlockDefinition start="^\z\(\s\+\)\<case\>" end="^\z1\@!\W\@=" end="\(\n\n\z1\@!\)\@=" end="\n\z1\@!\(\n\n\)\@=" contains=ALL fold
syn region almaCaseItemBlock start="^\z\(\s\+\).\+->$" end="^\z1\@!\W\@=" end="\(\n\n\z1\@!\)\@=" end="\(\n\z1\S\)\@=" contains=ALL fold
syn region almaLetBlock matchgroup=almaLetBlockDefinition start="\<let\>" end="\<in\>" contains=ALL fold

hi def link almaFuncName Function
hi def link almaCaseBlockDefinition Conditional
hi def link almaCaseBlockItemDefinition Conditional
hi def link almaLetBlockDefinition TypeDef
hi def link almaTopLevelDecl Function
hi def link almaTupleFunction Normal
hi def link almaTodo Todo
hi def link almaComment Comment
hi def link almaLineComment Comment
hi def link almaString String
hi def link almaTripleString String
hi def link almaChar String
hi def link almaStringEscape Special
hi def link almaInt Number
hi def link almaFloat Float
hi def link almaDelimiter Delimiter
hi def link almaBraces Delimiter
hi def link almaTypedef TypeDef
hi def link almaImport Include
hi def link almaConditional Conditional
hi def link almaAlias Delimiter
hi def link almaOperator Operator
hi def link almaType Type
hi def link almaNumberType Identifier
hi def link almaLambdaFunc Function
hi def link almaDebug Debug
hi def link almaModule Type

syn sync minlines=500

let b:current_syntax = 'alma'
