local lush = require('lush')
local hsl = lush.hsl

-- {string} color - color name or color util name
-- {string} [variant] - "bg", other truthy for emphasized, nil for base
local color = function(color, variant)
	local dark = false
	local hue = 247.3
	local sa = 42
	-- base, strong
	local hues = {
		black     = { hue, 37.5 },
		red       = { hue, 68 },
		green     = { 6.9, 217.5 },
		yellow    = { 7.5, 217.5 },
		blue      = { 97.5, hue },
		magenta   = { 105.7, hue },
		cyan      = { 37.5, 187.3 },
		white     = { 68, 187.5 },
		-- extras
		violet    = { 277.5, 277.5 },
		selection = { 277.5 },
		sel       = { 37.5 }
	}

	local li2, li3, bg, fg

	if dark then
		vim.o.background = "dark"
		li2 = 72.5
		li3 = 30 -- background
		bg = { hsl("#121118") }
		fg = { hsl("#e5f2e0") }
	else
		vim.o.background = "light"
		li2 = 30
		li3 = 80
		bg = { hsl("#ffffff"), hsl("#e5f2e0") }
		fg = { hsl("#121118") }
	end

	-- Colors { base, emphasized, background }
	-- base colors
	local colors = {
		-- terminal color keys
		bg      = bg,
		fg      = fg,
		black   = { hsl("#1a1636"), hsl("#7d78a1") }, -- add 2 index color
		red     = { hsl("#bc675c"), hsl(hues.red[2], sa, li2) }, -- add 2 index color
		green   = { hsl("#80bc5c"), hsl(hues.green[2], sa, li2) }, -- add 2 index color
		yellow  = { hsl("#bc985c"), hsl(hues.yellow[2], sa, li2) }, -- add 2 index color
		blue    = { hsl("#5c80bc"), hsl(hues.blue[2], sa, li2) }, -- add 2 index color
		magenta = { hsl("#685cbc"), hsl(hue, sa, li2) }, -- add 2 index color
		cyan    = { hsl("#5cb1bc"), hsl(hues.cyan[2], sa, li2) }, -- add 2 index color
		white   = { hsl("#afacc5"), hsl("#e5f2e0") }, -- add 2 index color
		-- additional color keys
		violet  = { hsl("#985cbc"), hsl(hues.violet[2], sa, li2) },
	}
	-- Colors by utility
	colors.comment = { colors.violet[1], colors.violet[2] }
	colors.error = { colors.red[1] }
	colors.selection = { bg = colors.violet.bg }
	colors.warning = { colors.yellow[1] }
	colors.sel = { colors.black[2], colors.magenta[2] }

	if variant and variant == "bg" then
		-- return background variant
		return hsl(hues[color][1], sa, li3)
	elseif not variant or #colors[color] == 1 then
		-- return base color variant if missing index
		return colors[color][1]
	else
		-- return emphasized variant if string is not "bg" and has index 2
		return colors[color][2]
	end
end


