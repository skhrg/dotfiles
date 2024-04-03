# .zshrc

# Oh My Zsh stuff
export ZSH="$HOME"/.oh-my-zsh

plugins=(
    fzf
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Turn off terminal bell
unsetopt BEEP

# User exports 
if [ -f "$HOME"/.exports ];
then
    source "$HOME/.exports"
fi

# User specific aliases and functions
if [ -f "$HOME"/.aliases ];
then
    source "$HOME/.aliases"
fi

# Fontawesome scripts
if [ -f "$HOME"/.fontscripts ];
then
    source "$HOME/.fontscripts"
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
    if [ -x "$(command -v starship)" ];
    then
        eval "$(starship init zsh)"
    fi
fi

# zoxide setup
if [ -x "$(command -v zoxide)" ];
then
    eval "$(zoxide init zsh)"
    alias cd=z
fi

# opam configuration
test -r /home/lordskh/.opam/opam-init/init.zsh && . /home/lordskh/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
