" 
" "" If conceal is available modify some rules
" if (has('conceal') && &enc=="utf-8")
" 
"   "" Replace the function keyword with a 𝑓
"   if count(g:syntax_js, 'function')
"     syntax match   jsConcealFunction  contained /function/ containedin=jsFunc conceal cchar=ƒ "𝑓
"     "syntax cluster jsPrimitives add=jsConcealFunction
"     hi def link jsConcealFunction jsFunc
"   endif
" 
"   "" Hide semicolons found at end of line
"   if count(g:syntax_js, 'semicolon')
"     syntax match   jsPunctSemiColon   /;\%(\(\s*}\)\@=\|\s*$\)/ containedin=@jsAll display conceal
"   endif
" 
"   "" Hide commas found at end of line
"   " TODO: Try to avoid overwriting the jsError rule for commas before } and ]
"   if count(g:syntax_js, 'comma')
"     syntax match   jsPunctComma       /,\s*$/ containedin=jsObject,jsArray display conceal
"   endif
"   
" 
"   "" Replace the return keyword with ↵ , ⇤  or ↩ symbol
"   "" Clear and create again the branch removing the return keyword
"   if count(g:syntax_js, 'return')
"     syntax clear   jsControlBranch
"     syntax keyword jsControlBranch  if else switch case default break continue
"     syntax match   jsConcealReturn  /\<return\>/ containedin=jsIdentName conceal cchar=↩
"     hi def link jsConcealReturn jsControlBranch
"   endif
" 
"   "" Replace this. with @ ala Ruby
"   "" We need to clear the original style to override it with a match instead of keyword
"   if count(g:syntax_js, 'this')
"     syntax clear   jsKeywordThis
"     syntax match   jsKeywordThis  /\<this\>/ containedin=@jsStatement,@jsBlock
"     syntax match   jsConcealThis  /\<this\./ containedin=@jsStatement,@jsBlock conceal cchar=@
"     hi def link jsConcealThis jsKeywordThis
"   endif
" 
"   "" Replace .prototype. with →or ∷
"   "" Use containedin=@jsAll to give it more priority
"   if count(g:syntax_js, 'proto') || count(g:syntax_js, 'prototype')
"     syntax match   jsConcealProto /\.prototype\./ containedin=@jsAll conceal cchar=→
"     hi def link jsConcealProto jsIdent
"   endif
" 
" endif
