# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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
    if [ -x "$(command -v powerline-daemon)" ];
    then
        if [ -d "/usr/share/powerline" ];
        then
            export POWERLINEDIR="/usr/share/powerline"
        elif [ -d "`python -m site --user-site`/powerline/bindings" ];
        then
            export POWERLINEDIR="`python -m site --user-site`/powerline/bindings"
        fi
        powerline-daemon -q
        POWERLINE_BASH_CONTINUATION=1
        POWERLINE_BASH_SELECT=1
        . $POWERLINEDIR/bash/powerline.sh
    fi
fi

# zoxide setup
if [ -x "$(command -v zoxide)" ];
then
    eval "$(zoxide init bash)"
    alias cd=z
fi

# fzf
if [ -f ~/.fzf.bash ];
then
    source ~/.fzf.bash
fi
