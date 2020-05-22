# config.fish

# Default programs:
set -gx EDITOR "vim"
set -gx TERMINAL "urxvt256c-ml"
set -gx READER "zathura"
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
set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
set -gx GOPATH "$XDG_DATA_HOME"/go
set -gx IPYTHONDIR "$XDG_CONFIG_HOME"/ipython

# nnn
set -gx NNN_PLUG "':-_|urxvt256c-ml;i:_sxiv -t .*"
set -gx NNN_BMS 'n:~/Documents/Notes;d:~/Documents/Projects/dotfiles;p:~/Documents/Projects/personal-site;c:~/Documents/Undergrad/CLASS;s:~/Documents/Undergrad/Courses/4_-_Senior'

# powerline
set -g theme_color_scheme gruvbox

# User specific aliases and functions
alias please="sudo"
alias install="sudo dnf install"
alias update="sudo dnf update && flatpak update"
alias q="exit"

alias dd="sudo dd status='progress'"
alias wget="wget --hsts-file="$XDG_CACHE_HOME/wget-hsts""
alias bnnn="printf '\33]50;%s\007' 'xft:Source Code Pro:size=22' && nnn"

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

alias webcam='ffplay -f video4linux2 -i /dev/video0 -video_size 320x240 -fflags nobuffer'
