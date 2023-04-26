# . "$HOME/.cargo/env"

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

# user environment variables
# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# export path
export PATH=$PATH:/usr/local/go/bin
export PKG_CONFIG_PATH=/usr/local/share/pkgconfig

# append local scripts to path
export PATH=$PATH:"$HOME/.scripts"

# pfetch information 
export PF_INFO="ascii title os kernel uptime pkgs memory editor palette"

# gpgkey
export GPG_TTY=$(tty)

# gopath
export PATH=$PATH:/home/$USER/go/bin
export PATH=$PATH:/home/$USER/.local/bin

# pnpm path
export PNPM_HOME="/home/kingsley/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# language servers
export PATH=$PATH:/home/$USER/.local/share/nvim/lsp_servers/jedi_language_server/venv/bin
export PATH=$PATH:/home/$USER/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin
export PATH=$PATH:/home/$USER/.local/share/nvim/lsp_servers/yamlls/node_modules/yaml-language-server/bin

# spitcetify path
export PATH=$PATH:/home/kingsley/.spicetify

# fuzzy finder
export FZF_DEFAULT_COMMAND="fd --type f --exclude={.git,node_modules,vendor}" 

# export starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Helper functions
# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Shortcuts for common directories
function c() { 
  PARENT="${HOME}/Dev/osbuild" 
  while getopts 'c' flag; do
    case "${flag}" in
      c) PARENT="${HOME}/.config" ;;
      *) break ;;
    esac
  done
  DIR="${@:$OPTIND:1}" 
  cd "${PARENT}/${DIR}"; 
}

# bat styles
export BAT_THEME="Catppuccin-mocha"
export MANPAGER="zsh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# keychain
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
