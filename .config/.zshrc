# Path to your oh-my-zsh installation.
export ZSH="/home/kingsley/.oh-my-zsh"

# Set theme
# ZSH_THEME="typewritten"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
HISTFILE=~/.config/.zsh_history

# Plugins
plugins=(git docker-compose zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

# Source config files
source $ZSH/oh-my-zsh.sh
source ~/.env.sh
source ~/.config/.zshenv

export PATH=$PATH:/usr/local/go/bin
export PKG_CONFIG_PATH=/usr/local/share/pkgconfig

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

# fuzzy finder
export FZF_DEFAULT_COMMAND="fd --type f --exclude={.git,node_modules,vendor}" 

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

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

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

# starship prompt
eval "$(starship init zsh)"
export PATH=$PATH:/home/kingsley/.spicetify
