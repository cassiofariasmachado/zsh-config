# 🚀 ZSH Configuration

This repository contains the configuration I usually use for ZSH.

## Installation

### (Recommended) Option 1: Install using dotfiles

* Configured using dotfiles as explained [here](https://github.com/cassiofariasmachado/dotfiles).

### Option 2: Install directly

To install:

1. Clone repo with `git submodules`:

    ```bash
    git clone --recursive https://github.com/cassiofariasmachado/zsh-config.git
    ```

2. Go to the repo folder:
    ```
    cd zsh-config
    ```

3. Run the installation script:
    ```bash
    # On Linux
    ./install.sh

    # On MacOS (brew and zsh are already installed)
    ./install.sh --skip-brew --skip-zsh
    ```

4. Configure dotfiles as explained [here](https://github.com/cassiofariasmachado/dotfiles).

## References

- Inspired by the configurations from the folks below:
  - [posh-files](https://github.com/jfbueno/posh-files.git) by [Jeferson Bueno](https://github.com/jfbueno)
  - [poshfiles](https://github.com/giggio/poshfiles) by [Giovanni Bassi](https://github.com/giggio)
