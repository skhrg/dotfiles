# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias please="sudo"
alias install="sudo dnf install"
alias update="sudo dnf update && flatpak update"
alias dd="sudo dd status='progress'"

alias i3c="vim ~/.config/i3/config"
alias vc="vim ~/.vimrc"
alias bsc="vim ~/.bashrc"

alias omar="ssh -XC omar.pha.jhu.edu"
alias kima="ssh -XC kima.pha.jhu.edu"
alias avon="ssh -XC avon.pha.jhu.edu"

alias square='/home/lordskh/Documents/Projects/Misc.\ Scripts/square.sh'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gac='git add --all && git commit -m'
alias gpl='git pull'
alias gpu='git push'
alias gpp='git pull && git push'
alias gpr='git pull --rebase'
alias gprp='git pull --rebase && git pull'

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

#read -r -d '' PyURxvtMeta8 <<-'EOF'
#    #!/usr/bin/env python3
#    
#    import locale
#    
#    locale.setlocale(locale.LC_ALL, "")
#    encoding = locale.getlocale()[1]
#    
#    # ASCII range
#    for i in range(32, 128):
#        seq = "".join("\{:o}".format(j) for j in chr(i + (1<<7)).encode(encoding))
#        key = "{:#06X}".format(i)
#        print("urxvt*keysym.Meta-{}: {}".format(key, seq))
#EOF
#
#xrdb -merge <(python3 <<<"$PyURxvtMeta8")