"""""""""""""""""""
" Plugins and plugin related settings
"""""""""""""""""""

call plug#begin()

Plug '~/.vim/plugged/vim-solarized8',
Plug '~/.vim/plugged/lightline.vim',
Plug '~/.vim/plugged/vim-fugitive',
Plug '~/.vim/plugged/ctrlp.vim',
Plug '~/.vim/plugged/vim-ripgrep'

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

"""""""""""""""""""
" Ripgrep (Might only be on linux for now)
"""""""""""""""""""

if executable('rg')
    let g:rg_derive_root='true'
endif
