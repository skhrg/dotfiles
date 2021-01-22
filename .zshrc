# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]
then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

# Oh My Zsh stuff
export ZSH="/home/lordskh/.oh-my-zsh"

plugins=(
    fzf
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Turn off terminal bell
unsetopt BEEP

# Default programs:
export EDITOR="vim"
export TERMINAL="urxvt256c-ml"
export READER="zathura"
export FILE="nnn"
export BROWSER="firefox"
export SYSTEMD_PAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# ~ Cleanup
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle 
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export MATHEMATICA_USERBASE="$XDG_CONFIG_HOME"/mathematica
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GOPATH="$XDG_DATA_HOME"/go
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android

# nnn
export NNN_PLUG='.:-_|urxvt256c-ml;i:_sxiv -t .*;z:_|zathura $nnn*'
export NNN_BMS='n:~/Documents/Notes;d:~/Documents/Projects/dotfiles;p:~/Documents/Projects/personal-site;c:~/Documents/Undergrad/CLASS;s:~/Documents/Undergrad/Courses/4_-_Senior'

# User specific aliases and functions
alias please="sudo"
alias install="sudo dnf install"
alias update="sudo dnf update && flatpak update"
alias q="exit"

alias dd="sudo dd status='progress'"
alias wget="wget --hsts-file="$XDG_CACHE_HOME/wget-hsts""
alias bnnn="printf '\33]50;%s\007' 'xft:Source Code Pro:size=22' && nnn"
alias mail="printf '\033]0;Mail\007' && neomutt"
alias cat="bat"
alias abook="abook --datafile "$XDG_DATA_HOME"/abook/addressbook"

alias sitecp="sudo cp -r ~/Documents/Projects/personal-site/_site/* /var/www/html/"

alias i3c="vim ~/.config/i3/config"
alias vrc="vim ~/.vimrc"
alias brc="vim ~/.bashrc"

alias omar="ssh -XC omar.pha.jhu.edu"
alias kima="ssh -XC kima.pha.jhu.edu"
alias avon="ssh -XC avon.pha.jhu.edu"

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gac='git add --all && git commit -m'
alias gpl='git pull'
alias gpu='git push'
alias gpp='git pull && git push'
alias gpr='git pull --rebase'
alias gprp='git pull --rebase && git pull'

alias webcam='ffplay -f video4linux2 -i /dev/video0 -video_size 320x240 -fflags nobuffer'

# Fontawesome scripts
if [ -f "$HOME/.fonts/devicons-regular.sh" ];
then
    source "$HOME/.fonts/devicons-regular.sh"
fi

if [ -f "$HOME/.fonts/fontawesome-regular.sh" ];
then
    source "$HOME/.fonts/fontawesome-regular.sh"
fi

if [ -f "$HOME/.fonts/octicons-regular.sh" ];
then
    source "$HOME/.fonts/octicons-regular.sh"
fi

if [ -f "$HOME/.fonts/pomicons-regular.sh" ];
then
    source "$HOME/.fonts/pomicons-regular.sh"
fi

if [ -f "$HOME/.fonts/programming-regular.sh" ];
then
    source "$HOME/.fonts/devicons-regular.sh"
fi

# Don't run things that can break non-interactive shells unless login is interactive
# Also don't run these on tty shells
if [[ $- == *i* ]] && [ ! "$(tty | grep -c tty)" -ge 1 ];
then 
    # Gruvbox color correction
    if [ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ];
    then
        source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
    fi
    if [ -x "$(command -v powerline-daemon)" ];
    then
        powerline-daemon -q
        POWERLINE_BASH_CONTINUATION=1
        POWERLINE_BASH_SELECT=1
        . /usr/share/powerline/zsh/powerline.zsh
    fi
fi
