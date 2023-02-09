# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.npm-global/bin:/$HOME/.local/bin:$HOME/Android/Sdk/emulator:$PATH

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

unset rc
. "$HOME/.cargo/env"

alias ls="exa -al --group-directories-first"
alias vim="lvim"
alias projects="cd ~/Projects/"
alias config="cd ~/.config"
alias zshconfig="vim ~/.zshrc"
alias rofil="~/.config/rofi/scripts/launcher_t1"
alias cat="bat"
alias vpn-on="openvpn3 session-start --config $HOME/.config/vpn/filipe-ps-profile.ovpn"
alias vpn-off="openvpn3 session-manage --disconnect --config $HOME/.config/vpn/filipe-ps-profile.ovpn"
alias vpn-sessions="openvpn3 sessions-list"
alias syncdocs="onedrive --synchronize --single-directory Documentos"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

eval "$(starship init zsh)"


