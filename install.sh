# !/bin/bash

echo "✨ instalando zsh"
sudo apt install zsh -y

echo "✨ instalando oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "✨ instalando oh-my-posh"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

echo "🎨 copiando tema"
cp -r Modules/omp-themes/default.omp.json ~/.

echo "📂 copiando arquivos de configuração"
cp -r home/. ~/.
