#!/usr/bin/env bash

set -e

function install_mac() {
  echo "📦 Detected macOS"
  if ! command -v brew &> /dev/null; then
    echo "🍺 Homebrew not found, installing it first..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  echo "🔁 Installing Neovim with clipboard support..."
  brew install neovim
  echo "✅ Neovim with clipboard support installed!"
}

function install_ubuntu() {
  echo "🐧 Detected Ubuntu/Debian"
  echo "📦 Installing xclip and Neovim..."
  sudo apt update
  sudo apt install -y neovim xclip
  echo "✅ Done! Clipboard support should now work."
}

function install_wsl() {
  echo "🪟 Detected WSL"
  echo "📦 Installing win32yank.exe for clipboard integration..."

  sudo apt install neovim

  mkdir -p ~/.local/bin
  cd ~/.local/bin

  curl -LO https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip
  unzip win32yank-x64.zip
  chmod +x win32yank.exe
  rm win32yank-x64.zip

  echo "✅ win32yank installed at ~/.local/bin/win32yank.exe"
  echo "🔧 Now add this to your Neovim config:"
  cat <<'EOF'

vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf"
  },
  cache_enabled = 0,
}
EOF
}

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  install_mac
elif grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
  install_wsl
elif [[ -f /etc/debian_version ]]; then
  install_ubuntu
else
  echo "❌ Unsupported OS: $OSTYPE"
  exit 1
fi

