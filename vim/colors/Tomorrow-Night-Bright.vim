" Tomorrow Night Bright - Full Colour and 256 Colour
" http://chriskempson.com
"
" Hex colour conversion functions borrowed from the theme "Desert256""
set background=dark
hi clear Normal " from default
set bg&

"" Default GUI Colours (my)
"let s:foreground = "ffffff"
""eaeaea"
"let s:background = "121212"
""colour233
"let s:selection = "585858"
""424242"
"let s:comment = "969896"
"let s:red = "d54e53"
"let s:orange = "ffa321"
"let s:yellow = "fff374"
""let s:yellow = "f8ff33"
"let s:green = "7FFA66"
"let s:purple = "d77dcd"
"let s:window = "4d5057"

"last active
let s:line = "3a3a3a" " vertical line at 80
let s:cursorline = "3a3a3a" 
"let s:green = "64DD64"
"let s:aqua = "33FFE7" 
"let s:blue = "729fcf"

" from jay colorscheme
"let s:orange = 'dfaf5f'
"let s:yellow = 'dfdf5f'
"let s:green =  '5fdf5f'
"let s:aqua =   '5fdfdf'
"let s:blue =   '5f87df'
let s:purple = 'af5fdf'
"last active
"let s:red =    'df5f5f'

" Default GUI Colours (TomorrowNightBright original) (good night theme)
"let s:foreground = "eaeaea"
"let s:background = "1B1D1E"
"last active
"let s:background = "000000"
"let s:foreground = "ffffff"
"let s:orange = "e78c45"
"let s:yellow = "e7c547"
"let s:purple = "c397d8"
let s:window = "4d5057"

" from NEON?
let s:foreground =   "f8f8f8"
let s:background =   "171717"
"!*.cursorColor:  f8f8f8
"let s:white =      "c2c0c0"
"let s:white =      "9d9b9b"
"let s:black =  "515151"
"let s:black =  "777474"
"let s:red =     "d81765"
let s:red =    "e54886"
let s:green =   "97d01a"
"let s:green =   "7bc436"
let s:orange =  "ffe300"
let s:yellow =  "e1c426"
let s:blue =    "16b1fb"
"let s:blue =    "289cd5"
"let s:purple = "f524ff"
"let s:purple =  "f124ff"
let s:cyan =    "0fdcb6"
let s:aqua =    "0a9b81"

let s:theme =    "0fdcb6"
let s:theme3 =    "0a9b81"
let s:theme2 =  "ffe300" " line numbers


" for almost black bkgr
"let s:selection = "424242"
let s:comment = "969896"
"let s:line = "2a2a2a"

" for lighter grey bkg
let s:selection = "8b8282"
"let s:comment = "8b8282"
"let s:comment = "e0dede"
"let s:line = "544f4f" "is turned off


"let s:green = "b9ca4a"
"let s:aqua = "70c0b1"
"let s:blue = "7aa6da"
"let s:red = "d54e53"

" theme colours
"005f87" "24
"005f5f
"87ffff" "123
"let s:search = "38002a"
"let s:search = "4d0039"
"let s:search = "4d004d"
"let s:theme3 = "d9ecc6"


"last active
"let s:theme = "005f5f" "193 dark saturated seledine (on bg=black)
"let s:theme2 = "dfffaf" "23 light seledine
"let s:theme3 = "00af87" "36 dark cold-greyish seledine (on bg=23)
let s:search = "666699"



hi clear
"syntax reset

