local lush = require('lush')
local hsl = lush.hsl

-- Colors
local hue = 247.3;
local sat = 42;
local some_bg = hsl("#121118")
local some_fg = hsl("#e6e5ed")
local some = {
	black = { hsl("#181533"), hsl("#342c6d") }
	-- { i = 0, h = priHue, s = sat, l = "14", name = "black" },
	-- { i = 8, h = priHue, s = sat, l = "30", name = "black" },
	--
	-- { i = 1, h = "7.3", s = sat, l = "55", name = "red" },
	-- { i = 9, h = "7.5", s = sat, l = "72", name = "red" },
	--
	-- { i = 2, h = "164.5", s = sat, l = "55", name = "green" },
	-- { i = 10, h = "167.8", s = sat, l = "72", name = "green" },
	--
	-- { i = 3, h = "67.3", s = sat, l = "55", name = "yellow" },
	-- { i = 11, h = "67.5", s = sat, l = "72", name = "yellow" },
	--
	-- { i = 4, h = "214.3", s = sat, l = "72", name = "blue" },
	-- { i = 12, h = "243.2", s = sat, l = "72", name = "blue" },
	--
	-- { i = 5, h = priHue, s = sat, l = "55", name = "magenta" },
	-- { i = 13, h = "247.3", s = sat, l = "72", name = "magenta" },
	--
	-- { i = 6, h = "187.3", s = sat, l = "55", name = "cyan" },
	-- { i = 14, h = "187.5", s = sat, l = "72", name = "cyan" },
	--
	-- { i = 7, h = "105.7", s = sat, l = "91.5", name = "white" },
	-- { i = 15, h = priHue, s = 17.8, l = "100", name = "white" },
	--
	-- { h = "7.3", s = sat, l = "30", name = "selection_background" },
	--
	-- { h = "214.3", s = sat, l = "30", name = "blue_bg" },
	--
	-- { h = "277.5", s = sat, l = "55", name = "pink" },
	-- { h = "277.5", s = sat, l = "72", name = "pink_bright" },
	-- { h = "277.5", s = sat, l = "30", name = "pink_bg" },
	--
	-- { h = priHue, s = sat, l = "3", name = "black_bg" },
	-- { h = "67.3", s = sat, l = "30", name = "yellow_bg" },
	--
	-- { h = priHue, s = "17.8", l = "55", name = "gray" },
};

