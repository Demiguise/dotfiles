"""""""""""""""""""
" Plugins and plugin related settings
"""""""""""""""""""

call plug#begin()

Plug 'https://github.com/lifepillar/vim-solarized8.git',      {'commit' : 'd3ba802421fe745b8ab675dfdaa72389dc845604'}
Plug 'https://github.com/itchyny/lightline.vim',        	{'commit' : '8a712365f9708044667589d9fffd87a4825d29f6'}
Plug 'https://github.com/tpope/vim-fugitive.git',             {'tag' : 'v3.2'}
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git',             {'tag' : '1.81'}
Plug 'https://github.com/jremmen/vim-ripgrep.git',             {'tag' : 'v1.0.2'}
Plug 'https://github.com/preservim/nerdtree',             {'tag' : '6.10.10'}

call plug#end()

"""""""""""""""""""
" Solarized
"""""""""""""""""""
set background=dark
colorscheme solarized8

"""""""""""""""""""
" CtrlP
"""""""""""""""""""
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"let g:ctrlp_clear_cache_on_exit = 0
"
"""""""""""""""""""
" Nerdtree
"""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
