# !/bin/bash

brew install wget --quiet
brew install gh --quiet
brew install bitwarden --quiet
brew install git --quiet
brew install git-delta --quiet
brew install gcc --quiet
brew install bat --quiet
brew install kubectl --quiet
brew install helm --quiet
brew install k9s --quiet
brew install yq --quiet
brew install jq --quiet
brew install oh-my-posh --quiet
brew install --cask microsoft-edge --quiet
brew install --cask visual-studio-code --quiet
brew install go --quiet
brew install dotnet --quiet
brew install --cask spotify --quiet
brew install --cask google-drive --quiet
brew install --cask displaylink --quiet
brew install --cask kitty --quiet
brew install --cask font-meslo-lg-nerd-font --quiet
brew install --cask font-jetbrains-mono --quiet
brew install --cask docker-desktop --quiet

case `uname` in
  Linux)
    # Specific packages for Linux
  ;;
  Darwin)
    # Specific packages for MacOS
    brew install watch --quiet
  ;;
esac
