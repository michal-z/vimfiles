if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword=a-z,A-Z,48-57,_
setlocal isident=a-z,A-Z,48-57,_

syn case ignore

syn region fasmComment start=";" end="$"

hi def link fasmComment comment

let b:current_syntax = "fasm"
" vim: ts=8 sw=8 :
