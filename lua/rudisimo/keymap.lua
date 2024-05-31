vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set({'n', 'v'}, '<c-s>', '<cmd>w<CR>', { silent = true })
vim.keymap.set({'i'}, '<c-s>', '<Esc><cmd>w<CR>', { silent = true })

vim.keymap.set({'n', 'v'}, '<c-q>', '<cmd>q<CR>', { silent = true })
vim.keymap.set({'i'}, '<c-q>', '<Esc><cmd>q<CR>', { silent = true })

-- window management (split/close/movement)
vim.keymap.set('n', '_', '<cmd>split<CR>')
vim.keymap.set('n', '<bar>', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<c-w>', '<cmd>close<CR>')
vim.keymap.set('n', '<a-up>', '<cmd>wincmd k<CR>')
vim.keymap.set('n', '<a-right>', '<cmd>wincmd l<CR>')
vim.keymap.set('n', '<a-down>', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<a-left>', '<cmd>wincmd h<CR>')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [['_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({'n', 'v'}, '<leader>y', [['+y]])
vim.keymap.set('n', '<leader>Y', [['+Y]])

-- delete towards direction
vim.keymap.set({'n', 'v'}, '<leader>d', [['_d]])

-- This is going to get me cancelled
vim.keymap.set('i', '<c-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<c-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

vim.keymap.set('n', '<c-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<c-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- replace word under caret
vim.keymap.set('n', '<leader>s', [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gI<Left><Left><Left>]])

-- reload current file
vim.keymap.set('n', '<leader>r', function()
  vim.cmd [[so]]
end)