local keymaps = {}

keymaps['normal'] = {
    {'<Enter>', '<Esc>:noh<CR>'}, -- Remove highlight after search
    {'<Tab>', ':bnext<CR>'}, -- next buffer
    {'<S-Tab>', ':bprev<CR>'}, -- prev buffer
    {'<leader>fu', ':UndotreeToggle<CR>'}, -- UndoTree toggle
    {'<leader>ff', ':Telescope find_files<CR>'}, -- File search
    {'<leader>ag', ':Telescope live_grep<CR>'}, -- Text search
    {'<S-t>', ':FloatermNew --wintype=normal --height=10<CR>'}, -- Floaterm bottom
    {'<A-j>', ':AnyJump<CR>'}, -- Any jump
    -- {'<A-.>', ':BookmarkToggle<CR>'}, -- Bookmark toggle
    -- {'<A-,>', ':Neoformat<CR>'}, -- Format code
    {'<A-f>', ':LspFormatting<CR>'}, -- Lsp format code
    {'<A-g>', ':LspReferences<CR>'}, -- Lsp references
    {'<A-d>', ':LspDeclaration<CR>'}, -- Lsp declaration
    {'<A-p>', ':LspDefinition<CR>'}, -- Lsp definition
    {'<A-h>', ':LspHover<CR>'}, -- Lsp hover
    {'<A-r>', ':LspRename<CR>'}, -- Lsp rename
    {'<A-n>', ':LspGoToNext<CR>'}, -- Lsp go to next
    {'<A-p>', ':LspGoToPrev<CR>'}, -- Lsp go to prev
    {'<A-e>', ':LspTroubleToggle<CR>'} -- Lsp trouble toggle
}

keymaps['visual'] = {
    {'>', '>gv'}, -- Tab right
    {'<', '<gv'}, -- Tab left
    {
        '*',
        ':<C-u>lua require("core.funcs.search").visual_selection("/")<CR>/<C-r>=@/<CR><CR>'
    }, -- Visual search /
    {
        '#',
        ':<C-u>lua require("core.funcs.search").visual_selection("?")<CR>?<C-r>=@/<CR><CR>'
    }, -- Visual search ?
    {'K', ":move '<-2<CR>gv-gv"}, -- Move up
    {'J', ":move '>+1<CR>gv-gv"}, -- Move down
    {'<A-j>', ':AnyJumpVisual<CR>'}, -- Any jump visual
}

return keymaps
