vim.g.mapleader = " "

vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.undofile = true
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 99
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.completeopt = { "longest", "menuone" }
vim.opt.backup = false
vim.opt.writebackup = false

-- Global configs
vim.g.base16colorspace = 256
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "soft"
vim.g.fzf_layout = { down = "~30%" }
vim.g.mkdp_auto_start = 1
vim.g.NERDTreeIgnore = { '^node_modules$' }

vim.g.coc_global_extensions = {
  'coc-snippets',
  'coc-pairs',
  'coc-tsserver',
  'coc-eslint',
  'coc-prettier',
  'coc-json',
  'coc-solargraph',
  'coc-rust-analyzer',
	'coc-elixir'
}

vim.cmd("filetype plugin indent on")

vim.cmd("colorscheme gruvbox8")
vim.o.background = "dark"

 -- Plugins Manger
vim.pack.add({
  { src = "https://github.com/neoclide/coc.nvim" },
  { src = "https://github.com/lifepillar/vim-gruvbox8" },
  { src = "https://github.com/chriskempson/base16-vim" },
  { src = "https://github.com/junegunn/fzf" },
  { src = "https://github.com/junegunn/fzf.vim" },
  { src = "https://github.com/tpope/vim-fugitive" },
  { src = "https://github.com/apzelos/blamer.nvim" },
  { src = "https://github.com/sindrets/diffview.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/elixir-lsp/coc-elixir" }
})

vim.keymap.set('n', '<leader>e', ':Exp<CR>')
vim.keymap.set('n', '<leader>cf', ':vsplit ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>cr', ':CocRestart<CR>')
vim.keymap.set('n', '<leader>s', ':source%<CR>')
vim.keymap.set('n', '<C-s>', ':w!<CR>')
vim.keymap.set('n', '<C-q>', ':bd<CR>')
vim.keymap.set('n', '<leader>ff', ':Files<CR>')
vim.keymap.set('n', '<C-f>', ':Rg<CR>')
vim.keymap.set('n', '<C-r>', ':vsplit<CR>')
vim.keymap.set('n', '<S-h>', ':bprev<CR>')
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<leader>g', ':GFiles?<CR>')

-- keymaps LSP Coc
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })
vim.keymap.set('n', '<leader>ca', '<Plug>(coc-codeaction)', { silent = true })
vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)', { silent = true })

vim.keymap.set({ 'x', 'n' }, '<leader>f', '<Plug>(coc-format-selected)', { silent = true })

vim.keymap.set('n', '<leader>hb', function()
  require('gitsigns').blame_line({ full = true })
end)
vim.keymap.set('n', '<leader>ht', function()
  require('gitsigns').toggle_current_line_blame()
end)

vim.keymap.set('n', 'K', function()
  local filetype = vim.bo.filetype
  if filetype == 'vim' or filetype == 'help' then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn.exists('*CocAction') == 1 and vim.g.coc_service_initialized == 1 then
    if vim.fn.CocAction('hasProvider', 'hover') then
      vim.fn.CocActionAsync('doHover')
    else
      vim.fn.feedkeys('K', 'in')
    end
  else
    vim.fn.feedkeys('K', 'in')
  end
end, { silent = true })

vim.keymap.set('i', '<Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#next'](1)
  else
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      return '<Tab>'
    else
      return vim.fn['coc#refresh']()
    end
  end
end, { expr = true, silent = true })

vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#prev'](1)
  else
    return '<C-h>'
  end
end, { expr = true, silent = true })

vim.keymap.set('i', '<CR>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#confirm']()
  else
    return '<C-g>u<CR><C-r>=coc#on_enter()<CR>'
  end
end, { expr = true, silent = true })

local function toggle_background()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
    vim.g.gruvbox_contrast_light = 'soft'
  else
    vim.o.background = 'dark'
    vim.g.gruvbox_contrast_dark = 'hard'
  end
  vim.cmd('colorscheme gruvbox8')
end

vim.keymap.set('n', '<leader>t', toggle_background)

vim.api.nvim_create_user_command('OR', function()
  vim.fn.CocActionAsync('runCommand', 'editor.action.organizeImport')
end, {})

vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  callback = function()
    vim.fn.CocActionAsync('highlight')
  end,
  desc = 'Highlight symbol under cursor'
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    always_divide_middle = true,
    always_show_tabline = true,
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 4,
        shorting_target = 40,
        symbols = {
          modified = " ●",
          alternate_file = "#",
          directory = "",
        },
      }
    },
    lualine_b = {
      {
        "branch",
        fmt = function(branch)
          local limit = 20
          return branch:sub(1, limit) .. (branch:len() > limit and "…" or "")
        end,
      },
      "diff",
      "diagnostics",
    },
  }
}

require("bufferline").setup {
  options = {
    mode = "buffers",
    numbers = "ordinal",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,

    indicator = {
      icon = '▎',
      style = 'icon',
    },

    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',

    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,

    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    custom_filter = function(buf_number)
      local filetype = vim.bo[buf_number].filetype
      if filetype == "NvimTree" then
        return false
      end
      return true
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      }
    },

    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,

    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
  }
}

require("ibl").setup()

require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '|' },
    topdelete    = { text = '|' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '|' },
    topdelete    = { text = '|' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,
  numhl      = false,
  linehl     = false,
  word_diff  = false,
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

vim.cmd('highlight GitSignsCurrentLineBlame guifg=#909090 gui=italic')
