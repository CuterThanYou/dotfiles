-- keybinding
local map = vim.keymap.set
-- system clipboard
map('v', '<C-c>', '"+y')
map('n', '<C-v>', '"+p')
map('i', '<C-v>', '<Esc>"+pa')

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
