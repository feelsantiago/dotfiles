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

# Extract
# usage: ex <file>
ex()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1  ;;
            *.tar.gx)   tar xzf $1  ;;
            *.bz2)      bunzip2 $1  ;;
            *.rar)      unrar x $1  ;;
            *.gz)       gunzip $1   ;;
            *.tar)      tar xf $1   ;;
            *.tbz2)     tar xjf $1  ;;
            *.tgz)      tar xzf $1  ;;
            *.zip)      unzip $1    ;;
            *.Z)        uncompress $1;;
            *.7z)       7z x $1     ;;
            *.deb)      ar x $1     ;;
            *.tar.xz)   tar xf $1   ;;
            *.tar.zst)  unzstd $1   ;;
            *)          echo "'$1' cannot be extraced via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# root privileges
alias doas="doas --"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias projects="cd ~/Projects/"

# Programs
alias ls="exa -al --color=always --group-directories-first" # best listing
alias la="exa -a --color=always --group-directories-first"  # all files and dirs
alias ll="exa -l --color=always --group-directories-first"  # long format
alias lt="exa -aT --color=always --group-directories-first" # tree listing
alias l.="exa -a | egrep '^\.'"                             # just list dot files

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias cp="cp -i"    # confirm before overwriting something
alias df="df -h"    # human-readable sizes
alias vim="lvim"
alias cat="bat"

# Process memory
alias psmem="ps auxf | sort -nr -k 4"
alias psmem10="ps auxf | sort -nr -k 4 | head -10"

# Process cpu
alias pscpu"ps auxf | sort -nr -k 3"
alias pscpu10="ps auxf | sort -nr -k 3 | head -10"

# Configs
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias zshconfig="vim ~/.zshrc"
alias rofil="~/.config/rofi/scripts/launcher_t1"

# Open VPN
alias vpn-on="openvpn3 session-start --config $HOME/.config/vpn/filipe-ps-profile.ovpn"
alias vpn-off="openvpn3 session-manage --disconnect --config $HOME/.config/vpn/filipe-ps-profile.ovpn"
alias vpn-sessions="openvpn3 sessions-list"

# One Driver Sync
alias syncdocs="onedrive --synchronize --single-directory Documentos"

eval "$(starship init zsh)"


