require('local')
require('plugins')

vim.o.termguicolors = true

-- Configuration for plugins go below
require('plugin-conf.bufferline')
require('plugin-conf.cmp')
require('plugin-conf.lualine')
require('plugin-conf.lsp')
require('plugin-conf.nvim-tree')
require('plugin-conf.telescope')
require('plugin-conf.treesitter')

-- Settings should come after plugins, since they may reference them
require('editor')
require('mappings')
require('colourscheme')
