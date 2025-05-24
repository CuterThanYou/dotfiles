-- keybinding {{{
vim.g.mapleader = " "
local map = vim.keymap.set
-- system clipboard
map('v', '<C-c>', '"+y')
map('n', '<C-v>', '"+p')
map('i', '<C-v>', '<Esc>"+pa')
map('n', '<C-c>', ':let @+ = @0<CR>') -- copy yank register to system clipboard

map('n', '<Leader>r', ':so ~/.config/nvim/init.lua<CR>') -- reload config

-- tab management
map('n', '<Leader>t', ':tabnew<CR>')
map('n', 'g1', '1gt')
map('n', 'g2', '2gt')
map('n', 'g3', '3gt')
map('n', 'g4', '4gt')
map('n', 'g5', '5gt')
map('n', 'g6', '6gt')
map('n', 'g7', '7gt')
map('n', 'g8', '8gt')
map('n', 'g9', '9gt')
-- }}}

-- plugins {{{
require('nvim-highlight-colors').setup({})
-- }}}

-- features {{{
vim.opt.scroll = math.floor(0.3 * vim.o.lines) -- 1/3 scroll for ctrl-d, ctrl-u
-- these are more annoying than useful
vim.g.leave_my_cursor_position_alone = 1
vim.opt.shadafile = "NONE"
vim.opt.swapfile = false -- no auto-save
-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_dirhistmax = 0 -- disable history
-- line number
vim.wo.number = true
vim.opt.relativenumber = true
-- tab spaces
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
-- case sensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- dont open fold when using '{' '}'
vim.opt.foldopen:remove("block")
-- whitespace indicator
vim.opt.list = true
vim.opt.listchars:append {
	tab=" ▏ ",
	trail="+",
	leadmultispace=".",
}
-- bloat, what are these even
vim.g.loaded_node_provider = 0 -- yucky
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- enable tree-shitter
vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		'c', 'lua', 'markdown', 'vim', 'vimdoc', 'markdown', 'query',
	},
	callback = function()
		vim.treesitter.start()
	end
})
-- }}}

-- color {{{
vim.opt.termguicolors = true

-- use terminal background
vim.api.nvim_create_autocmd({ 'ColorScheme' }, { -- {{{
 	pattern = {'*'},
 	callback = function()
		if vim.api.nvim_get_option_value('background',{}) == 'dark' then
			vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE' })
		end
 	end
}) -- }}}

vim.cmd.colorscheme('catppuccin')
-- color for line number
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#cba6f7' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#74c7ec' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#cba6f7' })
-- }}}

-- languages specifics {{{
vim.g.c_syntax_for_h = true
-- ignore their dumb formatting guide
vim.g.rust_recommended_style = false
vim.g.python_recommended_style = false
-- use space instaed of tab for haskell
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'haskell' },
	command = 'set expandtab',
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'markdown' },
	callback = function()
		vim.opt.linebreak = true
	end
})
-- }}}

-- open in tab {{{
vim.g.netrw_browse_split = 3 -- netrw open in new tab, well except for `%`
map({'n', 'v'}, 'gf', '<C-w>gf') -- gf open in new tab
-- open :h in tab instead of split
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'help',
	callback = function()
		vim.cmd('wincmd T')
	end
}) -- }}}

-- restore cursor on exit {{{
-- https://github.com/neovim/neovim/issues/4396
vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
 	pattern = {'*'},
 	callback = function()
 		vim.o.guicursor = "a:hor20-blinkon500-blinkoff500"
 	end
}) -- }}}

-- vim:foldmethod=marker
