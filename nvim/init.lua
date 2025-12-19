vim.o.number = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.undofile = true

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', ':update<CR> :source %<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.pack.add({
    { src = 'https://github.com/olimorris/onedarkpro.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-mini/mini.pick' },
    { src = 'https://github.com/nvim-mini/mini.comment' },
    { src = 'https://github.com/nvim-mini/mini.pairs' },
    { src = 'https://github.com/nvim-mini/mini.icons' },
    { src = 'https://github.com/nvim-mini/mini.completion' },
    { src = 'https://github.com/nvim-mini/mini.tabline' },
    { src = 'https://github.com/stevearc/oil.nvim.git' },
})

vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')

require('oil').setup({
    view_options = {
        show_hidden = true
    }
})
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.lsp.enable({ 'lua_ls', 'clangd', 'veridian' })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.diagnostic.config({ virtual_text = { current_line = true } })

require('mini.pick').setup()
require('mini.pairs').setup()
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.tabline').setup()


vim.cmd('colorscheme onedark')
