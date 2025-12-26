-- Options

-- Editor
vim.o.number = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.autoread = true
vim.o.hidden = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.showmatch = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400
vim.opt.colorcolumn = "80"
vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣"
}
vim.opt.colorcolumn = "120"
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.lazyredraw = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.inccommand = 'split'

-- UI
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = false
vim.o.linebreak = true
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true }, }) 

-- Packages
vim.pack.add ({
    { src = 'https://github.com/neovim/nvim-lspconfig' },

    { src = 'https://github.com/nvim-mini/mini.pick' },
    { src = 'https://github.com/nvim-mini/mini.comment' },
    { src = 'https://github.com/nvim-mini/mini.pairs' },
    { src = 'https://github.com/nvim-mini/mini.icons' },
    { src = 'https://github.com/nvim-mini/mini.tabline' },
    { src = 'https://github.com/nvim-mini/mini.completion' },

    { src = 'https://github.com/stevearc/oil.nvim' },

    { src = 'https://github.com/navarasu/onedark.nvim' },
})

-- Mini
require('mini.pick').setup({
    lsp_completion = {
        source_func = 'omnifunc',
    },
})

require('mini.comment').setup()
require('mini.pairs').setup()
require('mini.icons').setup()
require('mini.tabline').setup()
require('mini.completion').setup()

-- Oil
require('oil').setup({
    window = {
        info = { height = 25, width = 80, border = 'single' },
        signature = { height = 25, width = 80, border = 'single' },
    },

    view_options = {
        show_hidden = true,
    },
})

-- LSP
vim.lsp.enable('clangd')

-- Theme
require('onedark').load()

-- Keymaps
local map = vim.keymap.set
local opts = { silent = true, remap = false }

vim.g.mapleader = ' '
map("n", " ", "<Nop>", opts)

map('n', '<leader>w', ':w<CR>', opts) -- Write
map('n', '<leader>x', ':w<CR>:bd<CR>', opts) -- Write and quit
map('n', '<leader>q', ':wqa!<CR>', opts) -- Write all and quit

map('n', '<leader>u', ':undo<CR>', opts) -- Undo
map('n', '<leader>r', ':redo<CR>', opts) -- Redo

map('n', '<leader>,', ':bprevious<CR>', { silent = true, remap = true })
map('n', '<leader>.', ':bnext<CR>',  { silent = true, remap = true })

map("n", "o", "o<Esc>", { silent = true, noremap = true })
map("n", "O", "O<Esc>", { silent = true, noremap = true })

map('n', '<leader>o', ':w<CR>:source<CR>', opts) -- Reload config

map('n', '<leader>0', ":tablast<cr>", opts)

map('n', '<leader>e', ':Oil<CR>', opts)
map('n', '<leader>f', ':Pick files<CR>', opts)

map('n', '<leader>c', ':noh<CR>', opts)
