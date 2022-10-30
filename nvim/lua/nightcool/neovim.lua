vim.api.nvim_set_hl(0, "@tag", { link = "@type" }) -- keep like Type since CSS els are @type
vim.api.nvim_set_hl(0, "@constructor", { link = "@tag" }) -- keep like tag since often custom HTML element from ES import
vim.api.nvim_set_hl(0, "@property", { link = "String" }) -- CSS classes are property. Keep same as String since classes in HTML are strings

-- nvim_set_hl({ns_id}, {name}, {*val})                           *nvim_set_hl()*
--     Sets a highlight group.
--
--     Note:
--         Unlike the `:highlight` command which can update a highlight group,
--         this function completely replaces the definition. For example:
--         `nvim_set_hl(0, 'Visual', {})` will clear the highlight group
--         'Visual'.
--
--     Note:
--         The fg and bg keys also accept the string values `"fg"` or `"bg"`
--         which act as aliases to the corresponding foreground and background
--         values of the Normal group. If the Normal group has not been defined,
--         using these values results in an error.
--
--     Parameters:
--         {ns_id}  Namespace id for this highlight |nvim_create_namespace()|.
--                  Use 0 to set a highlight group globally |:highlight|.
--         {name}   Highlight group name, e.g. "ErrorMsg"
--         {val}    Highlight definition map, accepts the following keys:
--                  • fg (or foreground): color name or "#RRGGBB", see note.
--                  • bg (or background): color name or "#RRGGBB", see note.
--                  • sp (or special): color name or "#RRGGBB"
--                  • blend: integer between 0 and 100
--                  • bold: boolean
--                  • standout: boolean
--                  • underline: boolean
--                  • undercurl: boolean
--                  • underdouble: boolean
--                  • underdotted: boolean
--                  • underdashed: boolean
--                  • strikethrough: boolean
--                  • italic: boolean
--                  • reverse: boolean
--                  • nocombine: boolean
--                  • link: name of another highlight group to link to, see
--                    |:hi-link|.
--                  • default: Don't override existing definition |:hi-default|
--                  • ctermfg: Sets foreground of cterm color |ctermfg|
--                  • ctermbg: Sets background of cterm color |ctermbg|
--                  • cterm: cterm attribute map, like |highlight-args|. If not
--                    set, cterm attributes will match those from the attribute
--                    map documented above.

-- Neovi terminal colors
vim.g.terminal_color_0  = "#1a1636"
vim.g.terminal_color_1  = "#bc675c"
vim.g.terminal_color_2  = "#80bc5c"
vim.g.terminal_color_3  = "#bc985c"
vim.g.terminal_color_4  = "#5c80bc"
vim.g.terminal_color_5  = "#685cbc"
vim.g.terminal_color_6  = "#5cb1bc"
vim.g.terminal_color_7  = "#afc5c7"
vim.g.terminal_color_8  = "#7d78a1"
vim.g.terminal_color_9  = "#d8a69f"
vim.g.terminal_color_10 = "#add89f"
vim.g.terminal_color_11 = "#d0d89f"
vim.g.terminal_color_12 = "#9fb4d8"
vim.g.terminal_color_13 = "#a69fd8"
vim.g.terminal_color_14 = "#9fd1d8"
vim.g.terminal_color_15 = "#e9f5e6"
