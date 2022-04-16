local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'

  -- Colour handling
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- File finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use 'BurntSushi/ripgrep'

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'neovim/nvim-lspconfig'
    }
  }

  -- Shows indentation level for code
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function () require('indent_blankline').setup{} end
  }

  -- Automatically handles {} () []
   use {
    "windwp/nvim-autopairs",
    config = function () require('nvim-autopairs').setup{} end
  }

  -- Easier configuration
  use 'svermeulen/vimpeccable'

  -- Git
  use "airblade/vim-gitgutter"
  use "tpope/vim-fugitive"

  -- Project
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end
  }

  -- Colourscheme
  use 'marko-cerovac/material.nvim'

  -- LSP configuration
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Show buffers in the top section of the window
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    branch = 'main'
  }

  -- Neat status bar
  use {
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }

  -- Greet when we open!
  use 'mhinz/vim-startify'

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require('nvim-tree').setup {} end
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
