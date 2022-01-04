require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      ".git",
      ".cache",
      ".vscode"
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorted = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

require('telescope').load_extension('fzf')
