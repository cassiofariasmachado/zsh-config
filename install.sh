echo "✨ instalando zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "✨ instalando oh-my-posh"
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
chmod +x /usr/local/bin/oh-my-posh

echo "🎨 copiando tema"
cp -r Modules/omp-themes/default.omp.json ~/.

echo "📂 copiando arquivos de configuração"
cp -r home/. ~/.