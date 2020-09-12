git clone --recursive https://github.com/SamarV-121/dotfiles
git clone https://github.com/SamarV-121/priv

cp -R dotfiles/bin $HOME/.
cp -R dotfiles/.vim* $HOME/.
cp -R dotfiles/.p10k.zsh $HOME/.
cp -R dotfiles/.zsh* $HOME/.
cp -R dotfiles/latte.layout.latte $HOME/.
