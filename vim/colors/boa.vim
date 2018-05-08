" 'boa' theme for vim and neovim

" Initialisation
" ==============
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "boa"

" ColorPallete
" ============
" foreground(yellowish white) = #C2B7A9
" background(browndark) = #1F1B11
" string(greenish) = #608F76
" comment(brown) = #725749
" conditional(pinky) = #E36660
" statement(yellow) = #D6CD6B
" directory(blue) = #8598C6
" constant(purple) = #A686B2
" error(darkred) = #611818
" function(orange) = #B48B5D
" operator(bluish white) = #ABB6BA
" todo(bright green) = #90C777
" special(purple) = #A686B2

" Basic Highlighting (see :help group-name)
" =========================================
hi Comment guifg=#725749 guibg=NONE gui=italic

hi Constant guifg=#A686B2 guibg=NONE gui=NONE
hi String guifg=#608F76 guibg=NONE gui=NONE
" Character
" Number
" Boolean
" Float

hi Identifier guifg=#C2B7A9 guibg=NONE gui=NONE
hi Function guifg=#B48B5D guibg=NONE gui=NONE

hi Statement guifg=#D6CD6B guibg=NONE gui=italic
hi Conditional guifg=#E36660 guibg=NONE gui=NONE
hi Repeat guifg=#E36660 guibg=NONE gui=NONE
hi Label guifg=#E36660 guibg=NONE gui=NONE
hi Operator guifg=#ABB6BA guibg=NONE gui=NONE
hi Keyword guifg=#E36660 guibg=NONE gui=NONE
hi Exception guifg=#E36660 guibg=NONE gui=NONE

hi PreProc guifg=#E36660 guibg=NONE gui=NONE
" Include"
" Define"
" Macro"
" PreCondit"

hi Type guifg=#8797C1 guibg=NONE gui=NONE
" StorageClass"
hi Structure guifg=#A686B2 guibg=NONE gui=NONE
" Typedef"

hi Special guifg=#A686B2 guibg=NONE gui=NONE
" SpecialChar"
" Tag"
" Delimiter"
" SpecialComment"
" Debug"
"
hi Underlined guifg=NONE guibg=NONE gui=underline
hi Ignore guifg=NONE guibg=NONE gui=NONE
hi Error guifg=NONE guibg=#611818 gui=NONE
hi Todo guifg=#90C777 guibg=NONE gui=bold

" Extended Highlighting (see :help highlight-default)
" ====================================================
hi ColorColumn guifg=NONE guibg=#28241B gui=NONE
" Conceal"
" Cursor"
" CursorIM"
hi CursorColumn guifg=NONE guibg=#28241B gui=NONE
hi CursorLine guifg=NONE guibg=#28241B gui=NONE
hi Directory guifg=#8598C6 guibg=NONE gui=NONE
hi DiffAdd guifg=#a8a8a8 guibg=#3f593f gui=NONE
hi DiffChange guifg=#a8a8a8 guibg=#3f3f59 gui=NONE
hi DiffDelete guifg=#b39797 guibg=#733e3e gui=NONE
hi DiffText guifg=#a8a8a8 guibg=#594936 gui=NONE
hi ErrorMsg guifg=#E36660 guibg=NONE gui=bold
hi VertSplit guifg=NONE guibg=#171202 gui=NONE
hi Folded guifg=#8e8eb3 guibg=#272738 gui=NONE
hi FoldColumn guifg=NONE guibg=#171202 gui=NONE
hi SignColumn guifg=NONE guibg=#171202 gui=NONE
" Incsearch"
hi LineNr guifg=#5A4C44 guibg=#171202 gui=NONE
hi CursorLineNr guifg=#C4A277 guibg=#171202 gui=NONE
hi MatchParen guifg=NONE guibg=#283238 gui=NONE
hi ModeMsg guifg=#608F76 guibg=NONE gui=NONE
hi MoreMsg guifg=#608F76 guibg=NONE gui=NONE
hi NonText guifg=#5d5d5d guibg=NONE gui=NONE
hi Pmenu guifg=#947D72 guibg=#34312B gui=NONE
hi PmenuSel guifg=#96A6CF guibg=#283238 gui=NONE
hi PmenuSbar guifg=NONE guibg=#292621 gui=NONE
hi PmenuThumb guifg=NONE guibg=#283238 gui=NONE
hi Question guifg=#608F76 guibg=NONE gui=NONE
hi Search guifg=NONE guibg=#0A3615 gui=NONE
hi SpecialKey guifg=#5d5d5d guibg=NONE gui=NONE
hi SpellCap guifg=NONE guibg=#42421b gui=NONE
hi SpellLocal guifg=NONE guibg=#42421b gui=NONE
hi SpellRare guifg=NONE guibg=#42421b gui=NONE
hi SpellBad guifg=NONE guibg=#4d1313 gui=NONE
hi StatusLine guifg=NONE guibg=#171202 gui=NONE
hi StatusLineNC guifg=#5A4C44 guibg=#171202 gui=NONE
hi TabLine guifg=#5A4C44 guibg=#171202 gui=NONE
hi TabLineFill guifg=#5A4C44 guibg=#171202 gui=NONE
" TabLineSel"
hi Title guifg=#B48B5D guibg=NONE gui=NONE
hi Visual guifg=NONE guibg=#283238 gui=NONE
hi WarningMsg guifg=#B58B4E guibg=NONE gui=NONE
hi WildMenu guifg=#A686B2 guibg=#171202 gui=NONE

