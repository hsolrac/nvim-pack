vim.g.mapleader = " "

vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.undofile = true
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 99
vim.opt.ai = true
vim.opt.ma = true
vim.opt.si = true
vim.opt.ts = 2
vim.opt.sw = 2
vim.opt.autoindent = true

vim.g.fzf_layout = { down = "~30%" }
vim.g.mkdp_auto_start = 1

vim.cmd("filetype plugin indent on")

vim.keymap.set({'n', 'v'}, '<leader>x', vim.lsp.buf.references, { buffer = true} )
vim.keymap.set('n', '<C-l>', ':Explore <CR>')
vim.keymap.set('n', '<C-s>', ':w! <CR>')
vim.keymap.set('n', '<leader>s', ':source% <CR>')
vim.keymap.set('n', '<leader>ev', ':vsplit ~/.config/nvim-pack/init.lua <CR>')
vim.keymap.set('n', 'S-l', ':bnext<CR>')
vim.keymap.set('n', 'S-h', ':bprev<CR>')

vim.keymap.set('n', 'C-p', ':Files<CR>')
vim.keymap.set('n', '<leader>g', ':GFiles?<CR>')
vim.keymap.set('n', '<C-f>', ':Rg<CR>')

vim.cmd("colorscheme gruvbox8")
vim.o.background = "dark"

-- GoTo code navigation
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.keymap.set('n', '<leader>ca', '<Plug>(coc-codeaction)', { silent = true })
vim.keymap.set('n', '<leader>fx', '<Plug>(coc-fix-current)', { silent = true })

-- Use K to show documentation in preview window
vim.keymap.set('n', 'K', '<Plug>(coc-show-documentation)', { silent = true })

vim.pack.add({
	{ src = "https://github.com/junegunn/fzf.vim" },
	{ src = "https://github.com/junegunn/fzf" },
	{ src= "https://github.com/lifepillar/vim-gruvbox8"},
	{ src= "https://github.com/rafcamlet/coc-nvim-lua" },
	{ src= "https://github.com/neoclide/coc.nvim" }
})
