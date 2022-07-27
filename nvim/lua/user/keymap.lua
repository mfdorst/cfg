local map = function(m, k, v)
    vim.api.nvim_set_keymap(m, k, v, { noremap = true, silent = true })
end
-- Map terminal mode
local tmap = function(k, v)
    vim.api.nvim_set_keymap('t', k, v, { silent = true })
end
-- Map normal mode
local nmap = function(k, v) map('n', k, v) end
-- Map insert mode
local imap = function(k, v) map('i', k, v) end
-- Map visual mode
local vmap = function(k, v) map('v', k, v) end
-- Map visual block mode
local xmap = function(k, v) map('x', k, v) end
-- Map command mode
local cmap = function(k, v) map('c', k, v) end

-- Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Normal --
-- Paste from system clipboard
nmap("<C-v>", '"+p')

-- Navigate faster
nmap("<S-j>", "<C-d>")
nmap("<S-k>", "<C-u>")

-- Better window navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Resize with arrows
nmap("<C-Up>", ":resize -2<CR>")
nmap("<C-Down>", ":resize +2<CR>")
nmap("<C-Left>", ":vertical resize -2<CR>")
nmap("<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
nmap("<S-l>", ":bnext<CR>")
nmap("<S-h>", ":bprevious<CR>")

-- Move text up and down
-- nmap("<A-j>", "<Esc>:m .+1<CR>==gi")
-- nmap("<A-k>", "<Esc>:m .-2<CR>==gi")

-- Insert --
-- Paste in insert mode
imap("<C-v>", '<ESC>"+p')
 
-- Press jk fast to exit insert mode 
imap("jk", "<ESC>")
imap("kj", "<ESC>")

-- Visual --
-- Copy and paste in visual mode
vmap("<C-c>", '"+y')
vmap("<C-v>", '"+p')

-- Press j and k together to exit visual mode
vmap("jk", "<ESC>")
vmap("kj", "<ESC>")

-- Stay in visual mode after indent
vmap("<", "<gv")
vmap(">", ">gv")

-- Move text up and down
-- vmap("<A-j>", ":m .+1<CR>==")
-- vmap("<A-k>", ":m .-2<CR>==")
-- vmap("p", '"_dP')

-- Visual Block --
-- Move text up and down
-- xmap("J", ":move '>+1<CR>gv-gv")
-- xmap("K", ":move '<-2<CR>gv-gv")
-- xmap("<A-j>", ":move '>+1<CR>gv-gv")
-- xmap("<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
-- tmap("<C-h>", "<C-\\><C-N><C-w>h")
-- tmap("<C-j>", "<C-\\><C-N><C-w>j")
-- tmap("<C-k>", "<C-\\><C-N><C-w>k")
-- tmap("<C-l>", "<C-\\><C-N><C-w>l")
