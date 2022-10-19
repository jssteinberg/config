vim.cmd [[
	hi clear
	set t_Co=256
]]
vim.g.colors_name = "whitecool"
vim.o.background = "light"


local colors = {
	-- PATCH_OPEN
Normal = {fg = "#000000", bg = "#FFFFFF"},
DiffChange = {link = "Normal"},
TelescopeNormal = {link = "Normal"},
Bold = {bold = true},
MoreMsg = {link = "Bold"},
Question = {link = "Bold"},
Boolean = {},
Character = {},
ColorColumn = {bg = "#F9F2F1"},
Comment = {fg = "#8005C7"},
FoldColumn = {link = "Comment"},
Conceal = {},
Conditional = {fg = "#054CC7"},
Constant = {},
CursorColumn = {bg = "#F9FCE4"},
CursorLine = {bg = "#F7FBDF"},
CursorLineNr = {fg = "#000000", bg = "#F7FBDF"},
Debug = {},
Define = {},
DiagnosticHint = {fg = "#675CBC"},
DiagnosticInfo = {fg = "#675CBC"},
DiagnosticWarn = {fg = "#675CBC"},
DiffAdd = {fg = "#238B04", bold = true},
DiffText = {link = "DiffAdd"},
diffAdded = {link = "DiffAdd"},
DiffDelete = {fg = "#C71F05"},
diffRemoved = {link = "DiffDelete"},
Directory = {fg = "#5C7FBC", bold = true},
NeoTreeRootName = {link = "Directory"},
Error = {fg = "#BC675C"},
DiagnosticError = {link = "Error"},
ErrorMsg = {link = "Error"},
Exception = {},
Float = {},
Folded = {fg = "#8005C7", bg = "#E2DFFB"},
Function = {},
Identifier = {},
IlluminatedWordText = {bg = "#E0FAD1"},
IlluminatedWordRead = {link = "IlluminatedWordText"},
IlluminatedWordWrite = {link = "IlluminatedWordText"},
IncSearch = {bg = "#D1E0FA", bold = true},
Include = {},
Italic = {italic = true},
Keyword = {bold = true},
Label = {},
LineNr = {fg = "#7C78A1"},
MiniIndentscopeSymbol = {link = "LineNr"},
NeoTreeIndentMarker = {link = "LineNr"},
SignColumn = {link = "LineNr"},
SpecialKey = {link = "LineNr"},
WinBarNC = {link = "LineNr"},
LineNrBelow = {fg = "#675CBC"},
LspReferenceRead = {},
LspReferenceText = {},
LspReferenceWrite = {},
Macro = {},
MatchParen = {bg = "#E8DBF0"},
ModeMsg = {},
MsgArea = {},
NeoTreeDimText = {fg = "#7C78A1"},
NeoTreeDotfile = {link = "NeoTreeDimText"},
NeoTreeExpander = {},
NeoTreeGitUntracked = {fg = "#675CBC"},
NeoTreeNormal = {fg = "#675CBC"},
NeoTreeSymbolicLinkTarget = {fg = "#05ADC7"},
Number = {},
Operator = {fg = "#054CC7"},
Pmenu = {fg = "#675CBC", bg = "#E2DFFB"},
PmenuSbar = {link = "Pmenu"},
WildMenu = {link = "Pmenu"},
PmenuSel = {fg = "#1C05C7", bg = "#E2DFFB"},
PmenuThumb = {bg = "#675CBC"},
PreCondit = {},
PreProc = {fg = "#054CC7"},
Repeat = {},
Search = {bg = "#D1E0FA"},
Special = {},
SpecialChar = {},
SpecialComment = {},
SpellBad = {fg = "#C71F05"},
SpellCap = {link = "SpellBad"},
Statement = {},
StatusLine = {fg = "#1C05C7", bg = "#E2DFFB"},
NeoTreeTitleBar = {link = "StatusLine"},
StatusLineNC = {fg = "#675CBC", bg = "#E2DFFB"},
StorageClass = {},
String = {},
Structure = {fg = "#054CC7"},
Delimiter = {link = "Structure"},
Substitute = {},
TSInclude = {fg = "#675CBC"},
TSMethod = {},
TSProperty = {},
htmlArg = {link = "TSProperty"},
TabLine = {fg = "#675CBC", bg = "#E2DFFB"},
TabLineFill = {link = "TabLine"},
TabLineSel = {fg = "#1C05C7", bg = "#E2DFFB"},
WinBar = {link = "TabLineSel"},
TSTag = {link = "Tag"},
htmlTagName = {link = "Tag"},
Title = {fg = "#110F24", bold = true},
Todo = {fg = "#8005C7", bold = true},
TreesitterContextLineNumber = {fg = "#1C05C7", bg = "#E2DFFB"},
Type = {fg = "#1C05C7"},
Tag = {link = "Type"},
Typedef = {},
Underlined = {underline = true},
Visual = {bg = "#FAD6D1"},
WarningMsg = {fg = "#BC995C"},
NeoTreeGitConflict = {link = "WarningMsg"},
WinSeparator = {fg = "#E2DFFB"},
NonText = {link = "WinSeparator"},
gitDiff = {fg = "#675CBC"},
htmlTag = {link = "htmlArg"},
htmlEndTag = {link = "htmlTag"},
cssTagName = {link = "htmlTagName"},
markid1 = {fg = "#1C05C7", bold = true},
markid2 = {fg = "#054CC7", bold = true},
markid3 = {fg = "#675CBC", bold = true},
	-- PATCH_CLOSE
}

-- apply highlight groups
for group, attrs in pairs(colors) do
	vim.api.nvim_set_hl(0, group, attrs)
end
