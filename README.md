## neovim-setup

This is my setup to work vim neovim/vim and Python. It uses black as a formatter, mypy as a linter and pyright as a language server. Your setup will look like this, see this print error:

![neovim_screenshot](/images/image1.png)

It has auto complete for Python, files and etc.

### Pre-requisite

1. Clone this repository
2. Change the name fsavoia for you username

### Setup

1. Open and save the file `~/.config/nvim/lua/fsavoia/plugins-setup.lua`
2. Open neovim and rum `:Mason` and wait until everything is installed

## tmux-setup

### Pre-requisite

1. Install tpm (tmux plugin manager)

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Setup

1. Copy and save `~/.tmux.conf` in your home directory

### Commands

* `C-a S`: naviagate in sessions
* `C-a -`: split horizontally
* `C-a |`: split vertically
