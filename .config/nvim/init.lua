vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.mouse="" -- there is no palm rejection :/
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keybinding
local map = vim.keymap.set
map('v', '<C-c>', '"+y')
map('n', '<C-v>', '"+p')
map('i', '<C-v>', '<Esc>"+pa')
map('v', '<Space>', '<C-w>')
map('n', '<Space>', '<C-w>')
-- color
vim.cmd.colorscheme('catppuccin_mocha')
vim.api.nvim_set_hl(0, 'Normal', {ctermbg = 'NONE'}) -- use terminal background
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
