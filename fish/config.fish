# config.fish

# Default programs:
set -gx EDITOR "vim"
set -gx TERMINAL "urxvt256c-ml"
set -gx READER "okular"
set -gx FILE "nnn"
set -gx BROWSER "firefox"

# ~ Cleanup
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_CACHE_HOME ~/.cache
set -gx XDG_DATA_HOME ~/.local/share
set -gx GEM_HOME "$XDG_DATA_HOME"/gem
set -gx GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -gx BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME"/bundle
set -gx BUNDLE_USER_CACHE "$XDG_CACHE_HOME"/bundle 
set -gx BUNDLE_USER_PLUGIN "$XDG_DATA_HOME"/bundle
set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -gx MATHEMATICA_USERBASE "$XDG_CONFIG_HOME"/mathematica
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -gx PYLINTHOME "$XDG_CACHE_HOME"/pylint
set -gx LESSKEY "$XDG_CONFIG_HOME"/less/lesskey
set -gx LESSHISTFILE "$XDG_CACHE_HOME"/less/history

# nnn
set -gx NNN_PLUG "':-_|urxvt256c-ml;i:_sxiv -t .*"
set -gx NNN_BMS 'n:~/Documents/Notes;d:~/Documents/Projects/dotfiles;p:~/Documents/Projects/personal-site;c:~/Documents/Undergrad/CLASS;s:~/Documents/Undergrad/Courses/4 - Senior'

# powerline
set -g theme_color_scheme gruvbox

# User specific aliases and functions
alias please="sudo"
alias install="sudo dnf install"
alias update="sudo dnf update && flatpak update"
alias q="exit"

alias dd="sudo dd status='progress'"
alias wget="wget --hsts-file="$XDG_CACHE_HOME/wget-hsts""

alias sitecp="sudo cp -r ~/Documents/Projects/personal-site/_site/* /var/www/html/"
function pubcp
    cp  --no-preserve=mode $argv /home/Disks/TOWER/
end

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
