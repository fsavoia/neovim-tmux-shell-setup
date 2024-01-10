## neovim-setup

### Pre-requisite

1. Clone this repository
2. Instal [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

### Setup

1. Copy nvim/.config/nvim in your home directory/.config/nvim

## tmux-setup

### Pre-requisite

1. Install [tmux](https://github.com/tmux/tmux/wiki/Installing)

2. Install tpm (tmux plugin manager)

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Setup

1. Copy and save `~/.tmux.conf` in your home directory

### Commands

- `C-a r`: reload configuration
- `C-a I`: install plugin
- `C-a s`: naviagate in opened sessions
- `C-a -`: split horizontally
- `C-a |`: split vertically
- `C-<vim motions>`: navigate between panes
- `C-a c`: create new tab
- `C-a <number>`: navigate between tabs
- `C-a <p|n>`: navigate between tabs
- `C-a ,`: rename specific tab
- `C-a w`: navigate in all opened tabs for this session
- `C-a [`: open copy mode using vi moviments (C-a to exit)

## shell-setup

### Pre-requisite

1. Install [ble.sh](https://github.com/akinomyoga/ble.sh)
2. Install [bat](https://github.com/sharkdp/bat)
3. Install [colorls](https://github.com/athityakumar/colorls) # Only MacOS

### Setup

1. Copy and save `~/.blerc` in your home directory
2. Copy and paste `~/.bashrc` ow `.zshrc` in your home directory
