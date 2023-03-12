local lush = require("lush")
local hsl = lush.hsl

-- {string} color - color name or color util name
-- {string} [variant] - "bg", other truthy for emphasized, nil for base
local color = function(color, variant)
	local hue = 247.3
	local sa, sa2, li, li2, li2_2, sa3, li3, li_id

	sa = 42
	li = 55
	sa2 = 95
	li2 = 40
	li2_2 = 27.5
	-- bg colors, but TODO: separate on full line bg and subline bg
	sa3 = 79
	li3 = 90
	-- id colors
	li_id = 27.5

	-- Colors { base, emphasized, background }
	-- base colors
	local colors = {
		-- terminal color keys
		bg      = { hsl("#ffffff") },
		fg      = { hsl(hue, sa, 100 - li3), hsl("#000000") },
		black   = { hsl(hue, 17.8, li2), hsl("#000000") },                          -- add 2 index color
		red     = { hsl(6.9, sa, li), hsl(7.5, sa2, li2), hsl(6.9, sa3, li3) },     -- add 2 index color
		green   = { hsl(97.5, sa, li), hsl(105.7, sa2, li2_2), hsl(97.5, sa3, li3) }, -- add 2 index color
		yellow  = { hsl(37.5, sa, li), hsl(68, sa2, li2_2), hsl(68, sa3, 92.5) },   -- add 2 index color
		blue    = { hsl(217.5, sa, li), hsl(217.5, sa2, li2), hsl(217.5, sa3, li3) }, -- add 2 index color
		magenta = { hsl(hue, sa, li), hsl(hue, sa2, li2), hsl(hue, sa3, 92.5) },    -- add 2 index color
		cyan    = { hsl(187.3, sa, li), hsl(187.5, sa2, li2), hsl(187.3, sa3, li3) }, -- add 2 index color
		white   = { hsl(hue, 17.8, li), hsl(hue, 17.8, li3) },                      -- add 2 index color
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

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	return {
		Normal { bg = color("bg"), fg = color("fg") },
		Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
		Bold { gui = "bold" },
		Italic { gui = "italic" },
		Title { fg = color("fg"), gui = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
		Comment { fg = color("comment", 2) },
		Todo { fg = color("comment", 2), gui = "bold" },
		Error { fg = color("red") },        -- (preferred) any erroneous construct
		ErrorMsg { Error },                 -- error messages on the command line
		WarningMsg { fg = color("warning") }, -- warning messages

		-- TERMINAL COLORS

		terminal_color_00 { fg = color("black") },
		terminal_color_01 { fg = color("red", 2) },
		terminal_color_02 { fg = color("green", 2) },
		terminal_color_03 { fg = color("yellow") },
		terminal_color_11 { fg = color("yellow", 2) },
		terminal_color_04 { fg = color("blue", 2) },
		terminal_color_05 { fg = color("magenta", 2) },
		terminal_color_06 { fg = color("cyan", 2) },
		terminal_color_07 { fg = color("white") },
		terminal_color_08 { fg = color("black", 2) },
		terminal_color_15 { fg = color("white", 2) },

		-- UI

		-- necessities
		LineNr { fg = color("fg").li(75) },
		LineNrAbove { LineNr, fg = color("magenta") },
		ColorColumn { bg = color("red").li(90) }, -- used for the columns set with 'colorcolumn'
		CursorLine { bg = color("yellow", "bg") },
		CursorLineNr { fg = color("black"), italic = true },
		CursorColumn { bg = CursorLine.bg.li(10) },
		Conceal {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		StatusLine { bg = color("magenta", "bg"), fg = color("magenta", 2) },
		StatusLineNC { StatusLine, fg = color("magenta") },
		TabLine { fg = color("magenta") },                                  -- tab pages line, not active tab page label
		TabLineFill { TabLine },                                            -- tab pages line, where there are no labels
		TabLineSel { bg = color("magenta", "bg"), fg = color("magenta", 2) }, -- tab pages line, active tab page label
		WinBar { Bold },
		WinBarNC { TabLine },
		WinSeparator { fg = LineNr.fg },
		NonText { WinSeparator }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		SignColumn { LineNr },  -- column where |signs| are displayed
		Pmenu { bg = color("magenta", "bg"), fg = color("magenta") },
		PmenuSel { bg = color("magenta", "bg"), fg = color("magenta", 2) },
		PmenuThumb { bg = Pmenu.fg }, -- Popup menu: Thumb of the scrollbar.
		PmenuSbar { Pmenu },        -- Popup menu: scrollbar.
		WildMenu { Pmenu },         -- current match in 'wildmenu' completion
		Visual { bg = color("red", "bg") },
		Search { bg = color("blue", "bg") },
		IncSearch { bg = color("blue", "bg"), gui = "bold" },
		MatchParen { bg = color("comment", "bg") },
		Directory { fg = color("blue"), gui = "bold" }, -- directory names (and other special names in listings)
		Question { Bold },                             -- |hit-enter| prompt and yes/no questions
		SpecialKey { LineNr },                         -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		Folded { Comment, bg = color("magenta", "bg") }, -- line used for closed folds
		FoldColumn { Comment },                        -- 'foldcolumn'
		MoreMsg { Bold },                              -- |more-prompt|
		Substitute {},                                 -- |:substitute| replacement text highlighting
		ModeMsg {},                                    -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea {},                                    -- Area for messages and cmdline
		SpellBad { fg = color("red", 2) },             -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap { SpellBad },                         -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

		-- diff
		DiffAdd { fg = color("green", 2), gui = "bold" }, -- diff mode: Added line |diff.txt|
		DiffChange { Normal },                          -- diff mode: Changed line |diff.txt|
		DiffDelete { fg = color("red", 2) },            -- diff mode: Deleted line |diff.txt|
		DiffText { DiffAdd },                           -- diff mode: Changed text within a changed line |diff.txt|
		gitDiff { fg = color("magenta") },
		diffAdded { DiffAdd },
		diffRemoved { DiffDelete },
		-- LSP
		DiagnosticError { Error },                                  -- used for "Error" diagnostic virtual text
		DiagnosticWarn { bg = SignColumn.bg, fg = color("magenta") }, -- used for "Warning" diagnostic virtual text
		DiagnosticInfo { bg = SignColumn.bg, fg = color("magenta") }, -- used for "Information" diagnostic virtual text
		DiagnosticHint { bg = SignColumn.bg, fg = color("magenta") }, -- used for "Hint" diagnostic virtual text
		LspReferenceText {},                                        -- used for highlighting "text" references
		LspReferenceRead {},                                        -- used for highlighting "read" references
		LspReferenceWrite {},                                       -- used for highlighting "write" references
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
		TreesitterContext { Underlined },
		TreesitterContextLineNumber { TreesitterContext, gui = "underline" },
		-- Cursor {}, -- character under the cursor
		-- lCursor {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM {}, -- like Cursor, but used when in IME mode |CursorIM|
		-- TermCursor {}, -- cursor in a focused terminal
		-- TermCursorNC {}, -- cursor in an unfocused terminal
		-- NormalNC {}, -- normal text in non-current windows

		Constant {},                          -- (preferred) any constant
		String {},
		Character {},                         --  a character constant: 'c', '\n'
		Number {},                            --   a number constant: 234, 0xff
		Boolean {},                           --  a boolean constant: TRUE, false
		Float {},                             --    a floating point constant: 2.3e10
		Identifier {},                        -- (preferred) any variable name
		Function {},                          -- function name (also: methods for classes)
		Statement { fg = color("magenta", 2) }, -- (preferred) any statement
		Conditional { fg = color("blue", 2) }, --  if, then, else, endif, switch, etc.
		Repeat {},                            --   for, do, while, etc.
		Label {},                             --    case, default, etc.
		Operator { fg = color("blue", 2) },   -- "sizeof", "+", "*", etc.
		Keyword { fg = color("blue", 2) },    --  not Normal fg for vim fugitive commit message
		Exception {},                         --  try, catch, throw
		PreProc { fg = color("blue", 2) },    -- (preferred) generic Preprocessor
		Include { fg = color("blue", 2) },    --  preprocessor #include
		Define {},                            --   preprocessor #define
		Macro {},                             --    same as Define
		PreCondit {},                         --  preprocessor #if, #else, #endif, etc.
		Type { fg = color("magenta", 2) },
		StorageClass {},                      -- static, register, volatile, etc.
		Structure { fg = color("blue", 2) },  --  struct, union, enum, etc.
		Typedef {},                           --  A typedef
		Special {},                           -- (preferred) any special symbol
		SpecialChar {},                       --  special character in a constant
		Tag { Type },                         --    you can use CTRL-] on this
		Delimiter { Structure },              --  character that needs attention
		SpecialComment {},                    -- special things inside a comment
		Debug {},                             --    debugging statements
		sym("@method") { fg = color("magenta", 2) },
		sym("@variable") { sym("@method") },
		sym("@function.call") { fg = color("magenta", 2) },
		sym("@property") { String },
		sym("@tag") { Tag },
		sym("@tag.attribute") { sym("@tag") },
		sym("@text.uri") { fg = color("magenta", 2) },
		htmlArg { sym("@tag.attribute") },
		htmlBold { Bold },
		htmlTagName { Tag },
		htmlTag { htmlArg },
		htmlEndTag { htmlTag },
		cssTagName { htmlTagName },
		markdownLinkText { fg = color("blue", 2) },
		markdownUrl { fg = color("blue", 2) },
		markdownLinkDelimiter { fg = color("blue", 2) },
		markdownId { fg = color("blue", 2) },
		markdownIdDeclaration { markdownId },
		markdownCode { fg = color("magenta", 2) },
	}
end)

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
