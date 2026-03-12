export ZSH="$HOME/.dotfiles"

# +---------------+
# | Setup Plugins |
# +---------------+
plugins=(
  git
  docker
  docker-compose
  emoji
)

# +---------------------------+
# | Setup Aliases & Functions |
# +---------------------------+
source ~/.config/zsh/.aliases
source ~/.config/zsh/.functions

echo "🧰 Imported alias and functions"

# +---------------------+
# | Setup Env Variables |
# +---------------------+
if [ -f ~/.config/zsh/.env-variables ]; then
  source ~/.config/zsh/.env-variables

  echo "⚙️ Configured environment variables"
fi

# +-----+
# | NVM |
# +-----+
if [ -d "$NVM_DIR" ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  echo "🛠️ Initialized nvm"
fi

# +-------+
# | Pyenv |
# +-------+
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
  eval "$(pyenv init --path)"

  echo "🛠️ Initialized pyenv"
fi

# +-------------------+
# | Specific OS stuff |
# +-------------------+
case `uname` in
  Darwin)
    # Commands for OSX

    # Start oh-my-posh only using iTerm2
    if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
      eval "$(oh-my-posh init zsh --config ~/default.omp.json)"
    fi
  ;;
  Linux)
    # Commands for Linux

    # Set up brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    # Set up oh-my-posh
    eval "$(oh-my-posh init zsh --config ~/default.omp.json)"
  ;;
esac

