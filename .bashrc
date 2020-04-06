# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]
then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Default programs:
export EDITOR="vim"
export TERMINAL="urxvt256c-ml"
export READER="okular"
export FILE="nnn"
export BROWSER="firefox"

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

# nnn
export NNN_PLUG="':-_|urxvt256c-ml;i:_sxiv -t .*"
export NNN_BMS='n:~/Documents/Notes;d:~/Documents/Projects/dotfiles;p:~/Documents/Projects/personal-site;c:~/Documents/Undergrad/CLASS;s:~/Documents/Undergrad/Courses/4 - Senior'

# User specific aliases and functions
alias please="sudo"
alias install="sudo dnf install"
alias update="sudo dnf update && flatpak update"
alias q="exit"

alias dd="sudo dd status='progress'"
alias wget="wget --hsts-file="$XDG_CACHE_HOME/wget-hsts""

alias sitecp="sudo cp -r ~/Documents/Projects/personal-site/_site/* /var/www/html/"
alias pubcp='function _pubcp(){ cp  --no-preserve=mode $1 /home/Disks/TOWER/; };_pubcp'

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

alias frecna='ffmpeg -f x11grab -y -r 30 -s 3000x1920 -i :1.0 ~/Videos/rec.mkv'
alias lrecna='ffmpeg -f x11grab -y -r 30 -s 1920x1080 -i :1.0+0,521 ~/Videos/rec.mkv'
alias rrecna='ffmpeg -f x11grab -y -r 30 -s 1080x1920 -i :1.0+1920,0 ~/Videos/rec.mkv'
alias frec='ffmpeg -f x11grab -y -r 30 -s 3000x1920 -i :1.0 -f pulse -ac 2 -i rec.monitor ~/Videos/rec.mkv'
alias lrec='ffmpeg -f x11grab -y -r 30 -s 1920x1080 -i :1.0+0,521 -f pulse -ac 2 -i rec.monitor ~/Videos/rec.mkv'
alias rrec='ffmpeg -f x11grab -y -r 30 -s 1080x1920 -i :1.0+1920,0 -f pulse -ac 2 -i rec.monitor ~/Videos/rec.mkv'
alias webcam='ffplay -f video4linux2 -i /dev/video0 -video_size 320x240 -fflags nobuffer'

# Gruvbox color correction
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

if [ -f `which powerline-daemon` ];
then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bash/powerline.sh
fi

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
