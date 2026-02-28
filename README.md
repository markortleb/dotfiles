# Dotfiles
Configuration files for my development environment.

## Prerequisites

### Ubuntu
```bash
# Get list of installed packages
aptitude search '~i!~M' > Aptfile

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh
```

### Mac
```bash
# Get list of installed packages
brew bundle dump

# Install starship prompt
brew install starship
```

## Components

### Neovim
See [nvim/README.md](nvim/README.md) for detailed Neovim configuration documentation.

### tmux
1. Install tmux plugin manager:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Refresh tmux config:
```bash
tmux source ~/.tmux.conf
```

## Installation
```bash
# Clone the repository
git clone https://github.com/markortleb/dotfiles.git ~/.dotfiles

# Create symbolic links
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

