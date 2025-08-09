#!/bin/bash

# Format: "name:scope"
# scope can be 'all' (installed always) or 'personal' (skipped with --work flag)
packages=(
    "wget:all"
    "gh:all"
    "bitwarden:all"
    "git:all"
    "git-delta:all"
    "gcc:all"
    "bat:all"
    "kubectl:all"
    "helm:all"
    "k9s:all"
    "yq:all"
    "jq:all"
    "oh-my-posh:all"
    "go:all"
    "dotnet:all"
    "neovim:all"
    "ollama:all"
    "htop:all"
)

# Format: "name:scope"
# scope can be 'all' (installed always) or 'personal' (skipped with --work flag)
casks=(
    "microsoft-edge:personal"
    "visual-studio-code:personal"
    "spotify:personal"
    "google-drive:personal"
    "discord:personal"
    "displaylink:all"
    "kitty:all"
    "font-meslo-lg-nerd-font:all"
    "font-jetbrains-mono:all"
    "docker-desktop:all"
)

WORK_MODE=false
SHOW_HELP=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --work | -w)
      WORK_MODE=true
      shift
      ;;
    --help | -h)
      SHOW_HELP=true
      break
      ;;
    *)
      shift
      ;;
  esac
done

if $SHOW_HELP; then
  cat << EOF
Installs brew packages and casks.

Usage:
  $(readlink -f "$0") [flags]

Flags:
  --work-mode, -w            Skip installation of zsh
  -h, --help                 Show help
EOF
  exit 0
fi

echo "✨ installing brew packages"
for item in "${packages[@]}"; do
    package_name="${item%%:*}"
    scope="${item##*:}"

    if [[ "$scope" == "all" ]] || ( [[ "$scope" == "personal" ]] && [[ "$WORK_MODE" == false ]] ); then
        echo "⏳ installing package: $package_name"
        brew install "$package_name" --quiet
    else
        echo "⏭️ skipping $scope package: $package_name"
    fi
done

echo "✨ installing brew casks"
for item in "${casks[@]}"; do
    cask_name="${item%%:*}"
    scope="${item##*:}"

    if [[ "$scope" == "all" ]] || ( [[ "$scope" == "personal" ]] && [[ "$WORK_MODE" == false ]] ); then
        echo "⏳ installing cask: $cask_name..."
        brew install --cask "$cask_name" --quiet
    else
        echo "⏭️ skipping $scope cask: $cask_name"
    fi
done

# --- OS-specific installations ---
case $(uname) in
  Linux)
    # Specific packages for Linux
    # echo "✨ installing specific Linux packages"
  ;;
  Darwin)
    # Specific packages for MacOS
    echo "✨ installing specific MacOS packages"
    brew install watch --quiet
  ;;
esac

echo "✅ installation completed"
