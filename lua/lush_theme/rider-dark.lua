local lush = require("lush")
local hsl = lush.hsl

local green = hsl("#85C46C")
local blue = hsl("#6C95EB")
local purple = hsl("#C191FF")
local bright_magenta = hsl("#FFBFFE")
local bg_1 = hsl("#262626")
local bg_2 = hsl("#303030")
local bg_3 = hsl("#323232")
local bg_4 = hsl("#3b3b3b")
-- local grey_1 = hsl("#d0d0d0")
-- local grey_2 = hsl("#bdbdbd")
-- local grey_3 = hsl("#323232")

local default_text = hsl("#d0d0d0")
local secondary_text = hsl("#bdbdbd")
local default_bg = hsl("#262626")

local comment = green
local keyword = blue
local type = purple
local punct_delimiter = hsl("#bdbdbd")
local string = hsl("#C9A26D")
local string_regex = hsl("#FFD49E")
local method = hsl("#39CC8F")
local field = hsl("#66C3CC")
local number = hsl("#ED94C0")
local selection = hsl("#08335e")
local match = hsl("#D9B72B")
local diff_add = hsl("#29421F")
local diff_change = hsl("#293A5F")
local diff_delete = hsl("#BF3428")
local match_paren = hsl("#472B63")
local search_result = hsl("#484012")
local deprecated = hsl("#808080")

local error = hsl("#FF5647")
local warning = hsl("#D9B72B")
local info = hsl("#787878")
local hint = green
local todo = hsl("#66C3CC")

