# . "$HOME/.cargo/env"

# user environment variables
# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# pfetch information 
export PF_INFO="ascii title os kernel uptime pkgs memory editor palette"

# aliases
alias g='git'
alias dnfu="sudo dnf update -y"
alias dnfi="sudo dnf install"
alias vi=nvim # launch vi as nvim
alias vim=nvim # launch vim as nvim
alias s="kitty +kitten ssh" # launch ssh in kitty
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # alias for dotfiles
alias nnn='nnn -a -c -e -P p'

# suffix aliases
alias -s md=nvim
alias -s gmi=nvim
alias -s png=imv
alias -s jpg=imv
alias -s pdf=zathura

# bat styles
export BAT_THEME="Enki-Tokyo-Night"
export MANPAGER="zsh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# nnn
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_EDITOR='nvim'
export NNN_PAGER=${NNN_PAGER:-less -P?n -R}
export NNN_TRASH='1' # use trash-cli
export NNN_COLORS='4652' # colors for contexts
export NNN_FCOLORS='0203040a000d0608090b0501' # file specific colors
export NNN_BMS='p:/home/kingsley/Dev/osbuild;s:/home/kingsley/Pictures/screenshots;m:/run/media/kingsley/'
export NNN_PLUG='p:preview-tui;o:launch'
export NNN_TERMINAL='kitty'
export VISUAL='nvim'
export NNN_OPTS='ceEPp'
export PAGER='less -RF'

# keychain
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