local theme = lush(function()
	return {
		-- It's recommended to disable wrapping with `setlocal nowrap`, each
		-- group in this tutorial is appended by it's description for ease of use,
		-- but the wrapping may be distracting.
		--
		-- You may also receive (mostly ignorable) linter/lsp warnings,
		-- because our lua is a bit more dynamic than they expect.
		-- You may also wish to disable those while editing your theme
		-- they produce a lot of visual noise.

		-- lush-spec statements are in the form:
		--
		--   <HighlightGroupName> { bg = <hsl>|<string>,
		--                          fg = <hsl>|<string>,
		--                          sp = <hsl>|<string>,
		--                          gui = <string> },
		--
		-- Any vim highlight group name is valid, and any unrecognized key is
		-- omitted.
		--
		-- Lets define our "Normal" highlight group, using our sea colours.

		-- Set a highlight group from hsl variables
		-- Uncomment "Normal"
		-- Normal { bg = sea_deep, fg = sea_foam }, -- normal text
		Normal { bg = some_bg, fg = some_fg }, -- normal text

		-- You should be on the water now, Lush.ify has automatically
		-- recognized our Highlight definition and applied it in real time.
		-- Note: This is applied *vim wide* so other buffers reflect your changes
		--       too. Try opening up a project in a split to see your new theme in
		--       a real setting.

		-- Lush is most useful when you use previously defined groups aid in
		-- picking colours for future groups.
		--
		-- For example, lets set our cursorline (if enabled: `setlocal cursorline`)
		-- to be slightly lighter than our normal background.
		--
		-- Set a highlight group from another highlight group
		-- CursorLine { bg = Normal.bg.lighten(5) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.

		-- Or maybe lets style our visual selection to match Cusorlines background,
		-- and render text in Normal's foreground complement.
		-- Visual { bg = CursorLine.bg, fg = Normal.fg.rotate(180) },

		-- We can also link a group to another group. These will inherit all
		-- of the linked group options (See h: hi-link).
		-- (`setlocal cursorcolumn`)
		-- (May have performance impact depending on terminal)
		-- CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.

		-- We can make white space characters slighly visible
		-- Whitespace { fg = Normal.bg.desaturate(25).lighten(25) },

		-- We can inherit properties if we want to tweak a group slightly
		-- Note: This looks similar to a link, but the defined group will have its
		-- own properties, cloned from the parent.
		-- Lets make Comments look like Whitespace, but with italics
		-- Comment { Whitespace, gui="italic" },

		-- Here's how we might set our line numbers to be relational to Normal,
		-- note we'er also using some shorter aliases here.
		-- (`setlocal number`)
		-- LineNr       { bg = Normal.bg.da(10), fg = Normal.bg.li(5) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- CursorLineNr { bg = CursorLine.bg, fg = Normal.fg.ro(180) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

		-- You can also use highlight groups to define "base" colors, if you dont
		-- want to use regular lua variables. They will behave in the same way.
		-- Note that these groups *will* be defined as a vim-highlight-group, so
		-- try not to pick names that might end up being used by something.
		--
		-- CamelCase is by tradition but you don't have to use it.
		-- search_base  { bg = hsl(52, 52, 52), fg = hsl(52, 10, 10) },
		-- Search       { search_base },
		-- IncSearch    { bg = search_base.bg.rotate(-20), fg = search_base.fg.darken(90) },

		-- We can also mix colours together
		-- Type         { fg = Normal.fg.mix(LineNr.fg, 30) }

		-- And that's the basics of using Lush!
		--
		-- If you want to know more about exporting themes for use without lush
		-- (for distribution) or integration with other plugins (such as
		-- lightline), see the bottom of this file `/export-external`, the README,
		-- or the examples folder.

		-- For experimentation, below is all the Neovim default highlight groups
		-- from docs as of 0.5.0-812.
		--
		-- If you wish to create a theme, it's recommended you copy the template
		-- folder from the examples folder.
		--
		-- Referenced/linked groups must come before being referenced/linked,
		-- (i.e. above we create Normal before trying to set CursorLine)
		-- so the order shown ((mostly) alphabetical) is likely
		-- not the order you will end up with.
		--
		-- You can uncomment these and leave them empty to disable any
		-- styling for that group (meaning they mostly get styled as Normal)
		-- or leave them commented to apply vims default colouring or linking.

		-- NormalFloat  { }, -- Normal text in floating windows.
		-- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
		-- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor       { }, -- character under the cursor
		-- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
		-- Directory    { }, -- directory names (and other special names in listings)
		-- DiffAdd      { }, -- diff mode: Added line |diff.txt|
		-- DiffChange   { }, -- diff mode: Changed line |diff.txt|
		-- DiffDelete   { }, -- diff mode: Deleted line |diff.txt|
		-- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer  { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor   { }, -- cursor in a focused terminal
		-- TermCursorNC { }, -- cursor in an unfocused terminal
		-- ErrorMsg     { }, -- error messages on the command line
		-- VertSplit    { }, -- the column separating vertically split windows
		-- Folded       { }, -- line used for closed folds
		-- FoldColumn   { }, -- 'foldcolumn'
		-- SignColumn   { }, -- column where |signs| are displayed
		-- Substitute   { }, -- |:substitute| replacement text highlighting
		-- MatchParen   { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { }, -- Area for messages and cmdline
		-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg      { }, -- |more-prompt|
		-- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		-- NormalNC     { }, -- normal text in non-current windows
		-- Pmenu        { }, -- Popup menu: normal item.
		-- PmenuSel     { }, -- Popup menu: selected item.
		-- PmenuSbar    { }, -- Popup menu: scrollbar.
		-- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
		-- Question     { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		-- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		-- StatusLine   { }, -- status line of current window
		-- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine      { }, -- tab pages line, not active tab page label
		-- TabLineFill  { }, -- tab pages line, where there are no labels
		-- TabLineSel   { }, -- tab pages line, active tab page label
		-- Title        { }, -- titles for output from ":set all", ":autocmd" etc.
		-- Visual       { }, -- Visual mode selection
		-- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg   { }, -- warning messages
		-- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- WildMenu     { }, -- current match in 'wildmenu' completion

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		-- Constant       { }, -- (preferred) any constant
		-- String         { }, --   a string constant: "this is a string"
		-- Character      { }, --  a character constant: 'c', '\n'
		-- Number         { }, --   a number constant: 234, 0xff
		-- Boolean        { }, --  a boolean constant: TRUE, false
		-- Float          { }, --    a floating point constant: 2.3e10

		-- Identifier     { }, -- (preferred) any variable name
		-- Function       { }, -- function name (also: methods for classes)

		-- Statement      { }, -- (preferred) any statement
		-- Conditional    { }, --  if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --    case, default, etc.
		-- Operator       { }, -- "sizeof", "+", "*", etc.
		-- Keyword        { }, --  any other keyword
		-- Exception      { }, --  try, catch, throw

		-- PreProc        { }, -- (preferred) generic Preprocessor
		-- Include        { }, --  preprocessor #include
		-- Define         { }, --   preprocessor #define
		-- Macro          { }, --    same as Define
		-- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

		-- Type           { }, -- (preferred) int, long, char, etc.
		-- StorageClass   { }, -- static, register, volatile, etc.
		-- Structure      { }, --  struct, union, enum, etc.
		-- Typedef        { }, --  A typedef

		-- Special        { }, -- (preferred) any special symbol
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

		-- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client. Some other LSP clients may use
		-- these groups, or use their own. Consult your LSP client's documentation.

		-- LspDiagnosticsError               { }, -- used for "Error" diagnostic virtual text
		-- LspDiagnosticsErrorSign           { }, -- used for "Error" diagnostic signs in sign column
		-- LspDiagnosticsErrorFloating       { }, -- used for "Error" diagnostic messages in the diagnostics float
		-- LspDiagnosticsWarning             { }, -- used for "Warning" diagnostic virtual text
		-- LspDiagnosticsWarningSign         { }, -- used for "Warning" diagnostic signs in sign column
		-- LspDiagnosticsWarningFloating     { }, -- used for "Warning" diagnostic messages in the diagnostics float
		-- LspDiagnosticsInformation         { }, -- used for "Information" diagnostic virtual text
		-- LspDiagnosticsInformationSign     { }, -- used for "Information" signs in sign column
		-- LspDiagnosticsInformationFloating { }, -- used for "Information" diagnostic messages in the diagnostics float
		-- LspDiagnosticsHint                { }, -- used for "Hint" diagnostic virtual text
		-- LspDiagnosticsHintSign            { }, -- used for "Hint" diagnostic signs in sign column
		-- LspDiagnosticsHintFloating        { }, -- used for "Hint" diagnostic messages in the diagnostics float
		-- LspReferenceText                  { }, -- used for highlighting "text" references
		-- LspReferenceRead                  { }, -- used for highlighting "read" references
		-- LspReferenceWrite                 { }, -- used for highlighting "write" references

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
