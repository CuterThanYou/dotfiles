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

-- language server
local lsp = require('lspconfig')
-- C
lsp.clangd.setup({})
-- rust
lsp.rust_analyzer.setup {
	settings = {
		['rust-analyzer'] = {
			check = {
				command = "clippy";
			},
		}
	},

	-- don't recolor
	on_attach = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
}

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
-- whitespace indicator
vim.opt.list = true
vim.opt.listchars:append {
	tab=" ▏ ",
	trail="+",
	leadmultispace=".",
}

-- color
vim.opt.termguicolors = true
vim.cmd.colorscheme('catppuccin')
-- use terminal background
vim.api.nvim_set_hl(0, 'Normal', {ctermbg = 'NONE'})
-- color for line number
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#cba6f7' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#74c7ec' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#cba6f7' })

-- languages specifics

-- fuck you rust doc, can't tell me what to do, 4 spaces my ass
vim.g.rust_recommended_style = false -- use tab instead of space
vim.g.python_recommended_style = false -- shite language
-- use space instaed of tab for haskell
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'haskell' },
	command = 'set expandtab',
})

-- open in tab instead to split
vim.api.nvim_create_autocmd('BufNew', {
	pattern = '*',
	command = 'wincmd T',
})

-- restore cursor on exit (not needed if u use vi mode in your interactive shell)
--[[
vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
 	pattern = {'*'},
 	callback = function()
 		vim.o.guicursor = "a:hor20"
 	end
})
]]--
