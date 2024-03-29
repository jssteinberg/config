local lush = require("lush")
local hsl = lush.hsl

-- @arg {string} color - color name or color util name
-- @arg {string} [variant] - "bg", other truthy for emphasized, nil for base
local color = function(color, variant)
	local hue = 247.3

	local sa, sa2, li, li2, li2_2, sa3, li3, li_id

	vim.o.background = "dark"
	sa = 42
	li = 55
	li2 = 72.5
	li3 = 30 -- background
	-- else
	-- 	vim.o.background = "light"
	-- 	sa = 42
	-- 	li = 55
	-- 	sa2 = 95
	-- 	li2 = 40
	-- 	li2_2 = 27.5
	-- 	-- bg colors, but TODO: separate on full line bg and subline bg
	-- 	sa3 = 79
	-- 	li3 = 90
	-- 	-- id colors
	-- 	li_id = 27.5
	-- end

	-- Colors { base, emphasized, background }
	-- base colors
	local colors = {
		-- terminal color keys
		bg      = { hsl(hue, sa, 7) },
		fg      = { hsl(hue, 17.8, 91), hsl("#ffffff") },
		black   = { hsl(hue, 17.8, li2), hsl("#000000") }, -- add 2 index color
		red     = { hsl(6.9, sa, li), hsl(7.5, sa2, li2), hsl(6.9, sa3, li3) }, -- add 2 index color
		green   = { hsl(97.5, sa, li), hsl(105.7, sa2, li2_2), hsl(97.5, sa3, li3) }, -- add 2 index color
		yellow  = { hsl(37.5, sa, li), hsl(68, sa2, li2_2), hsl(68, sa3, 92.5) }, -- add 2 index color
		blue    = { hsl(217.5, sa, li), hsl(217.5, sa2, li2), hsl(217.5, sa3, li3) }, -- add 2 index color
		magenta = { hsl(hue, sa, li), hsl(hue, sa2, li2), hsl(hue, sa3, 92.5) }, -- add 2 index color
		cyan    = { hsl(187.3, sa, li), hsl(187.5, sa2, li2), hsl(187.3, sa3, li3) }, -- add 2 index color
		white   = { hsl("#afacc5"), hsl("#e5f2e0"), hsl("#ffffff") }, -- add 2 index color
		-- additional color keys
		violet  = { hsl(277.5, sa, li), hsl(277.5, sa2, li2), hsl(277.5, sa, li3) },
	}
	-- Colors by utility
	colors.comment = colors.violet
	colors.error = { colors.red[1] }
	colors.warning = { colors.yellow[1] }
	colors.id = { hsl(97.5, sa2, li_id), hsl(187.3, sa2, li_id) }

	if variant and variant == "bg" and #colors[color] == 3 then
		-- return background variant
		return colors[color][3]
	elseif not variant or #colors[color] == 1 then
		-- return base color variant if missing index
		return colors[color][1]
	else
		-- return variant index if string is not "bg" and index is not 1
		return colors[color][variant]
	end
end

vim.g.terminal_color_0 = color("black")
vim.g.terminal_color_1 = color("red", 2)
vim.g.terminal_color_2 = color("green", 2)
vim.g.terminal_color_3 = color("yellow", 2)
vim.g.terminal_color_4 = color("blue", 2)
vim.g.terminal_color_5 = color("magenta", 2)
vim.g.terminal_color_6 = color("cyan", 2)
vim.g.terminal_color_7 = color("white")
vim.g.terminal_color_8 = color("black", 2)
vim.g.terminal_color_9 = color("red", 2)
vim.g.terminal_color_10 = color("green", 2)
vim.g.terminal_color_11 = color("yellow", 2)
vim.g.terminal_color_12 = color("blue", 2)
vim.g.terminal_color_13 = color("magenta", 2)
vim.g.terminal_color_14 = color("cyan", 2)
vim.g.terminal_color_15 = color("white", 2)
vim.g.terminal_color_background = color("magenta", "bg")
vim.g.terminal_color_foreground = color("fg")

