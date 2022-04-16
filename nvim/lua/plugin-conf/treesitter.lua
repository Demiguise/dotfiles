require('nvim-treesitter.install').compilers = { "clang" }
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c", "cpp",
    "kotlin", "java",
    "rust", "lua"
  }
  highlight = {
      enable = true
  }
}
