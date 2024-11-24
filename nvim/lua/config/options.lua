-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Windows check
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = "unnamedplus"
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -C [Console]::Out.Write($(Get-Clipboard -Raw).toString().replace("`r", ""))',
      ["*"] = 'powershell.exe -C [Console]::Out.Write($(Get-Clipboard -Raw).toString().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

if vim.fn.has("macunix") == 1 then
  vim.g.python3_host_prog = "~/.config/nvim-venv/bin/python"
else
  vim.g.python3_host_prog = "C:/Users/Andy/AppData/Local/nvim-venv/Scripts/python.exe"
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i",
      ["*"] = "win32yank.exe -i",
    },
    paste = {
      ["+"] = "win32yank.exe -o",
      ["*"] = "win32yank.exe -o",
    },
    cache_enabled = 0,
  }
end
