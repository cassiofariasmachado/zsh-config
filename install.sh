# !/bin/bash

SKIP_INSTALL_BREW=false
SKIP_INSTALL_ZSH=false
SKIP_INSTALL_PACKAGES=false
SHOW_HELP=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip-install-brew | --skip-brew)
      SKIP_INSTALL_BREW=true
      shift
      ;;
    --skip-install-zsh | --skip-zsh)
      SKIP_INSTALL_ZSH=true
      shift
      ;;
    --skip-install-packages | --skip-packages)
      SKIP_INSTALL_PACKAGES=true
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
eval set -- "$PARSED_ARGS"

if $SHOW_HELP; then
  cat << EOF
Installs the this custom ZSH configuration.

Usage:
  $(readlink -f "$0") [flags]

Flags:
  --skip-install-zsh, --skip-zsh             Skip installation of zsh
  --skip-install-brew, --skip-brew           Skip installation of brew
  --skip-install-packages, --skip-packages   Skip installation of packages
  -h, --help                                 Show help
EOF
  exit 0
fi

if [ "$SKIP_INSTALL_BREW" = false ]; then
  echo "✨ instalando brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  case `uname` in
    Linux)
      # Commands for Linux

      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    ;;
  esac
fi

if [ "$SKIP_INSTALL_ZSH" = false ]; then
 echo "✨ instalando zsh"
  brew install zsh
fi

if [ "$SKIP_INSTALL_PACKAGES" = false ]; then
  echo "✨ instalando packages"
  sh ./install-packages.sh
fi

echo "✨ instalando oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "✨ instalando oh-my-posh"
case `uname` in
    Linux)
      sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
      sudo chmod +x /usr/local/bin/oh-my-posh
    ;;
    Darwin)
      brew install oh-my-posh
    ;;
  esac

echo "🎨 copiando tema"
cp -r Modules/omp-themes/default.omp.json ~/.
