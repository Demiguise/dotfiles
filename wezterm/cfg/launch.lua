local platform = require('utils.platform')

local options = {
    default_prog = {},
    launch_menu = {},
}

if platform.is_win then
    options.default_prog = { 'pwsh', '-NoLogo' }
    options.launch_menu = {
        { label = 'PowerShell Core', args = { 'pwsh', '-NoLogo' } },
        {
         label = 'Git Bash',
         args = { 'C:\\Users\\kevin\\scoop\\apps\\git\\current\\bin\\bash.exe' },
        },
    }
elseif platform.is_mac then
    options.default_prog = { '/opt/homebrew/bin/zsh', '-l' }
    options.launch_menu = {
        { label = 'Zsh', args = { 'zsh', '-l' } },
    }
elseif platform.is_linux then
    options.default_prog = { 'zsh', '-l' }
    options.launch_menu = {
        { label = 'Zsh', args = { 'zsh', '-l' } },
    }
end

return options