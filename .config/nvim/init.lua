-- keybinding
vim.g.mapleader = " "
local map = vim.keymap.set
-- system clipboard
map('v', '<C-c>', '"+y')
map('n', '<C-v>', '"+p')
map('i', '<C-v>', '<Esc>"+pa')

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

-- plugins
require('nvim-highlight-colors').setup({})

-- netrw
vim.g.netrw_banner = 0
-- line number
vim.wo.number = true
vim.opt.relativenumber = true
-- tab spaces
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
-- disable mouse
vim.opt.mouse=""
-- case sensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- color
vim.opt.termguicolors = true
vim.cmd.colorscheme('catppuccin_mocha')
-- use terminal background
vim.api.nvim_set_hl(0, 'Normal', {ctermbg = 'NONE'})
-- color for line number
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#cba6f7' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#74c7ec' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#cba6f7' })

-- restore cursor on exit (not needed if u use vi mode in your interactive shell)
--[[
vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
 	pattern = {'*'},
 	callback = function()
 		vim.o.guicursor = "a:hor20"
 	end
})
]]--
