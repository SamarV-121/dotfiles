ZSH_DISABLE_COMPFIX=true

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source "$ZSH/oh-my-zsh.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
source "$HOME/.zsh_custom/zsh-completions/zsh-completions.plugin.zsh"
source "$HOME/.zsh_custom/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$HOME/.zsh_custom/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
source "$HOME/.zsh_custom/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Git config
git config --global user.name "SamarV-121"
git config --global user.email "samarvispute121@gmail.com"
git config --global credential.helper store
git config --global credential.username "SamarV-121"
git config --global core.hooksPath "$HOME/.git-hooks"
[[ $(gpg --list-keys) ]] &&
	git config --global commit.gpgsign true &&
	git config --global user.signingkey "687A73FEA3744800" &&
	git config --global gpg.program gpg2

# Exports
export CCACHE_COMPRESS=1
export CCACHE_DIR=$HOME/.ccache
export CCACHE_EXEC=/usr/bin/ccache
export USE_CCACHE=1
export SKIP_ABI_CHECKS=true
export EDITOR=nano
export GOPATH=$HOME/.go
export PATH="$HOME/bin:$HOME/.gem/ruby/2.7.0/bin:$PATH"
export ANDROID_HOME=$HOME/android/sdk/
export PROMPT_COMMAND='history -a'
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"

# Alias
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../..'
alias .....=../../../..
alias ......='cd ../../..'
alias ........='cd ../../../..'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias _='sudo '
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias c=clear
alias changemirror='nano /etc/pacman.d/mirrorlist'
alias cleanup='find ~/.cache/ -type f -atime +100 -delete; sudo journalctl --vacuum-size=50M; sudo pacman -Scc'
alias cp='cp -p'
alias da='du -sch'
alias df='df -h'
alias dir='command ls -lSrah'
alias du='du -c -h'
alias enter_matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
alias fileup='fileup.sh'
alias free='free -h'
alias freemem='sudo /sbin/sysctl -w vm.drop_caches=3'
alias ga='git add -A'
alias gc='git commit -s'
alias gch='git cherry-pick'
alias gcp='gcloud alpha cloud-shell ssh'
alias gchc='git cherry-pick --continue'
alias gcl='git reset --hard && git clean -f -d'
alias gd='gdrive download'
alias gf='git fetch'
alias github-release='github-release.sh'
alias gt='gitutils.sh'
alias gmc='git am --continue'
alias gmr='git am --abort'
alias go='git clone --depth=1'
alias gp='git push -f'
alias gr='git revert'
alias gra='git remote add'
alias gre='git reset --hard'
alias grep='grep --color=tty -d skip'
alias gu='gdrive upload'
alias history=omz_history
alias install='yay -Sy'
alias l='ls -hF --color=auto'
alias la='ll -A'
alias lad='command ls -d .*(/)'
alias lh='command ls -hAl --color=auto -v'
alias list='yay -Qs'
alias ll='ls -alh'
alias lm='la | less'
alias lr='ls -R'
alias ls='ls --color=auto'
alias lsa='command ls -a .*(.)'
alias lsbig='command ls -flh *(.OL[1,10])'
alias lsd='command ls -d *(/)'
alias lse='command ls -d *(/^F)'
alias lsl='command ls -l *(@)'
alias lsnew='command ls -rtlh *(D.om[1,10])'
alias lsnewdir='command ls -rthdl *(/om[1,10]) .*(D/om[1,10])'
alias lsold='command ls -rtlh *(D.Om[1,10])'
alias lsolddir='command ls -rthdl *(/Om[1,10]) .*(D/Om[1,10])'
alias lss='command ls -l *(s,S,t)'
alias lssmall='command ls -Srl *(.oL[1,10])'
alias lsw='command ls -ld *(R,W,X.^ND/)'
alias lsx='command ls -l *(*)'
alias md='mkdir -p'
alias mem-by-proc='ps aux | head -1; ps aux | sort -rnk 4 | head -n5'
alias mkdir='mkdir -p -v'
alias nano='nano -w -c'
alias pacman='sudo pacman'
alias plock='sudo rm /var/lib/pacman/db.lck'
alias powertop='sudo powertop'
alias remove='yay -Rs'
alias rfa='repo forall -c'
alias rfap='repo forall -p -c'
alias rinf='repo info'
alias root='sudo su'
alias rra='repo rebase --auto-stash'
alias rs='repo sync'
alias rsrra='repo sync ; repo rebase --auto-stash'
alias rst='repo status'
alias rsto='repo status -o'
alias ru='repo upload'
alias scat='sudo cat'
alias search='yay -Ss'
alias ssh='ssh -o ServerAliveInterval=60'
alias sudo='sudo '
alias sync='repo sync -c -q -j$(nproc --all) --no-clone-bundle --no-tags --optimized-fetch --prune'
alias tlog='sudo journalctl -f'
alias update='yay -Syy'
alias upgrade='yay -Syyu'
alias vnc='vnc4server :1 -blacklisttimeout 0'

if which hub &>/dev/null; then
	alias git=hub
fi

# Functions
function nline { git ls-files -z | while IFS= read -rd '' f; do tail -c1 <"$f" | read -r _ || echo >>"$f"; done; }

function nn { nano "$@" & if echo "$@" | grep "/"; then dir="${1%/*}"; fi; mkdir -p "$dir" 2>/dev/null; nano -wc "$@"; }

function update_dotfiles { curl -s https://raw.githubusercontent.com/SamarV-121/dotfiles/master/install.sh | bash; }

function decrypt { [ "$1" ] && gpg --decrypt --output "$(basename "$1" .gpg)" --recipient "samarvispute121@gmail.com" "$1"; }

function encrypt { [ "$1" ] && gpg --encrypt --output "$(basename "$1").gpg" --recipient "samarvispute121@gmail.com" "$1"; }

source "$HOME"/.TOKENs

eval "$(thefuck --alias)"
