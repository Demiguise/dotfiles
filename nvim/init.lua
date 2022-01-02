require('plugins')

vim.o.termguicolors = true

-- Configuration for plugins go below
require('plugin-conf.lsp')
require('plugin-conf.cmp')
require('plugin-conf.lualine')
require('plugin-conf.bufferline')
require('plugin-conf.telescope')
require('plugin-conf.treesitter')
require('plugin-conf.nvim-tree')

-- Settings should come after plugins, since they may reference them
require('colourscheme')
require('mappings')
require('editor')
