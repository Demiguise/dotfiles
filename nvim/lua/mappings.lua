local vimp = require('vimp')

vimp.inoremap('<Up>','<Nop>')
vimp.inoremap('<Down>','<Nop>')
vimp.inoremap('<Left>','<Nop>')
vimp.inoremap('<Right>','<Nop>')

vimp.noremap('<Up>','<Nop>')
vimp.noremap('<Down>','<Nop>')
vimp.noremap('<Left>','<Nop>')
vimp.noremap('<Right>','<Nop>')

-- Exit insert mode by typing
vimp.inoremap('jk','<ESC>')

-- Stop exiting when I just want to close a buffer

-- Easier window movement
vimp.nnoremap('<leader>h',':wincmd h<CR>')
vimp.nnoremap('<leader>j',':wincmd j<CR>')
vimp.nnoremap('<leader>k',':wincmd k<CR>')
vimp.nnoremap('<leader>l',':wincmd l<CR>')

-- NVimTree Plugin
vimp.nnoremap('<C-n>',':NvimTreeToggle<CR>')

-- Telescope Plugin
vimp.nnoremap('<leader>ff','<cmd>Telescope find_files<CR>')
vimp.nnoremap('<leader>gb','<cmd>Telescope git_branches<CR>')

-- Bufferline
vimp.nnoremap('<C-1>', '<Cmd>BufferLineGoToBuffer 1<CR>')
vimp.nnoremap('<C-2>', '<Cmd>BufferLineGoToBuffer 2<CR>')
vimp.nnoremap('<C-3>', '<Cmd>BufferLineGoToBuffer 3<CR>')
vimp.nnoremap('<C-4>', '<Cmd>BufferLineGoToBuffer 4<CR>')
vimp.nnoremap('<C-5>', '<Cmd>BufferLineGoToBuffer 5<CR>')
vimp.nnoremap('<C-6>', '<Cmd>BufferLineGoToBuffer 6<CR>')
vimp.nnoremap('<C-7>', '<Cmd>BufferLineGoToBuffer 7<CR>')
vimp.nnoremap('<C-8>', '<Cmd>BufferLineGoToBuffer 8<CR>')
vimp.nnoremap('<C-9>', '<Cmd>BufferLineGoToBuffer 9<CR>')
vimp.nnoremap('<leader>b','<cmd>BufferLinePick<CR>')
