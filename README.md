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
1. Install tmux plugin manager (it must end up at `~/.tmux/plugins/tpm`, not
   just anywhere in your home dir, because `.tmux.conf` runs it from there):
```bash
make install module=tmux
# or by hand:
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Refresh tmux config:
```bash
tmux source ~/.tmux.conf
```

## Working with Claude Code

This setup is built to let you run `claude` in the terminal right alongside
Neovim without breaking flow:

- **tmux + Neovim navigation is unified.** `vim-tmux-navigator` (see
  `tmux/.tmux.conf`) makes plain `C-h` / `C-j` / `C-k` / `C-l` (no prefix)
  move between tmux panes *and* Neovim splits as if they were one grid. Split
  a pane with `prefix |`, run `claude` in it, put Neovim in the other pane,
  and jump between them with `C-h`/`C-l` — no prefix key needed either way.
- **Or stay inside Neovim.** `ToggleTerm` gives you 8 addressable terminal
  slots (`<leader>t1`-`<leader>t8`, see
  [nvim/lua/markortleb/docs/my_keymaps.md](nvim/lua/markortleb/docs/my_keymaps.md)).
  Dedicate one (e.g. `<leader>t1`) to `claude` so it's always one keystroke
  away, and `<Esc>` gets you out of terminal mode back to normal Neovim
  editing.
- **Zoom when you need the space.** `prefix m` (tmux) zooms the current pane
  to full size — useful for reading a long `claude` response — then zoom
  again to restore the split.
- **Edit a long prompt comfortably.** Since the shell is in vi mode
  (`bindkey -v`, see
  [zsh/docs/vi_mode_keymaps.md](zsh/docs/vi_mode_keymaps.md)), press `Esc`
  then `v` on a long `claude "..."` command to open it in Neovim for proper
  multi-line editing before running it.

## Installation
```bash
# Clone the repository
git clone https://github.com/markortleb/dotfiles.git ~/.dotfiles

# Create symbolic links
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

