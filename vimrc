set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set cc=100
set mouse=a
syntax on

" If there is a vimrc in the current directory, source it
set exrc
set guicursor=
set nohlsearch
" Keep unsaved buffers open in the background
set hidden
set noerrorbells
set nowrap
set noswapfile
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set signcolumn=yes
set termguicolors

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000ms = 4s) leads to noticeable delays
" and poor user experience.
set updatetime=50

call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox

let mapleader = " "

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

nnoremap <C-j> <S-j>
nnoremap <S-j> <C-d>
nnoremap <S-k> <C-u>

inoremap jj <Esc>

