export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  docker
  docker-compose
  emoji
)

eval "$(oh-my-posh init zsh --config ~/default.omp.json)"