hi Normal guifg=#C2B7A9 guibg=#1F1B11 gui=NONE

" Quickfix window highlighting
hi link qfLineNr Function
hi link qfError Repeat
" qfFileName"

hi link yamlFlowMappingKey Function
hi link yamlBlockMappingKey Function
hi link yamlKeyValueDelimiter Operator
hi link dosiniLabel Function
hi rstHyperlinkTarget guifg=#608F76 guibg=NONE gui=underline

" Vim Syntax Highlighting
" =======================
hi link vimVar Identifier
hi link vimFunc Function
hi link vimSetSep Normal
hi link vimNotFunc Statement
hi link vimUserFunc Function
hi link helpSpecial Special
hi link vimCommand Repeat
hi link vimEnvvar Type
hi link vimOption Type
hi helpExample guifg=#806456 guibg=NONE gui=NONE
hi helpCommand guifg=#8A8A8A guibg=NONE gui=NONE
hi helpURL guifg=#608F76 guibg=NONE gui=underline
hi link helpHyperTextJump Type
hi link helpHyperTextEntry Type
hi link vimFgBgAttrib Constant
hi link vimHiAttrib Constant

" Python Syntax Highlighting
" ==========================
"  https://github.com/hdima/python-syntax
"  https://github.com/tweekmonster/django-plus.vim
hi link pythonClass Function
hi link pythonCoding Comment
hi link pythonRun Comment
hi pythonSelf guifg=#ABB6BA guibg=NONE gui=italic
hi link djangoQueryObject Function
hi link djangoModelField Function
hi link djangoModelsModule Normal
hi link jediFat Constant
hi pythonDocTest guifg=#557796 guibg=NONE gui=NONE
hi pythonDocTest2 guifg=#557796 guibg=NONE gui=NONE
hi pythonDocParam guifg=#69987F guibg=NONE gui=bold

" HTML Syntax Highlighting
" ========================
"  https://github.com/othree/html5.vim
hi link htmlTag Normal
hi link htmlEndTag Normal
hi link htmlTagName Repeat
hi link djangoVarBlock Normal
hi link djangoTagBlock Normal

