# Neovim Configuration

A modern Neovim configuration focused on development productivity.

## Prerequisites

- Neovim >= 0.9.0
- Git
- A Nerd Font (for icons)
- Node.js (for LSP servers)
- ripgrep (for Telescope file search)

## Installation

1. Backup your existing Neovim configuration:
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone this configuration:
```bash
git clone https://github.com/markortleb/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/nvim ~/.config/nvim
```

3. Start Neovim - plugins will install automatically via lazy.nvim

## Structure

```
nvim/
├── lua/markortleb/
│   ├── plugins/           # Plugin configurations
│   │   ├── core/         # Essential plugins
│   │   ├── lsp/         # Language server configs
│   │   ├── completion/  # Autocompletion
│   │   ├── editing/     # Editing enhancements
│   │   └── ...
│   ├── keymaps/         # Key mappings
│   ├── settings/        # General Neovim settings
│   └── utils/           # Helper functions
└── init.lua             # Entry point
```

## Key Features

- 🚀 Fast startup with lazy loading
- 📦 Modern plugin management with lazy.nvim
- 🔍 Intelligent code completion (nvim-cmp)
- 🎨 Multiple colorscheme options
- 🌳 File explorer and project management
- 🔧 Built-in LSP configuration
- ⚡ Fuzzy finding with Telescope
- 📊 Status line and tabline

## Included Plugins

Core:
- Treesitter for better syntax highlighting
- Mason for LSP management
- Telescope for fuzzy finding
- nvim-cmp for completion

UI:
- Multiple colorschemes (rose-pine, kanagawa, etc.)
- Lualine for status line
- Dashboard for start screen

Development:
- LSP support for multiple languages
- Git integration
- Database tools (vim-dadbod)
- Markdown preview

## Customization

The configuration is modular and easy to extend:

1. Add new plugins in `lua/markortleb/lazy.lua`
2. Configure plugins in `lua/markortleb/plugins/`
3. Add keymaps in `lua/markortleb/keymaps/`
4. Modify settings in `lua/markortleb/settings/`

## Troubleshooting

If you encounter issues:

1. Update Neovim to latest version
2. Remove plugin cache: `rm -rf ~/.local/share/nvim`
3. Update plugins: `:Lazy update`
4. Check health: `:checkhealth`