let g:colors_name = "Tomorrow-Night-Bright"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
	" Returns an approximate grey index for the given grey level
	fun <SID>grey_number(x)
		if &t_Co == 88
			if a:x < 23
				return 0
			elseif a:x < 69
				return 1
			elseif a:x < 103
			    return 2
			elseif a:x < 127
				return 3
			elseif a:x < 150
				return 4
			elseif a:x < 173
				return 5
			elseif a:x < 196
				return 6
			elseif a:x < 219
				return 7
			elseif a:x < 243
				return 8
			else
				return 9
			endif
		else
			if a:x < 14
				return 0
			else
				let l:n = (a:x - 8) / 10
				let l:m = (a:x - 8) % 10
				if l:m < 5
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual grey level represented by the grey index
	fun <SID>grey_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 46
			elseif a:n == 2
				return 92
			elseif a:n == 3
				return 115
			elseif a:n == 4
				return 139
			elseif a:n == 5
				return 162
			elseif a:n == 6
				return 185
			elseif a:n == 7
				return 208
			elseif a:n == 8
				return 231
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 8 + (a:n * 10)
			endif
		endif
	endfun

	" Returns the palette index for the given grey index
	fun <SID>grey_colour(n)
		if &t_Co == 88
			if a:n == 0
				return 16
			elseif a:n == 9
				return 79
			else
				return 79 + a:n
			endif
		else
			if a:n == 0
				return 16
			elseif a:n == 25
				return 231
			else
				return 231 + a:n
			endif
		endif
	endfun

	" Returns an approximate colour index for the given colour level
	fun <SID>rgb_number(x)
		if &t_Co == 88
			if a:x < 69
				return 0
			elseif a:x < 172
				return 1
			elseif a:x < 230
				return 2
			else
				return 3
			endif
		else
			if a:x < 75
				return 0
			else
				let l:n = (a:x - 55) / 40
				let l:m = (a:x - 55) % 40
				if l:m < 20
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual colour level for the given colour index
	fun <SID>rgb_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 139
			elseif a:n == 2
				return 205
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 55 + (a:n * 40)
			endif
		endif
	endfun

	" Returns the palette index for the given R/G/B colour indices
	fun <SID>rgb_colour(x, y, z)
		if &t_Co == 88
			return 16 + (a:x * 16) + (a:y * 4) + a:z
		else
			return 16 + (a:x * 36) + (a:y * 6) + a:z
		endif
	endfun

	" Returns the palette index to approximate the given R/G/B colour levels
	fun <SID>colour(r, g, b)
		" Get the closest grey
		let l:gx = <SID>grey_number(a:r)
		let l:gy = <SID>grey_number(a:g)
		let l:gz = <SID>grey_number(a:b)

		" Get the closest colour
		let l:x = <SID>rgb_number(a:r)
		let l:y = <SID>rgb_number(a:g)
		let l:z = <SID>rgb_number(a:b)

		if l:gx == l:gy && l:gy == l:gz
			" There are two possibilities
			let l:dgr = <SID>grey_level(l:gx) - a:r
			let l:dgg = <SID>grey_level(l:gy) - a:g
			let l:dgb = <SID>grey_level(l:gz) - a:b
			let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
			let l:dr = <SID>rgb_level(l:gx) - a:r
			let l:dg = <SID>rgb_level(l:gy) - a:g
			let l:db = <SID>rgb_level(l:gz) - a:b
			let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
			if l:dgrey < l:drgb
				" Use the grey
				return <SID>grey_colour(l:gx)
			else
				" Use the colour
				return <SID>rgb_colour(l:x, l:y, l:z)
			endif
		else
			" Only one possibility
			return <SID>rgb_colour(l:x, l:y, l:z)
		endif
	endfun

	" Returns the palette index to approximate the 'rrggbb' hex string
	fun <SID>rgb(rgb)
		let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
		let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
		let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

		return <SID>colour(l:r, l:g, l:b)
	endfun

	" Sets the highlighting for the given group
	fun <SID>X(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfun


    " help highlighting
	call <SID>X("helpExample", s:aqua, "", "")
	call <SID>X("helpBar", s:red, "", "")
	call <SID>X("helpOption", s:blue, "", "")

	" Vim Highlighting
	"call <SID>X("Normal", s:foreground, s:background, "")
	call <SID>X("Normal", s:foreground, "", "")
	call <SID>X("LineNr", s:selection, "", "")
	call <SID>X("CursorLineNr", s:theme2, s:line, "bold")
    " CursorLineNr term=bold cterm=underline ctermfg=Yellow gui=bold guifg=Yellow
	call <SID>X("NonText", s:selection, "", "")
	call <SID>X("SpecialKey", s:selection, "", "")
	"call <SID>X("Search", s:background, s:yellow, "")
	call <SID>X("Search", s:foreground, s:search, "")
	call <SID>X("TabLine", s:window, s:foreground, "reverse")
	call <SID>X("TabLineFill", s:window, s:foreground, "reverse")
	"call <SID>X("StatusLine", s:theme, s:theme2, "bold")
	call <SID>X("StatusLine", s:theme, s:theme2, "none")
	call <SID>X("StatusLineNC", s:theme, s:theme2, "reverse")
	"call <SID>X("VertSplit", s:selection, s:background, "none")
	call <SID>X("VertSplit", s:selection, "", "none")
	call <SID>X("Visual", "", s:selection, "")
	call <SID>X("Directory", s:blue, "", "")
    call <SID>X("ModeMsg", s:theme, s:theme2, "")
	call <SID>X("MoreMsg", s:theme3, "", "")
	call <SID>X("Question", s:theme3, "", "")
	call <SID>X("WarningMsg", s:red, "", "")
	call <SID>X("MatchParen", "", s:selection, "")
	"call <SID>X("Folded", s:background, s:window, "")
	call <SID>X("Folded", "", s:window, "")
	"call <SID>X("FoldColumn", "", s:background, "")
	call <SID>X("FoldColumn", "", "", "")
	if version >= 700
		"autocmd InsertEnter * hi CursorLine ctermbg=237
		"autocmd InsertLeave * hi CursorLine ctermbg=24
		call <SID>X("CursorLine", "", s:cursorline, "none")
		"call <SID>X("CursorColumn", "", s:line, "none")
		"call <SID>X("CursorLine", "", "", "none") "s:line!
		call <SID>X("CursorColumn", "", "", "none")
		call <SID>X("PMenu", s:foreground, s:selection, "none")
		call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
		call <SID>X("SignColumn", "", s:background, "none")
	end
	if version >= 703
		call <SID>X("ColorColumn", "", s:line, "none")
		" moje
		"call <SID>X("ErrorMsg", s:orange, s:background, "bold")
		call <SID>X("ErrorMsg", s:orange, s:background, "none")

	end

	" Vim Highlighting
	call <SID>X("vimCommand", s:red, "", "none")

	" Standard Highlighting
	syn match AttentionFlag '#ATT'
	syn match DebuggingFlag '#DEB'
    call <SID>X("AttentionFlag", s:background, s:orange, "")
    call <SID>X("DebuggingFlag", s:background, s:aqua, "")
	call <SID>X("Comment", s:comment, "", "")
	call <SID>X("Todo", s:background, s:yellow, "")
	call <SID>X("Title", s:comment, "", "")
	call <SID>X("Identifier", s:red, "", "none")
	call <SID>X("Statement", s:purple, "", "")
	call <SID>X("Conditional", s:red, "", "")
	call <SID>X("Repeat", s:red, "", "")
	call <SID>X("Structure", s:purple, "", "")
	call <SID>X("Function", s:blue, "", "")
	call <SID>X("Constant", s:orange, "", "")
	call <SID>X("Keyword", s:orange, "", "")
	call <SID>X("String", s:green, "", "")
	call <SID>X("Special", s:foreground, "", "")
	call <SID>X("PreProc", s:aqua, "", "")
	call <SID>X("Operator", s:aqua, "", "none")
	call <SID>X("Type", s:blue, "", "none")
	call <SID>X("Define", s:purple, "", "none")
	call <SID>X("Include", s:blue, "", "")
	"call <SID>X("Ignore", "666666", "", "")
	call <SID>X("Delimiter", s:yellow, "", "")
	call <SID>X("Constant", s:purple, "", "")

	"R Highlighting (my)
	call <SID>X("rAssign", s:orange, "", "")
	call <SID>X("rDollar", s:orange, "", "")

	" Python Highlighting
    " these match all parens :(
	syn match pythonParens '('
	syn match pythonParens ')'
	syn match pythonParens '\['
	syn match pythonParens '\]'
	syn match pythonParens '{'
	syn match pythonParens '}'
	call <SID>X("pythonParens", s:yellow, "", "")
	call <SID>X("pythonInclude", s:purple, "", "")
	call <SID>X("pythonStatement", s:purple, "", "")
	call <SID>X("pythonConditional", s:red, "", "")
	call <SID>X("pythonRepeat", s:red, "", "")
	call <SID>X("pythonException", s:purple, "", "")
	call <SID>X("pythonFunction", s:blue, "", "")
	call <SID>X("pythonPreCondit", s:purple, "", "")
	call <SID>X("pythonExClass", s:orange, "", "")
	"call <SID>X("pythonParam", s:yellow, "", "")
	call <SID>X("pythonBuiltinObj", s:orange, "", "")
	call <SID>X("pythonDottedName", s:orange, "", "")
	call <SID>X("pythonDocstring", s:comment, "", "")

	" ImageJ macro Highlighting
	call <SID>X("ijmacroFunctions", s:purple, "", "")

	" C and C++ Highlighting
	call <SID>X("cType", s:yellow, "", "")
	call <SID>X("cStorageClass", s:purple, "", "")
	call <SID>X("cConditional", s:purple, "", "")
	call <SID>X("cRepeat", s:purple, "", "")
    call <SID>X("cParen", s:blue, "", "")
    call <SID>X("cBracket", s:blue, "", "")
    call <SID>X("cBlock", s:blue, "", "")

	" PHP Highlighting
	call <SID>X("phpVarSelector", s:red, "", "")
	call <SID>X("phpKeyword", s:purple, "", "")
	call <SID>X("phpRepeat", s:purple, "", "")
	call <SID>X("phpConditional", s:purple, "", "")
	call <SID>X("phpStatement", s:purple, "", "")
	call <SID>X("phpMemberSelector", s:foreground, "", "")

	" Ruby Highlighting
	call <SID>X("rubySymbol", s:green, "", "")
	call <SID>X("rubyConstant", s:yellow, "", "")
	call <SID>X("rubyAccess", s:yellow, "", "")
	call <SID>X("rubyAttribute", s:blue, "", "")
	call <SID>X("rubyInclude", s:blue, "", "")
	call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
	call <SID>X("rubyCurlyBlock", s:orange, "", "")
	call <SID>X("rubyStringDelimiter", s:green, "", "")
	call <SID>X("rubyInterpolationDelimiter", s:orange, "", "")
	call <SID>X("rubyConditional", s:purple, "", "")
	call <SID>X("rubyRepeat", s:purple, "", "")
	call <SID>X("rubyControl", s:purple, "", "")
	call <SID>X("rubyException", s:purple, "", "")

	" Crystal Highlighting
	call <SID>X("crystalSymbol", s:green, "", "")
	call <SID>X("crystalConstant", s:yellow, "", "")
	call <SID>X("crystalAccess", s:yellow, "", "")
	call <SID>X("crystalAttribute", s:blue, "", "")
	call <SID>X("crystalInclude", s:blue, "", "")
	call <SID>X("crystalLocalVariableOrMethod", s:orange, "", "")
	call <SID>X("crystalCurlyBlock", s:orange, "", "")
	call <SID>X("crystalStringDelimiter", s:green, "", "")
	call <SID>X("crystalInterpolationDelimiter", s:orange, "", "")
	call <SID>X("crystalConditional", s:purple, "", "")
	call <SID>X("crystalRepeat", s:purple, "", "")
	call <SID>X("crystalControl", s:purple, "", "")
	call <SID>X("crystalException", s:purple, "", "")

	" JavaScript Highlighting
	call <SID>X("javaScriptBraces", s:foreground, "", "")
	call <SID>X("javaScriptFunction", s:purple, "", "")
	call <SID>X("javaScriptConditional", s:purple, "", "")
	call <SID>X("javaScriptRepeat", s:purple, "", "")
	call <SID>X("javaScriptNumber", s:orange, "", "")
	call <SID>X("javaScriptMember", s:orange, "", "")
	call <SID>X("javascriptNull", s:orange, "", "")
	call <SID>X("javascriptGlobal", s:blue, "", "")
	call <SID>X("javascriptStatement", s:red, "", "")

	" CoffeeScript Highlighting
	call <SID>X("coffeeRepeat", s:purple, "", "")
	call <SID>X("coffeeConditional", s:purple, "", "")
	call <SID>X("coffeeKeyword", s:purple, "", "")
	call <SID>X("coffeeObject", s:yellow, "", "")

	" HTML Highlighting
	call <SID>X("htmlTag", s:red, "", "")
	call <SID>X("htmlTagName", s:red, "", "")
	call <SID>X("htmlArg", s:red, "", "")
	call <SID>X("htmlScriptTag", s:red, "", "")

	" Diff Highlighting
	call <SID>X("diffAdd", "", "4c4e39", "")
	call <SID>X("diffDelete", s:background, s:red, "")
	call <SID>X("diffChange", "", "2B5B77", "")
	call <SID>X("diffText", s:line, s:blue, "")

	" ShowMarks Highlighting
	call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
	call <SID>X("ShowMarksHLo", s:purple, s:background, "none")
	call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
	call <SID>X("ShowMarksHLm", s:aqua, s:background, "none")

	" Lua Highlighting
	call <SID>X("luaStatement", s:purple, "", "")
	call <SID>X("luaRepeat", s:purple, "", "")
	call <SID>X("luaCondStart", s:purple, "", "")
	call <SID>X("luaCondElseif", s:purple, "", "")
	call <SID>X("luaCond", s:purple, "", "")
	call <SID>X("luaCondEnd", s:purple, "", "")

	" Cucumber Highlighting
	call <SID>X("cucumberGiven", s:blue, "", "")
	call <SID>X("cucumberGivenAnd", s:blue, "", "")

	" Go Highlighting
	call <SID>X("goDirective", s:purple, "", "")
	call <SID>X("goDeclaration", s:purple, "", "")
	call <SID>X("goStatement", s:purple, "", "")
	call <SID>X("goConditional", s:purple, "", "")
	call <SID>X("goConstants", s:orange, "", "")
	call <SID>X("goTodo", s:yellow, "", "")
	call <SID>X("goDeclType", s:blue, "", "")
	call <SID>X("goBuiltins", s:purple, "", "")
	call <SID>X("goRepeat", s:purple, "", "")
	call <SID>X("goLabel", s:purple, "", "")

	" Clojure Highlighting
	call <SID>X("clojureConstant", s:orange, "", "")
	call <SID>X("clojureBoolean", s:orange, "", "")
	call <SID>X("clojureCharacter", s:orange, "", "")
	call <SID>X("clojureKeyword", s:green, "", "")
	call <SID>X("clojureNumber", s:orange, "", "")
	call <SID>X("clojureString", s:green, "", "")
	call <SID>X("clojureRegexp", s:green, "", "")
	call <SID>X("clojureParen", s:aqua, "", "")
	call <SID>X("clojureVariable", s:yellow, "", "")
	call <SID>X("clojureCond", s:blue, "", "")
	call <SID>X("clojureDefine", s:purple, "", "")
	call <SID>X("clojureException", s:red, "", "")
	call <SID>X("clojureFunc", s:blue, "", "")
	call <SID>X("clojureMacro", s:blue, "", "")
	call <SID>X("clojureRepeat", s:blue, "", "")
	call <SID>X("clojureSpecial", s:purple, "", "")
	call <SID>X("clojureQuote", s:blue, "", "")
	call <SID>X("clojureUnquote", s:blue, "", "")
	call <SID>X("clojureMeta", s:blue, "", "")
	call <SID>X("clojureDeref", s:blue, "", "")
	call <SID>X("clojureAnonArg", s:blue, "", "")
	call <SID>X("clojureRepeat", s:blue, "", "")
	call <SID>X("clojureDispatch", s:blue, "", "")

	" Scala Highlighting
	call <SID>X("scalaKeyword", s:purple, "", "")
	call <SID>X("scalaKeywordModifier", s:purple, "", "")
	call <SID>X("scalaOperator", s:blue, "", "")
	call <SID>X("scalaPackage", s:red, "", "")
	call <SID>X("scalaFqn", s:foreground, "", "")
	call <SID>X("scalaFqnSet", s:foreground, "", "")
	call <SID>X("scalaImport", s:purple, "", "")
	call <SID>X("scalaBoolean", s:orange, "", "")
	call <SID>X("scalaDef", s:purple, "", "")
	call <SID>X("scalaVal", s:purple, "", "")
	call <SID>X("scalaVar", s:aqua, "", "")
	call <SID>X("scalaClass", s:purple, "", "")
	call <SID>X("scalaObject", s:purple, "", "")
	call <SID>X("scalaTrait", s:purple, "", "")
	call <SID>X("scalaDefName", s:blue, "", "")
	call <SID>X("scalaValName", s:foreground, "", "")
	call <SID>X("scalaVarName", s:foreground, "", "")
	call <SID>X("scalaClassName", s:foreground, "", "")
	call <SID>X("scalaType", s:yellow, "", "")
	call <SID>X("scalaTypeSpecializer", s:yellow, "", "")
	call <SID>X("scalaAnnotation", s:orange, "", "")
	call <SID>X("scalaNumber", s:orange, "", "")
	call <SID>X("scalaDefSpecializer", s:yellow, "", "")
	call <SID>X("scalaClassSpecializer", s:yellow, "", "")
	call <SID>X("scalaBackTick", s:green, "", "")
	call <SID>X("scalaRoot", s:foreground, "", "")
	call <SID>X("scalaMethodCall", s:blue, "", "")
	call <SID>X("scalaCaseType", s:yellow, "", "")
	call <SID>X("scalaLineComment", s:comment, "", "")
	call <SID>X("scalaComment", s:comment, "", "")
	call <SID>X("scalaDocComment", s:comment, "", "")
	call <SID>X("scalaDocTags", s:comment, "", "")
	call <SID>X("scalaEmptyString", s:green, "", "")
	call <SID>X("scalaMultiLineString", s:green, "", "")
	call <SID>X("scalaUnicode", s:orange, "", "")
	call <SID>X("scalaString", s:green, "", "")
	call <SID>X("scalaStringEscape", s:green, "", "")
	call <SID>X("scalaSymbol", s:orange, "", "")
	call <SID>X("scalaChar", s:orange, "", "")
	call <SID>X("scalaXml", s:green, "", "")
	call <SID>X("scalaConstructorSpecializer", s:yellow, "", "")
	call <SID>X("scalaBackTick", s:blue, "", "")

	" Git
	call <SID>X("diffAdded", s:green, "", "")
	call <SID>X("diffRemoved", s:red, "", "")
	"call <SID>X("gitcommitSummary", "", "", "bold")
	call <SID>X("gitcommitSummary", "", "", "none")

	" Delete Functions
	delf <SID>X
	delf <SID>rgb
	delf <SID>colour
	delf <SID>rgb_colour
	delf <SID>rgb_level
	delf <SID>rgb_number
	delf <SID>grey_colour
	delf <SID>grey_level
	delf <SID>grey_number
endif

