
"" If conceal is available modify some rules
if (has('conceal') && &enc=="utf-8")

  "" Replace the function keyword with a 𝑓
  syntax match jsConcealFunction /function/ contained containedin=javaScriptFunction conceal cchar=ƒ "𝑓

  " "" Replace the return keyword with ↵ , ⇤  or ↩ symbol
  syntax keyword javaScriptBranch return conceal cchar=↩ "𝑓

  " "" Replace this. with @ ala Ruby
  " "" We need to clear the original style to override it with a match instead of keyword
  syntax clear   javaScriptThis
  syntax match   javaScriptThis  /\<this\>/ containedin=@javaScriptExpression2
  syntax match   jsConcealThis  /\<this\./ containedin=@javaScriptExpression2 conceal cchar=@
  hi def link jsConcealThis javaScriptThis

  "" Replace .prototype. with →or ∷
  "" Use containedin=@jsAll to give it more priority
  syntax match jsConcealProto /\.prototype\./ containedin=@javaScriptAll conceal cchar=→
  hi def link jsConcealProto Type

  hi Conceal guibg=black guifg=#ff8888 ctermbg=black ctermfg=white

endif

