# Fetch dotfiles
if [ -d ~/.dotfiles ]; then
	git -C ~/.dotfiles fetch origin && git -C ~/.dotfiles reset --hard FETCH_HEAD
else
	git clone https://github.com/SamarV-121/dotfiles ~/.dotfiles
fi

# Fetch modules
git -C ~/.dotfiles submodule update --init --recursive

# Install oh-my-zsh | powerlevel10k if not installed
[[ ! -d ~/.oh-my-zsh ]] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Symlink
ln -sf ~/.dotfiles/.git-hooks ~/.git-hooks
ln -sf ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.zsh_custom ~/.zsh_custom
ln -sf ~/.dotfiles/bin ~/bin
ln -sf ~/.dotfiles/latte.layout.latte ~/latte.layout.latte