local class_kind = hsl("#e8a754")
local variable_kind = hsl("#75bcff")
local function_kind = hsl("#b180d3")
local unit_kind = hsl("#c3c3c3")

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()
	return {
		-- Custom highlight groups
		Selection({ bg = selection }),

		Comment({ fg = comment, gui = "italic" }),
		-- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
		-- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor       { }, -- character under the cursor
		-- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn({}), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- CursorLine   { }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = default_text }), -- directory names (and other special names in listings)
		DiffAdd({ fg = diff_add }), -- diff mode: Added line |diff.txt|
		DiffChange({ fg = diff_change }), -- diff mode: Changed line |diff.txt|
		DiffDelete({ fg = diff_delete }), -- diff mode: Deleted line |diff.txt|
		DiffText({}), -- diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer  { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor   { }, -- cursor in a focused terminal
		-- TermCursorNC { }, -- cursor in an unfocused terminal
		ErrorMsg({ fg = error }), -- error messages on the command line
		WarningMsg({ fg = warning }), -- warning messages
		VertSplit({ bg = bg_1, fg = bg_1 }), -- the column separating vertically split windows
		Folded({ bg = default_bg, fg = secondary_text.darken(40) }), -- line used for closed folds
		FoldColumn({}), -- 'foldcolumn'
		SignColumn({}), -- column where |signs| are displayed
		IncSearch({ Selection }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute   { }, -- |:substitute| replacement text highlighting
		-- LineNr       { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- CursorLineNr { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen({ bg = match_paren }), -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { }, -- Area for messages and cmdline
		-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg      { }, -- |more-prompt|
		NonText({ fg = default_bg }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ bg = default_bg, fg = default_text }), -- Normal text
		NormalFloat({ bg = bg_3, fg = default_text }), -- Normal text in floating windows.
		NormalSB({ NormalFloat }), -- Normal text in side bars
		-- NormalNC     { }, -- normal text in non-current windows
		Pmenu({ NormalFloat }), -- Popup menu: normal item.
		PmenuSel({ Selection }), -- Popup menu: selected item.
		-- PmenuSbar    { }, -- Popup menu: scrollbar.
		-- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
		-- Question     { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ bg = search_result }), -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		-- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine({ bg = bg_4 }), -- status line of current window
		-- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine      { }, -- tab pages line, not active tab page label
		-- TabLineFill  { }, -- tab pages line, where there are no labels
		-- TabLineSel   { }, -- tab pages line, active tab page label
		Title({ fg = keyword }), -- titles for output from ":set all", ":autocmd" etc.
		Visual({ Selection }), -- Visual mode selection
		-- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
		-- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- WildMenu     { }, -- current match in 'wildmenu' completion

		FloatBorder({ bg = bg_3, fg = bg_3 }),

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Keyword({ fg = keyword }), --  any other keyword
		-- Statement      { }, -- (preferred) any statement
		Conditional({ Keyword }), --  if, then, else, endif, switch, etc.
		Repeat({ Keyword }), --   for, do, while, etc.
		Label({ fg = field }), --    case, default, etc.
		Operator({ fg = punct_delimiter }), -- "sizeof", "+", "*", etc.
		Exception({ Keyword }), --  try, catch, throw

		Constant({ fg = secondary_text }), -- (preferred) any constant
		String({ fg = string }), --   a string constant: "this is a string"
		-- Character      { }, --  a character constant: 'c', '\n'
		Number({ fg = number }), --   a number constant: 234, 0xff
		Boolean({ Keyword }), --  a boolean constant: TRUE, false
		-- Float          { }, --    a floating point constant: 2.3e10

		PreProc({ fg = secondary_text }), -- (preferred) generic Preprocessor
		-- Include        { }, --  preprocessor #include
		-- Define         { }, --   preprocessor #define
		-- Macro          { }, --    same as Define
		-- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

		Type({ fg = type }), -- (preferred) int, long, char, etc.
		-- StorageClass   { }, -- static, register, volatile, etc.
		-- Structure      { }, --  struct, union, enum, etc.
		-- Typedef        { }, --  A typedef

		Identifier({ Type }), -- (preferred) any variable name
		Function({ fg = method }), -- function name (also: methods for classes)

		Special({ Keyword }), -- (preferred) any special symbol
		-- SpecialChar    { }, --  special character in a constant
		-- Tag            { }, --    you can use CTRL-] on this
		-- Delimiter      { }, --  character that needs attention
		-- SpecialComment { }, -- special things inside a comment
		-- Debug          { }, --    debugging statements

		-- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
		-- Bold       { gui = "bold" },
		-- Italic     { gui = "italic" },

		-- ("Ignore", below, may be invisible...)
		-- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

		-- Error          { }, -- (preferred) any erroneous construct
		Todo({ fg = default_bg, bg = todo }), -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- LspReferenceText { bg = c.lsp.ref_txt }, -- used for highlighting "text" references
		-- LspReferenceRead { link = 'LspReferenceText' }, -- used for highlighting "read" references
		-- LspReferenceWrite { link = 'LspReferenceText' }, -- used for highlighting "write" references
		LspDiagnosticsDefaultError({ fg = error }), -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultWarning({ fg = warning }), -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultInformation({ fg = info }), -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultHint({ fg = hint }), -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsUnderlineError({ gui = "undercurl", sp = error }), -- Used to underline "Error" diagnostics
		LspDiagnosticsUnderlineWarning({ gui = "undercurl", sp = warning }), -- Used to underline "Warning" diagnostics
		LspDiagnosticsUnderlineInformation({ gui = "undercurl", sp = info }), -- Used to underline "Information" diagnostics
		LspDiagnosticsUnderlineHint({ gui = "undercurl", sp = hint }), -- Used to underline "Hint" diagnostics

		-- LspDiagnosticsVirtualTextError { fg = c.error, bg = util.darken(c.error, 0.1) }, -- Used for "Error" diagnostic virtual text
		-- LspDiagnosticsVirtualTextWarning { fg = c.warning, bg = util.darken(c.warning, 0.1) }, -- Used for "Warning" diagnostic virtual text
		-- LspDiagnosticsVirtualTextInformation { fg = c.info, bg = util.darken(c.info, 0.1) }, -- Used for "Information" diagnostic virtual text
		-- LspDiagnosticsVirtualTextHint { fg = hint }, -- Used for "Hint" diagnostic virtual text

		LspDiagnosticsError({ fg = error }),
		LspDiagnosticsWarning({ fg = warning }),
		LspDiagnosticsInformation({ fg = info }),
		LspDiagnosticsHint({ fg = hint }),

		DiagnosticError({ LspDiagnosticsDefaultError }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ LspDiagnosticsDefaultWarning }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ LspDiagnosticsDefaultInformation }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ LspDiagnosticsDefaultHint }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticUnderlineError({ LspDiagnosticsUnderlineError }), -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn({ LspDiagnosticsUnderlineWarning }), -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo({ LspDiagnosticsUnderlineInformation }), -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint({ LspDiagnosticsUnderlineHint }), -- Used to underline "Hint" diagnostics.

		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.

		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.

		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

		-- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		TSAttribute({ Type }), -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
		TSBoolean({ Boolean }), -- Boolean literals: `True` and `False` in Python.
		-- TSCharacter          { } , -- Character literals: `'a'` in C.
		TSComment({ Comment }), -- Line comments and block comments.
		TSConditional({ Conditional }), -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
		-- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
		TSConstBuiltin({ Keyword }), -- Built-in constant values: `nil` in Lua.
		-- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
		TSConstructor({ Type }), -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
		-- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
		TSException({ Exception }), -- Exception related keywords: `try`, `except`, `finally` in Python.
		TSField({ fg = field }), -- Object and struct fields.
		-- TSFloat              { } , -- Floating-point number literals.
		TSFunction({ Function }), -- Function calls and definitions.
		TSFuncBuiltin({ Function }), -- Built-in functions: `print` in Lua.
		-- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
		TSInclude({ Keyword }), -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
		TSKeyword({ Keyword }), -- Keywords that don't fit into other categories.
		-- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
		TSKeywordOperator({ Keyword }), -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
		-- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
		TSLabel({ Label }), -- GOTO labels: `label:` in C, and `::label::` in Lua.
		TSMethod({ fg = method }), -- Method calls and definitions.
		TSNamespace({ Type }), -- Identifiers referring to modules and namespaces.
		-- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
		TSNumber({ Number }), -- Numeric literals that don't fit into other categories.
		TSOperator({ Operator }), -- Binary or unary operators: `+`, and also `->` and `*` in C.
		TSParameter({ fg = secondary_text }), -- Parameters of a function.
		-- TSParameterReference { } , -- References to parameters of a function.
		TSProperty({ TSField }), -- Same as `TSField`.
		TSPunctDelimiter({ fg = punct_delimiter }), -- Punctuation delimiters: Periods, commas, semicolons, etc.
		TSPunctBracket({ TSPunctDelimiter }), -- Brackets, braces, parentheses, etc.
		TSPunctSpecial({ TSPunctDelimiter }), -- Special punctuation that doesn't fit into the previous categories.
		TSRepeat({ Repeat }), -- Keywords related to loops: `for`, `while`, etc.
		TSString({ String }), -- String literals.
		TSStringRegex({ fg = string_regex }), -- Regular expression literals.
		-- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
		-- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
		-- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
		TSTag({ Type }), -- Tags like HTML tag names.
		TSTagAttribute({ TSField }), -- HTML tag attributes.
		TSTagDelimiter({ Type }), -- Tag delimiters like `<` `>` `/`.
		-- TSText               { } , -- Non-structured text. Like text in a markup language.
		-- TSStrong             { } , -- Text to be represented in bold.
		-- TSEmphasis           { } , -- Text to be represented with emphasis.
		-- TSUnderline          { } , -- Text to be represented with an underline.
		-- TSStrike             { } , -- Strikethrough text.
		-- TSTitle              { } , -- Text that is part of a title.
		-- TSLiteral            { } , -- Literal or verbatim text.
		-- TSURI                { } , -- URIs like hyperlinks or email addresses.
		-- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
		-- TSTextReference      { } , -- Footnotes, text references, citations, etc.
		-- TSEnvironment        { } , -- Text environments of markup languages.
		-- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
		-- TSNote               { } , -- Text representation of an informational note.
		-- TSWarning            { } , -- Text representation of a warning note.
		-- TSDanger             { } , -- Text representation of a danger note.
		TSType({ Type }), -- Type (and class) definitions and annotations.
		TSTypeBuiltin({ Keyword }), -- Built-in types: `i32` in Rust.
		TSVariable({ fg = secondary_text }), -- Variable names that don't fit into other categories.
		TSVariableBuiltin({ Keyword }), -- Variable names defined by the language: `this` or `self` in Javascript.

		-- nvim tree
		NvimTreeNormal({ NormalSB }),
		NvimTreeRootFolder({ fg = default_text, gui = "bold" }),

		-- telescope
		TelescopeBorder({ bg = bg_2, fg = bg_2 }),
		TelescopeNormal({ bg = bg_2, fg = default_text }),
		TelescopeSelection({ Visual }),

		-- fidget
		FidgetTitle({ fg = bright_magenta }),

		-- trouble
		TroubleNormal({ bg = bg_3 }),

		-- cmp
		CmpItemAbbrDeprecated({ fg = deprecated, gui = "strikethrough" }),
		CmpItemAbbrMatch({ fg = match }),
		CmpItemAbbrMatchFuzzy({ CmpItemAbbrMatch }),
		CmpItemKindVariable({ fg = variable_kind }),
		CmpItemKindInterface({ CmpItemKindVariable }),
		CmpItemKindText({ CmpItemKindVariable }),
		CmpItemKindFunction({ fg = function_kind }),
		CmpItemKindMethod({ CmpItemKindFunction }),
		CmpItemKindUnit({ fg = unit_kind }),
		CmpItemKindKeyword({ CmpItemKindUnit }),
		CmpItemKindProperty({ CmpItemKindUnit }),
	}
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
