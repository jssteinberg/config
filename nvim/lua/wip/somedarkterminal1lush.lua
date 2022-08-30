local lush = require('lush')
local hsl = lush.hsl

-- {string} color - color name or color util name
-- {string} [variant] - "bg", other truthy for emphasized, nil for base
local color = function(color, variant)
	-- if &bg == "light"/"dark"...

	-- Colors { base, emphasized, background }
	-- base colors
	local colors = {
		-- terminal color keys
		bg      = { hsl("#121118") },
		fg      = { hsl("#e6e5ed") },
		black   = { hsl("#1a1636"), hsl("#342c6d") },
		red     = { hsl("#bc675c"), hsl("#d6a19a") },
		green   = { hsl("#80bc5c"), hsl("#a8d69a") },
		yellow  = { hsl("#bc985c"), hsl("#ced69a") },
		blue    = { hsl("#9ab0d6"), hsl("#9d9ad6") },
		magenta = { hsl("#685cbc"), hsl("#a19ad6") },
		cyan    = { hsl("#5cb1bc"), hsl("#9aced6") },
		white   = { hsl("#e5f2e0"), hsl("#ffffff") },
		-- additional color keys
		gray    = { hsl("#7d78a1") },
		violet  = { hsl("#985cbc"), hsl("#bf9ad6") },
	}
	-- Colors' backgrounds
	colors.black[#colors.black + 1] = hsl("#05040b")
	colors.yellow[#colors.yellow + 1] = hsl("#646d2c")
	colors.blue[#colors.blue + 1] = hsl("#2c446d")
	colors.violet[#colors.violet + 1] = hsl("#552c6d")
	-- Colors by utility
	colors.comment = { colors.violet[1], colors.violet[2] }
	colors.error = { colors.red[1] }
	colors.selection = { colors.violet[3] }
	colors.warning = { colors.yellow[1] }

	if variant and variant == "bg" and colors[color][3] then
		-- return background variant (fall back to base)
		return colors[color][3]
	elseif not variant or variant == "bg" or #colors[color] == 1 then
		-- return base color variant if no variant or missing index
		return colors[color][1]
	else
		-- return emphasized variant if string is not "bg" and has index 2
		return colors[color][2]
	end
end


local theme = lush(function()
	return {
		-- lush-spec statements are in the form:
		--
		--   <HighlightGroupName> { bg = <hsl>|<string>,
		--                          fg = <hsl>|<string>,
		--                          sp = <hsl>|<string>,
		--                          gui = <string> },

		Normal { fg = color("fg") },
		Comment { fg = color("comment") },
		Todo { fg = color("comment", 2), gui = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- Set a highlight group from another highlight group
		CursorLine { bg = color("bg").li(15) },

		-- ...and render text in Normal's foreground complement.
		-- Visual { bg = CursorLine.bg, fg = Normal.fg.rotate(180) },
		Visual { bg = color("selection") },

		-- We can make white space characters slighly visible
		-- Whitespace { fg = color("bg").desaturate(-15).lighten(30) },

		-- note we'er also using some shorter aliases here.
		LineNr { fg = color("gray") },
		-- CursorLineNr { CursorLine, fg = LineNr.fg.rotate(180).lighten(15) },

		-- You can also use highlight groups to define "base" colors, if you dont
		-- want to use regular lua variables. They will behave in the same way.
		-- Note that these groups *will* be defined as a vim-highlight-group, so
		-- try not to pick names that might end up being used by something.
		--
		-- CamelCase is by tradition but you don't have to use it.
		-- search_base { bg = color("blue", "bg") },
		Search { bg = color("blue", "bg") },

		-- We can also mix colours together
		Type { fg = Normal.fg.mix(LineNr.fg, 30) },

		-- NormalFloat {}, -- Normal text in floating windows. Links to Pmenu by default.
		ColorColumn { bg = color("black", "bg") }, -- used for the columns set with 'colorcolumn'
		Conceal { fg = color("comment", 2), gui = "bold" }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor {}, -- character under the cursor
		lCursor {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM {}, -- like Cursor, but used when in IME mode |CursorIM|
		Directory {}, -- directory names (and other special names in listings)
		DiffAdd {}, -- diff mode: Added line |diff.txt|
		DiffChange {}, -- diff mode: Changed line |diff.txt|
		DiffDelete {}, -- diff mode: Deleted line |diff.txt|
		DiffText {}, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer {}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		TermCursor {}, -- cursor in a focused terminal
		TermCursorNC {}, -- cursor in an unfocused terminal
		ErrorMsg {}, -- error messages on the command line
		Substitute {}, -- |:substitute| replacement text highlighting
		MatchParen { bg = color("black", 2), gui = "italic" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg {}, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea {}, -- Area for messages and cmdline
		MsgSeparator {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg {}, -- |more-prompt|
		NonText {}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		NormalNC {}, -- normal text in non-current windows
		Pmenu { bg = color("black", "bg"), fg = color("gray") }, -- Popup menu: normal item.
		Question { fg = color("yellow") }, -- |hit-enter| prompt and yes/no questions
		SpecialKey {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad {}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap {}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine { bg = color("black", 2), fg = color("magenta", 2) }, -- status line of current window
		TabLine {}, -- tab pages line, not active tab page label
		TabLineFill {}, -- tab pages line, where there are no labels
		TabLineSel {}, -- tab pages line, active tab page label
		Title {}, -- titles for output from ":set all", ":autocmd" etc.
		-- Visual {}, -- Visual mode selection
		VisualNOS {}, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { fg = color("warning") }, -- warning messages
		WildMenu {}, -- current match in 'wildmenu' completion
		-- Partially linked:
		CursorLineNr { CursorLine, fg = color("magenta", 2), gui = "italic" },
		IncSearch { bg = Search.bg.ro(180), fg = Normal.fg.lighten(45) },
		PmenuThumb { bg = Pmenu.fg }, -- Popup menu: Thumb of the scrollbar.
		StatusLineNC { StatusLine, fg = color("gray") }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		VertSplit { fg = StatusLine.bg }, -- the column separating vertically split windows
		-- Linked and extended
		Folded { Comment, bg = color("black", "bg") }, -- line used for closed folds
		-- Linked:
		CursorColumn { CursorLine },
		FoldColumn { Comment, gui = "bold" }, -- 'foldcolumn'
		PmenuSel { CursorLineNr }, -- Popup menu: selected item.
		PmenuSbar { Pmenu }, -- Popup menu: scrollbar.
		SignColumn { LineNr }, -- column where |signs| are displayed
		Whitespace { LineNr }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		QuickFixLine { CursorLine }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

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
