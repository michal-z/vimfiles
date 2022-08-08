set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "save_your_eyes"

hi Normal cterm=NONE gui=NONE guifg=Grey50 guibg=Grey5
hi Keyword cterm=NONE gui=NONE guifg=Grey65 guibg=Grey5
hi Pmenu cterm=NONE gui=NONE guifg=Grey40 guibg=Grey10
hi PmenuSel cterm=NONE gui=NONE guifg=Black guibg=DarkGrey
hi Directory cterm=NONE gui=NONE guifg=DarkGreen guibg=NONE
hi Search cterm=NONE gui=NONE guifg=Black guibg=#cc5511
hi IncSearch cterm=NONE gui=NONE guifg=Grey90 guibg=#0037DA
hi Visual cterm=NONE gui=NONE guifg=Grey60 guibg=Grey20
hi NonText cterm=NONE gui=NONE guifg=Grey40 guibg=Grey5
hi String cterm=NONE gui=NONE guifg=Grey30 guibg=Grey5
hi Comment cterm=NONE gui=NONE guifg=DarkGreen guibg=Grey5
hi VertSplit cterm=NONE gui=NONE guifg=Grey10 guibg=Grey10
hi StatusLine cterm=NONE gui=NONE guifg=Grey70 guibg=Grey10
hi StatusLineNC cterm=NONE gui=NONE guifg=Grey60 guibg=Grey10
hi MatchParen cterm=NONE gui=NONE guifg=Red guibg=Grey5
hi CursorLine cterm=NONE gui=NONE guifg=Grey90 guibg=NONE

hi! link Constant Normal
hi! link Underlined Normal
hi! link Ignore Normal
hi! link Error Normal
hi! link Todo Normal

hi! link Identifier Keyword
hi! link Statement Keyword
hi! link PreProc Keyword
hi! link Type Keyword
hi! link Special Keyword
