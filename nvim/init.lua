vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cc = 100
vim.o.mouse = 'a'
vim.o.exrc = true
vim.o.wrap = false
vim.o.swapfile = true
vim.o.errorbells = false
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.cmdheight = 2
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME")..'/.config/nvim/undodir'

-- Having longer updatetime (default is 4000ms = 4s) leads to noticeable delays.
vim.o.updatetime = 50

vim.g.mapleader = " "

-- Escape to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true })
vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true })

-- Join lines
vim.api.nvim_set_keymap('n', '<C-j>', '<S-j>', { noremap = true })

-- Fast scrolling
vim.api.nvim_set_keymap('n', '<S-j>', '<C-d>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-k>', '<C-u>', { noremap = true })

-- Copy and paste to and from the system clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '"+p', { noremap = true })

-- Create windows
vim.api.nvim_set_keymap('n', '<leader>v', '<C-w>v', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>s', '<C-w>s', { noremap = true })

-- Move between windows
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true })

require('plugins')

vim.api.nvim_command('colorscheme gruvbox')

vim.g.airline_powerline_fonts = 1

-- Fuzzy find
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })

vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0