local theme = lush(function()
	return {
		Normal { bg = color("bg"), fg = color("fg") },
		Comment { fg = color("comment") },
		Todo { fg = color("comment", 2), gui = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- UI
		CursorLine { bg = color("bg", 2) },
		Visual { bg = color("selection", "bg") },
		LineNr { fg = color("sel") },
		CursorLineNr { CursorLine, fg = color("sel", 2) },
		Search { bg = color("blue", "bg") },
		ColorColumn { bg = color("black", "bg") }, -- used for the columns set with 'colorcolumn'
		-- Conceal { fg = color("comment", 2), gui = "bold" }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor {}, -- character under the cursor
		-- lCursor {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM {}, -- like Cursor, but used when in IME mode |CursorIM|
		-- Directory {}, -- directory names (and other special names in listings)
		-- DiffAdd {}, -- diff mode: Added line |diff.txt|
		-- DiffChange {}, -- diff mode: Changed line |diff.txt|
		-- DiffDelete {}, -- diff mode: Deleted line |diff.txt|
		-- DiffText {}, -- diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer {}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor {}, -- cursor in a focused terminal
		-- TermCursorNC {}, -- cursor in an unfocused terminal
		-- ErrorMsg {}, -- error messages on the command line
		-- Substitute {}, -- |:substitute| replacement text highlighting
		-- MatchParen { bg = color("black", 2), gui = "italic" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg {}, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea {}, -- Area for messages and cmdline
		-- MsgSeparator {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg {}, -- |more-prompt|
		-- NonText {}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		-- NormalNC {}, -- normal text in non-current windows
		-- Pmenu { bg = color("black", "bg"), fg = color("gray") }, -- Popup menu: normal item.
		-- Question { fg = color("yellow") }, -- |hit-enter| prompt and yes/no questions
		-- SpecialKey {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad {}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap {}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		-- StatusLine { bg = color("black", 2), fg = color("magenta", 2) }, -- status line of current window
		-- TabLine { fg = color("sel") }, -- tab pages line, not active tab page label
		-- TabLineFill {}, -- tab pages line, where there are no labels
		-- TabLineSel { fg = color("sel", 2) }, -- tab pages line, active tab page label
		-- Title {}, -- titles for output from ":set all", ":autocmd" etc.
		-- -- Visual {}, -- Visual mode selection
		-- VisualNOS {}, -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg { fg = color("warning") }, -- warning messages
		-- WildMenu {}, -- current match in 'wildmenu' completion
		-- -- Partially linked:
		-- IncSearch { bg = Search.bg.ro(180), fg = Normal.fg.lighten(45) },
		-- PmenuThumb { bg = Pmenu.fg }, -- Popup menu: Thumb of the scrollbar.
		-- VertSplit { fg = StatusLine.bg }, -- the column separating vertically split windows
		-- -- Linked and extended
		-- CursorLineNr { CursorLine, fg = color("sel", 2), gui = "italic" },
		-- Folded { Comment, bg = color("black", "bg") }, -- line used for closed folds
		-- StatusLineNC { StatusLine, fg = color("gray") }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- -- Linked:
		-- CursorColumn { CursorLine },
		-- FoldColumn { Comment, gui = "bold" }, -- 'foldcolumn'
		-- PmenuSel { CursorLineNr }, -- Popup menu: selected item.
		-- PmenuSbar { Pmenu }, -- Popup menu: scrollbar.
		-- SignColumn { LineNr }, -- column where |signs| are displayed
		-- Whitespace { LineNr }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- QuickFixLine { CursorLine }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

	}
end)

local theme_WIP = (function()
	return {

		-- We can also mix colours together
		Type { fg = Normal.fg.mix(LineNr.fg, 30) },

		-- NormalFloat {}, -- Normal text in floating windows. Links to Pmenu by default.
		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Constant {}, -- (preferred) any constant
		String {}, --   a string constant: "this is a string"
		Character {}, --  a character constant: 'c', '\n'
		Number {}, --   a number constant: 234, 0xff
		Boolean {}, --  a boolean constant: TRUE, false
		Float {}, --    a floating point constant: 2.3e10

		Identifier {}, -- (preferred) any variable name
		Function {}, -- function name (also: methods for classes)

		Statement {}, -- (preferred) any statement
		Conditional {}, --  if, then, else, endif, switch, etc.
		Repeat {}, --   for, do, while, etc.
		Label {}, --    case, default, etc.
		Operator {}, -- "sizeof", "+", "*", etc.
		Keyword {}, --  any other keyword
		Exception {}, --  try, catch, throw

		PreProc {}, -- (preferred) generic Preprocessor
		Include {}, --  preprocessor #include
		Define {}, --   preprocessor #define
		Macro {}, --    same as Define
		PreCondit {}, --  preprocessor #if, #else, #endif, etc.

		-- Type {}, -- (preferred) int, long, char, etc.
		StorageClass {}, -- static, register, volatile, etc.
		Structure {}, --  struct, union, enum, etc.
		Typedef {}, --  A typedef

		Special {}, -- (preferred) any special symbol
		SpecialChar {}, --  special character in a constant
		Tag {}, --    you can use CTRL-] on this
		Delimiter {}, --  character that needs attention
		SpecialComment {}, -- special things inside a comment
		Debug {}, --    debugging statements

		Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
		Bold { gui = "bold" },
		Italic { gui = "italic" },

		-- ("Ignore", below, may be invisible...)
		Ignore {}, -- (preferred) left blank, hidden  |hl-Ignore|

		Error {}, -- (preferred) any erroneous construct

		-- These groups are for the native LSP client. Some other LSP clients may use
		-- these groups, or use their own. Consult your LSP client's documentation.

		LspDiagnosticsError {}, -- used for "Error" diagnostic virtual text
		LspDiagnosticsErrorSign {}, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsErrorFloating {}, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsWarning { fg = color("warning") }, -- used for "Warning" diagnostic virtual text
		LspDiagnosticsWarningSign { LspDiagnosticsWarning }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsWarningFloating { LspDiagnosticsWarning }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsInformation {}, -- used for "Information" diagnostic virtual text
		LspDiagnosticsInformationSign {}, -- used for "Information" signs in sign column
		LspDiagnosticsInformationFloating {}, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsHint {}, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsHintSign {}, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsHintFloating {}, -- used for "Hint" diagnostic messages in the diagnostics float
		LspReferenceText {}, -- used for highlighting "text" references
		LspReferenceRead {}, -- used for highlighting "read" references
		LspReferenceWrite {}, -- used for highlighting "write" references

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
		-- TSMethod             { }, -- For method calls and definitions.
		-- TSField              { }, -- For fields.
		-- TSProperty           { }, -- Same as `TSField`.
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
		-- TSInclude            { }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		-- TSAnnotation         { }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		-- TSText               { }, -- For strings considered text in a markup language.
		-- TSStrong             { }, -- For text to be represented with strong.
		-- TSEmphasis           { }, -- For text to be represented with emphasis.
		-- TSUnderline          { }, -- For text to be represented with an underline.
		-- TSTitle              { }, -- Text that is part of a title.
		-- TSLiteral            { }, -- Literal text.
		-- TSURI                { }, -- Any URI like a link or email.
		-- TSVariable           { }, -- Any variable name that does not have another highlight.
		-- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.
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
