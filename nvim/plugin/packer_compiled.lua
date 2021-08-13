-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/johan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/johan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/johan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/johan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/johan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["any-jump.vim"] = {
    commands = { "AnyJump", "AnyJumpVisual", "AnyJumpBack", "AnyJumpLastResults" },
    keys = { { "n", "<leader>j" }, { "x", "<leader>j" }, { "n", "<leader>ab" }, { "n", "<leader>al" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/any-jump.vim"
  },
  ["asyncrun.vim"] = {
    commands = { "AsyncRun" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/asyncrun.vim"
  },
  ["bufdelete.nvim"] = {
    commands = { "Bdelete", "Bwipeout" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/bufdelete.nvim"
  },
  ["clever-f.vim"] = {
    keys = { { "n", "f" }, { "n", "F" }, { "n", "t" }, { "n", "T" }, { "v", "f" }, { "v", "F" }, { "v", "t" }, { "v", "T" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/clever-f.vim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen" },
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15file_panel\1\0\0\1\0\1\14use_icons\1\nsetup\rdiffview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/diffview.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["git-blame.nvim"] = {
    commands = { "GitBlameToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/git-blame.nvim"
  },
  ["gv.vim"] = {
    commands = { "GV" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/gv.vim"
  },
  harpoon = {
    config = { "\27LJ\2\nw\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20global_settings\1\0\0\1\0\2\19save_on_change\2\19save_on_toggle\2\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  hop = {
    commands = { "HopWord", "HopLine" },
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\20etoqdygflhksura\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/hop"
  },
  ["limelight.vim"] = {
    commands = { "Limelight" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\18comment_empty\1\nsetup\17nvim_comment\frequire\0" },
    keys = { { "n", "gcc" }, { "x", "gc" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/johan/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19packages.compe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\22lspinstall_config\17packages.lsp\frequire\0" },
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¦\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\14highlight\fdisable\1\3\0\0\blua\rmarkdown\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["open-browser.vim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\25packages.openbrowser\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pears.nvim"] = {
    config = { "\27LJ\2\n¡\1\0\1\4\0\a\2\0226\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\r€6\1\0\0009\1\1\0019\1\3\1B\1\1\0029\1\4\1\b\1\1\0X\1\6€6\1\0\0009\1\1\0019\1\5\1'\3\6\0D\1\2\0X\1\2€\18\1\0\0B\1\1\1K\0\1\0\t<CR>\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\2þÿÿÿ\31A\1\1\4\0\4\0\a9\1\0\0'\3\1\0B\1\2\0019\1\2\0003\3\3\0B\1\2\1K\0\1\0\0\ron_enter\17tag_matching\vpreset8\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\nsetup\npears\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/pears.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n¼\1\0\0\n\0\r\0\0226\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\v\0005\4\t\0005\5\a\0004\6\0\b6\a\0\0'\t\4\0B\a\2\0029\a\5\a9\b\6\0<\b\a\6=\6\b\5=\5\n\4=\4\f\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\nclose\fesc_map\fkeymaps\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vim-easy-align"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-fugitive"] = {
    commands = { "G", "Git" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-ripgrep"] = {
    commands = { "Rg" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/vim-ripgrep"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-yoink"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/vim-yoink"
  },
  ["visualstar.vim"] = {
    keys = { { "x", "*" }, { "x", "#" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/visualstar.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "\27LJ\2\n¡\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\0\foptions\1\0\2\15cursorline\1\17cursorcolumn\1\1\0\3\vheigth\4Í™³æ\fÌ™³ÿ\3\nwidth\3d\rbackdrop\3\1\nsetup\rzen-mode\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johan/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\22lspinstall_config\17packages.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¦\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\14highlight\fdisable\1\3\0\0\blua\rmarkdown\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\nw\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20global_settings\1\0\0\1\0\2\19save_on_change\2\19save_on_toggle\2\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncRun lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AnyJump lua require("packer.load")({'any-jump.vim'}, { cmd = "AnyJump", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GV lua require("packer.load")({'gv.vim'}, { cmd = "GV", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AnyJumpBack lua require("packer.load")({'any-jump.vim'}, { cmd = "AnyJumpBack", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AnyJumpLastResults lua require("packer.load")({'any-jump.vim'}, { cmd = "AnyJumpLastResults", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitBlameToggle lua require("packer.load")({'git-blame.nvim'}, { cmd = "GitBlameToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Rg lua require("packer.load")({'vim-ripgrep'}, { cmd = "Rg", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bwipeout lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bwipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AnyJumpVisual lua require("packer.load")({'any-jump.vim'}, { cmd = "AnyJumpVisual", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopLine lua require("packer.load")({'hop'}, { cmd = "HopLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Limelight lua require("packer.load")({'limelight.vim'}, { cmd = "Limelight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bdelete lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bdelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[vnoremap <silent> T <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> t <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> # <cmd>lua require("packer.load")({'visualstar.vim'}, { keys = "#", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> F <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> f <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> T <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>al <cmd>lua require("packer.load")({'any-jump.vim'}, { keys = "<lt>leader>al", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> f <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>j <cmd>lua require("packer.load")({'any-jump.vim'}, { keys = "<lt>leader>j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gc <cmd>lua require("packer.load")({'nvim-comment'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> * <cmd>lua require("packer.load")({'visualstar.vim'}, { keys = "*", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gcc <cmd>lua require("packer.load")({'nvim-comment'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> F <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> t <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>ab <cmd>lua require("packer.load")({'any-jump.vim'}, { keys = "<lt>leader>ab", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <leader>j <cmd>lua require("packer.load")({'any-jump.vim'}, { keys = "<lt>leader>j", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-compe', 'open-browser.vim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'pears.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
