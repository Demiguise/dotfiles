# dotfiles

Script to populate a fresh environment with a bunch of settings.

## Setup Windows

### Winget

Install these things via Winget

- Neovim.Neovim
- BurntSushi.ripgrep.MSVC
- sharkdp.fd
- JesseDuffield.lazygit
- equalsraf.win32yank

### Clipboard

Needs win32yank, which is installed via Winget, and requires the custom setup in options.

### Python3

Install python3 from the main website, install it everywhere.
Make a virtual environment for nvim the same as you would on Linux.

`python -m venv C:\Users\<User>\AppData\Local\nvim-venv`

Then after that you can install `pynvim` and `neovim` via the pip inside the venv.
Remember to activate it though, using the `scripts/activate`

### Git

The lazyvim setup will complain about bad git permissions so remember to do the following
command so that it's able to query the git status.

`git config --global --add safe.directory C:\Users\<User>\AppData\Local\nvim-data\*`