" JavaScript Syntax Highlighting
" ==============================
"  https://github.com/pangloss/vim-javascript
"  https://github.com/othree/javascript-libraries-syntax.vim
hi link jsFunction Statement
hi link jsFuncCall Function
hi link jsonBraces Operator
hi link javascriptjQuery Function
hi link javascriptQCore javascriptjQuery
hi link javascriptQCoreObj javascriptjQuery
hi link javascriptQCoreData javascriptjQuery
hi link javascriptQUtilities javascriptjQuery
hi link javascriptQProperties javascriptjQuery
hi link javascriptQCoreAjax javascriptjQuery
hi link javascriptQAjax javascriptjQuery
hi link javascriptQAttributes Operator
hi link javascriptQCallbacks javascriptjQuery
hi link javascriptQCSS javascriptjQuery
hi link javascriptQData javascriptjQuery
hi link javascriptQDeferred javascriptjQuery
hi link javascriptQDimensions javascriptjQuery
hi link javascriptQEffects javascriptjQuery
hi link javascriptQEvents javascriptjQuery
hi link javascriptQManipulation javascriptjQuery
hi link javascriptQMiscellaneous javascriptjQuery
hi link javascriptQOffset javascriptjQuery
hi link javascriptQTraversing javascriptjQuery
hi link javascript_collections javascriptjQuery
hi link javascript_strings javascriptjQuery
hi link javascript_arrays javascriptjQuery
hi link javascript_functions javascriptjQuery
hi link javascript_objects javascriptjQuery
hi link javascript_chaining javascriptjQuery
hi link javascript_utility javascriptjQuery
hi link javascript_lodash javascriptjQuery
hi link javascript_math javascriptjQuery
hi link javascript_number javascriptjQuery
hi link javascriptBackbone javascriptjQuery
hi link javascriptBObjects javascriptjQuery
hi link javascriptBEvents javascriptjQuery
hi link javascriptBModel javascriptjQuery
hi link javascriptBCollection javascriptjQuery
hi link javascriptBRouter javascriptjQuery
hi link javascriptBHistory javascriptjQuery
hi link javascriptBSync javascriptjQuery
hi link javascriptBView javascriptjQuery
hi link javascriptBUtility javascriptjQuery
hi link javascriptBModelAttrs javascriptQAttributes
hi link javascriptBCollectionAttrs javascriptQAttributes
hi link javascriptBRouterAttrs javascriptQAttributes
hi link javascriptBSyncAttrs javascriptQAttributes
hi link javascriptBViewAttrs javascriptQAttributes
hi link javascriptReact javascriptjQuery
hi link javascriptRTop javascriptjQuery
hi link javascriptRComponent javascriptjQuery
hi link jsDomElemAttrs Operator
hi link jsDomElemFuncs Function
hi link jsHtmlElemAttrs Operator
hi link jsHtmlElemFuncs Function
hi link jsCssStyles Operator

" CSS Syntax Highlighting
" =======================
"  https://github.com/hail2u/vim-css3-syntax
" hi cssIdentifier
" hi cssProp
" hi cssAttributeSelector
" hi lessClass
" hi LessVariable

" Markdown Syntax Highlighting
" ============================
"  https://github.com/plasticboy/vim-markdown
hi mkdURL guifg=#8598c6 guibg=NONE gui=underline
hi mkdLinkDef guifg=#E36660 guibg=NONE gui=NONE
hi mkdLink guifg=#E36660 guibg=NONE gui=NONE
hi mkdDelimiter guifg=#E36660 guibg=NONE gui=NONE
hi mkdListItem guifg=#A686B2 guibg=NONE gui=NONE

" Shell Syntax Highlighting
" =============================
hi link shLoop shConditional
hi link shShellVariables Type
hi link shFunction Function

" XML Syntax Highlighting
" =============================
hi link xmlTag Repeat
hi link xmlTagName xmlTag
hi link xmlEndTag xmlTag

" Syntastic Syntax Highlighting
" =============================
hi SyntasticErrorSign guifg=#E36660 guibg=NONE gui=bold
hi SyntasticWarningSign guifg=#DD9460 guibg=NONE gui=bold

" Easy-Motion Syntax Highlighting
" ===============================
hi EasyMotionIncCursor guifg=#1F1B11 guibg=#725749 gui=NONE

" Startify Syntax Highlighting
" ============================
hi link StartifyNumber Repeat
hi link StartifySection String

" NERDTree Highlighting
" =====================
hi link  NERDTreeOpenable   String
hi link  NERDTreeClosable   String
hi link  NERDTreeHelp       Comment
hi link  NERDTreeUp         Comment
hi NERDTreeDirSlash guifg=#947d72 guibg=NONE gui=bold
hi NERDTreeDir guifg=#8598C6 guibg=NONE gui=bold
hi NERDTreeCWD guifg=#E36660 guibg=NONE gui=bold

" Tagbar Highlighting
" ===================
hi link  TagbarType   Statement
hi link  TagbarScope  Function

" License
" =======
" Copyright (c) 2016 monkoose
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