local theme = lush(function()
	return {
		Normal { bg = color("bg"), fg = color("fg", 2) },
		Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
		Bold { gui = "bold" },
		Italic { gui = "italic" },
		Title { fg = color("fg"), gui = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
		Comment { fg = color("comment", 2) },
		Todo { fg = color("comment", 2), gui = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Error { fg = color("red") }, -- (preferred) any erroneous construct
		ErrorMsg { Error }, -- error messages on the command line
		WarningMsg { fg = color("warning") }, -- warning messages

		-- UI

		-- necessities
		LineNr { fg = color("white") },
		SignColumn { LineNr }, -- column where |signs| are displayed
		ColorColumn { bg = color("red").li(90) }, -- used for the columns set with 'colorcolumn'
		CursorLine { bg = color("yellow", "bg") },
		CursorLineNr { CursorLine },
		CursorColumn { bg = CursorLine.bg.li(10) },
		NonText { LineNr }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Conceal {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		WinSeparator { fg = color("magenta", "bg") },
		StatusLine { bg = WinSeparator.fg, fg = color("magenta", 2) },
		StatusLineNC { StatusLine, fg = color("magenta") },
		TabLine { StatusLineNC }, -- tab pages line, not active tab page label
		TabLineFill { TabLine }, -- tab pages line, where there are no labels
		TabLineSel { StatusLine }, -- tab pages line, active tab page label
		WinBar { TabLineSel },
		WinBarNC { LineNr },
		Pmenu { StatusLineNC }, -- Popup menu: normal item.
		PmenuSel { StatusLine }, -- Popup menu: selected item.
		PmenuThumb { bg = Pmenu.fg }, -- Popup menu: Thumb of the scrollbar.
		PmenuSbar { Pmenu }, -- Popup menu: scrollbar.
		WildMenu { Pmenu }, -- current match in 'wildmenu' completion
		Visual { bg = color("red", "bg") },
		Search { bg = color("blue", "bg") },
		IncSearch { bg = color("blue", "bg"), gui = "bold" },
		MatchParen { bg = color("comment", "bg") },
		Directory { fg = color("blue"), gui = "bold" }, -- directory names (and other special names in listings)
		Question { Bold }, -- |hit-enter| prompt and yes/no questions
		SpecialKey { LineNr }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		Folded { Comment, bg = color("magenta", "bg") }, -- line used for closed folds
		FoldColumn { Comment }, -- 'foldcolumn'
		MoreMsg { Bold }, -- |more-prompt|
		Substitute {}, -- |:substitute| replacement text highlighting
		ModeMsg {}, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea {}, -- Area for messages and cmdline
		SpellBad { fg = color("red", 2) }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap { SpellBad }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

		-- diff
		DiffAdd { fg = color("green", 2), gui = "bold" }, -- diff mode: Added line |diff.txt|
		DiffChange { Normal }, -- diff mode: Changed line |diff.txt|
		DiffDelete { fg = color("red", 2) }, -- diff mode: Deleted line |diff.txt|
		DiffText { DiffAdd }, -- diff mode: Changed text within a changed line |diff.txt|
		gitDiff { fg = color("magenta") },
		diffAdded { DiffAdd },
		diffRemoved { DiffDelete },

		-- LSP
		DiagnosticError { Error }, -- used for "Error" diagnostic virtual text
		DiagnosticWarn { fg = color("magenta") }, -- used for "Warning" diagnostic virtual text
		DiagnosticInfo { fg = color("magenta") }, -- used for "Information" diagnostic virtual text
		DiagnosticHint { fg = color("magenta") }, -- used for "Hint" diagnostic virtual text
		LspReferenceText {}, -- used for highlighting "text" references
		LspReferenceRead {}, -- used for highlighting "read" references
		LspReferenceWrite {}, -- used for highlighting "write" references

		-- Leap
		-- LeapMatch { IncSearch },
		-- LeapLabelPrimary { IncSearch },

		-- Telescope
		TelescopeNormal { Normal },

		-- Vim Illuminated
		IlluminatedWordText { bg = color("green", "bg") },
		IlluminatedWordRead { IlluminatedWordText },
		IlluminatedWordWrite { IlluminatedWordText },

		--markid
		markid1 { gui = "bold", fg = color("magenta", 2) },
		markid2 { gui = "bold", fg = color("blue", 2) },
		markid3 { gui = "bold", fg = color("magenta") },
		-- markid4 { gui = "bold", fg = color("cyan", 2) },

		-- Mini.nvim
		MiniIndentscopeSymbol { LineNr },

		-- Neo-tree
		NeoTreeNormal { fg = color("magenta") },
		NeoTreeDimText { fg = color("white") },
		NeoTreeIndentMarker { LineNr },
		NeoTreeSymbolicLinkTarget { fg = color("cyan", 2) },
		NeoTreeDotfile { NeoTreeDimText },
		NeoTreeExpander { link = "NeoTreeDirectoryIcon" },
		NeoTreeGitConflict { WarningMsg },
		NeoTreeGitConflict { WarningMsg },
		NeoTreeGitUntracked { fg = color("magenta") },
		NeoTreeRootName { Directory },
		NeoTreeTitleBar { StatusLine },

		-- Treesitter context
		TreesitterContext { bg = StatusLine.bg },
		TreesitterContextLineNumber { fg = StatusLine.fg },

		-- Cursor {}, -- character under the cursor
		-- lCursor {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM {}, -- like Cursor, but used when in IME mode |CursorIM|
		-- TermCursor {}, -- cursor in a focused terminal
		-- TermCursorNC {}, -- cursor in an unfocused terminal
		-- NormalNC {}, -- normal text in non-current windows

		Constant {}, -- (preferred) any constant
		String {}, --   a string constant: "this is a string"
		Character {}, --  a character constant: 'c', '\n'
		Number {}, --   a number constant: 234, 0xff
		Boolean {}, --  a boolean constant: TRUE, false
		Float {}, --    a floating point constant: 2.3e10

		Identifier {}, -- (preferred) any variable name
		Function {}, -- function name (also: methods for classes)

		Statement {}, -- (preferred) any statement
		Conditional { fg = color("blue", 2) }, --  if, then, else, endif, switch, etc.
		Repeat {}, --   for, do, while, etc.
		Label {}, --    case, default, etc.
		Operator { fg = color("blue", 2) }, -- "sizeof", "+", "*", etc.
		Keyword { fg = color("blue", 2) }, --  any other keyword
		Exception {}, --  try, catch, throw

		PreProc { fg = color("blue", 2) }, -- (preferred) generic Preprocessor
		Include {}, --  preprocessor #include
		Define {}, --   preprocessor #define
		Macro {}, --    same as Define
		PreCondit {}, --  preprocessor #if, #else, #endif, etc.

		Type { fg = color("magenta", 2) }, -- (preferred) int, long, char, etc.
		StorageClass {}, -- static, register, volatile, etc.
		Structure { fg = color("blue", 2) }, --  struct, union, enum, etc.
		Typedef {}, --  A typedef

		Special {}, -- (preferred) any special symbol
		SpecialChar {}, --  special character in a constant
		Tag { Type }, --    you can use CTRL-] on this
		Delimiter { Structure }, --  character that needs attention
		SpecialComment {}, -- special things inside a comment
		Debug {}, --    debugging statements

		TSInclude { fg = color("magenta") }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSMethod {}, -- For method calls and definitions.
		TSProperty {}, -- Same as `TSField`.
		TSTag { Tag }, -- Same as `TSField`.
		-- TSVariable { fg = color("blue", 2) }, -- Any variable name that does not have another highlight.
		-- TSVariableBuiltin { fg = color("blue", 2) }, -- Variable names that are defined by the languages, like `this` or `self`.

		htmlArg { TSProperty },
		htmlTagName { Tag },
		htmlTag { htmlArg },
		htmlEndTag { htmlTag },
		cssTagName { htmlTagName },
		-- cssAttributeSelector { htmlArg },
		-- cssClassName { String },
		-- cssTSProperty { String },
		-- cssTSString { Tag },
	}
end)

local theme_WIP = (function()
	return {

		-- We can also mix colours together
		Type { fg = Normal.fg.mix(LineNr.fg, 30) },

		-- ("Ignore", below, may be invisible...)
		Ignore {}, -- (preferred) left blank, hidden  |hl-Ignore|

		-- These groups are for the neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may change.
		-- By default, most of these groups link to an appropriate Vim group,
		-- TSError -> Error for example, so you do not have to define these unless
		-- you explicitly want to support Treesitter's improved syntax awareness.

		-- TSError              { }, -- For syntax/parser errors.
		-- TSPunctDelimiter     { }, -- For delimiters ie: `.`
		-- TSPunctBracket       { }, -- For brackets and parens.
		-- TSPunctSpecial       { }, -- For special punctutation that does not fall in the catagories before.
		-- TSConstant           { }, -- For constants
		-- TSConstBuiltin       { }, -- For constant that are built in the language: `nil` in Lua.
		-- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
		-- TSString             { }, -- For strings.
		-- TSStringRegex        { }, -- For regexes.
		-- TSStringEscape       { }, -- For escape characters within a string.
		-- TSCharacter          { }, -- For characters.
		-- TSNumber             { }, -- For integers.
		-- TSBoolean            { }, -- For booleans.
		-- TSFloat              { }, -- For floats.
		-- TSFunction           { }, -- For function (calls and definitions).
		-- TSFuncBuiltin        { }, -- For builtin functions: `table.insert` in Lua.
		-- TSFuncMacro          { }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		-- TSParameter          { }, -- For parameters of a function.
		-- TSParameterReference { }, -- For references to parameters of a function.
		-- TSField              { }, -- For fields.
		-- TSConstructor        { }, -- For constructor calls and definitions: `                                                                       { }` in Lua, and Java constructors.
		-- TSConditional        { }, -- For keywords related to conditionnals.
		-- TSRepeat             { }, -- For keywords related to loops.
		-- TSLabel              { }, -- For labels: `label:` in C and `:label:` in Lua.
		-- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
		-- TSKeyword            { }, -- For keywords that don't fall in previous categories.
		-- TSKeywordFunction    { }, -- For keywords used to define a fuction.
		-- TSException          { }, -- For exception related keywords.
		-- TSType               { }, -- For types.
		-- TSTypeBuiltin        { }, -- For builtin types (you guessed it, right ?).
		-- TSNamespace          { }, -- For identifiers referring to modules and namespaces.
		-- TSAnnotation         { }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		-- TSText               { }, -- For strings considered text in a markup language.
		-- TSStrong             { }, -- For text to be represented with strong.
		-- TSEmphasis           { }, -- For text to be represented with emphasis.
		-- TSUnderline          { }, -- For text to be represented with an underline.
		-- TSTitle              { }, -- Text that is part of a title.
		-- TSLiteral            { }, -- Literal text.
		-- TSURI                { }, -- Any URI like a link or email.
	}
end)

-- export-external
--
-- Integrating Lush with other tools:
--
-- By default, lush() actually returns your theme in parsed form. You can
-- interact with it in much the same way as you can inside a lush-spec.
--
-- This looks something like:
--
--   local theme = lush(function()
--     return {
--       Normal { fg = hsl(0, 100, 50) },
--       CursorLine { Normal },
--     }
--   end)
--
--   theme.Normal.fg()                     -- returns table {h = h, s = s, l = l}
--   tostring(theme.Normal.fg)             -- returns "#hexstring"
--   tostring(theme.Normal.fg.lighten(10)) -- you can still modify colours, etc
--
-- This means you can `require('my_lush_file')` in any lua code to access your
-- themes's color information.
--
-- Note:
--
-- "Linked" groups do not expose their colours, you can find the key
-- of their linked group via the 'link' key (may require chaining)
--
--   theme.CursorLine.fg() -- This is bad!
--   theme.CursorLine.link   -- = "Normal"
--
-- Also Note:
--
-- Most plugins expose their own Highlight groups, which *should be the primary
-- method for setting theme colours*, there are however some plugins that
-- require adjustments to a global or configuration variable.
--
-- To set a global variable, use neovims lua bridge,
--
--   vim.g.my_plugin.color_for_widget = theme.Normal.fg.hex
--
-- An example of where you may use this, might be to configure Lightline. See
-- the examples folder for two styles of this.
--
-- Exporting your theme beyond Lush:
--
-- If you wish to use your theme in Vim, or without loading lush, you may export
-- your theme via `lush.export_to_buffer(parsed_lush_spec)`. The readme has
-- further details on how to do this.

-- return our parsed theme for extension or use else where.
return theme
