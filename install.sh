# Fetch dotfiles
if [ -d "$HOME/.dotfiles" ]; then
	git -C "$HOME/.dotfiles" fetch origin && git -C "$HOME/.dotfiles" reset --hard FETCH_HEAD
else
	git clone https://github.com/SamarV-121/dotfiles "$HOME/.dotfiles"
fi

# Fetch modules
git -C "$HOME/.dotfiles" submodule update --init --recursive

# Install oh-my-zsh | powerlevel10k if not installed
[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

# Improved Nano Syntax Highlighting Files
[[ ! -d "$HOME/.nano" ]] && curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

# Symlink
ln -sf "$HOME/.dotfiles/.git-hooks" "$HOME/.git-hooks"
ln -sf "$HOME/.dotfiles/.p10k.zsh" "$HOME/.p10k.zsh"
ln -sf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/.dotfiles/.zsh_custom" "$HOME/.zsh_custom"
ln -sf "$HOME/.dotfiles/bin" "$HOME/bin"
