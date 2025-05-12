" Vim color file
" Maintainer:	Csa'sza'r Pe'ter <csjpeter@gmail.com>
" Last Change:	2013 July 25
"
" :so $VIMRUNTIME/syntax/hitest.vim

" This is a default color scheme as I wish it to be.

" Syntax to use :
" gui			Graphic User Interfacce
" cterm			Consol Terminal
"	Possible values:
"		none, bold, italic, underline
"
" guifg/ctermfg		ForeGround
" guibg/ctermbg		BackGround
" Possible color values :
"	#RRGGBB or like these: red, green, lightgreen, purple, etc

"hi clear
"set bg&
"if exists("syntax_on")
"  syntax reset
"endif
"let g:colors_name = "csjpeter"

"set background=dark

" Console
"ColorColumn Conceal Cursor CursorIM CursorColumn CursorLine Directory DiffAdd DiffChange DiffDelete
"DiffText ErrorMsg VertSplit Folded FoldColumn SignColumn IncSearch LineNr CursorLineNr MatchParen
"ModeMsg MoreMsg NonText Normal Pmenu PmenuSel PmenuSbar PmenuThumb Question Search SpecialKey
"SpellBad SpellCap SpellLocal SpellRare StatusLine StatusLineNC TabLine TabLineFill TabLineSel
"Title Visual VisualNOS WarningMsg WildMenu

hi csjpTemplateCmd		ctermfg=Brown	ctermbg=Black	cterm=none
hi csjpTemplateBlock	ctermfg=Magenta	ctermbg=Black	cterm=none
hi csjpTemplateDefine	ctermfg=Yellow	ctermbg=Black	cterm=bold

hi BuildErr             ctermfg=Black   ctermbg=Red     cterm=none
hi BuildRunning         ctermfg=Black   ctermbg=Yellow  cterm=none
hi BuildOk              ctermfg=Black   ctermbg=Green   cterm=none

hi Search				ctermfg=Black	ctermbg=34	    cterm=none
hi Visual				ctermfg=Black	ctermbg=130	    cterm=none
hi Cursor				ctermfg=Gray	ctermbg=Black	cterm=none
hi CursorLine			ctermfg=Black	ctermbg=Cyan	cterm=none
"hi CursorLine			cterm=underline

hi TabNum				ctermfg=34	    ctermbg=251	    cterm=bold
hi TabNumSel			ctermfg=34	    ctermbg=Cyan	cterm=bold
hi TabLine				ctermfg=Black	ctermbg=251	    cterm=none
hi TabLineFill			ctermfg=Black	ctermbg=251	    cterm=none
hi TabLineSel			ctermfg=Black	ctermbg=Cyan	cterm=none

hi StatusLineNC			ctermfg=Black	ctermbg=Gray	cterm=none
hi StatusLine			ctermfg=Black	ctermbg=Cyan	cterm=none
hi VertSplit			ctermfg=Gray	ctermbg=Gray	cterm=none
hi Folded				ctermfg=Gray	ctermbg=Black	cterm=none
"hi FoldColumn			ctermfg=Yellow	ctermbg=Black	cterm=bold

hi Normal				ctermfg=Gray	ctermbg=Black	cterm=none
	hi link phpMemberSelector	Normal
	hi link phpRelation		Normal
    hi link cppPtrRes   Normal
hi Comment				ctermfg=34	    ctermbg=Black	cterm=none
	hi link Question	Comment
hi Constant				ctermfg=Blue	ctermbg=Black	cterm=bold
	hi link String		Normal
	hi link Character	Normal
	hi link Number		Normal
	hi link Boolean		Normal
	hi link Float		Normal
hi Identifier			ctermfg=252	    ctermbg=Black	cterm=none
	hi Function			ctermfg=252	    ctermbg=Black	cterm=bold
hi Statement			ctermfg=Blue	ctermbg=Black	cterm=bold
	hi link Conditional	Statement
	hi link Repeat		Statement
	hi link Label		Statement
	hi link Operator	Normal
	hi link Keyword		Statement
	hi link Exception	Statement
	"
	hi link Enum 		Statement
	hi link phpDefine	Statement
	hi link phpParent	Statement
	hi link phpBrackets	Statement
	hi link phpInterpSimpleCurly Statement
hi PreProc				ctermfg=Cyan	ctermbg=Black	cterm=none
	hi link PreCondit	PreProc
	hi link Include		PreProc
	hi link Define		PreProc
	hi link Macro		PreProc
	"
hi Type					ctermfg=Blue	ctermbg=Black	cterm=bold
	hi link StorageClass	Statement
	hi link Structure	Statement
	hi link Typedef		Statement
	"
hi Special				ctermfg=Brown	ctermbg=Black	cterm=none
	hi SpecialChar		ctermfg=Brown	ctermbg=Black	cterm=bold
	hi Tag				ctermfg=Brown	ctermbg=Black	cterm=bold,underline
	hi link Delimiter	Special
	hi link SpecialComment	Comment
	hi Debug			ctermfg=Magenta	ctermbg=Black	cterm=none
	"
	hi link phpVarSelector	Special
    hi link cParen      Special
    hi link ColorColumnppParen    Special
hi cppBraces            ctermfg=Blue    ctermbg=Black   cterm=bold
hi cppStl               ctermfg=Blue    ctermbg=Black   cterm=none
hi cppBoost             ctermfg=Blue    ctermbg=Black   cterm=none
hi cppReference         ctermfg=Yellow  ctermbg=Black   cterm=bold
hi Underlined			ctermfg=Gray	ctermbg=Black	cterm=underline
hi Error				ctermfg=Red	    ctermbg=Black	cterm=bold
	"
	hi link ErrorMsg	Error
	hi WarningMsg		ctermfg=Red	    ctermbg=Black	cterm=none
hi Todo					ctermfg=Black	ctermbg=Brown	cterm=none
hi SyntaxError			ctermbg=Red

hi BuildOk				ctermfg=Black	ctermbg=34	    cterm=none
hi BuildErr				ctermfg=Black	ctermbg=Red	    cterm=none
hi BuildRunning			ctermfg=Black	ctermbg=Yellow	cterm=none


" Links to prev defs

"hi link ModeMsg		Normal
"hi link MoreMsg		Normal
"hi link IncSearch	Normal
"hi link LineNr		Normal
"hi link Title		Normal
"hi link NonText		Normal
"hi link DiffChange	Normal
"hi link DiffText	Normal
"hi link DiffAdd		Normal
"hi link DiffDelete	Normal
"hi link Folded		Normal
"hi link FoldColumn	Normal



