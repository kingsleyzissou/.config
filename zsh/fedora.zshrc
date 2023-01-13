# change path
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Path to your oh-my-zsh installation.
export ZSH="/home/kingsley/.oh-my-zsh"

# Set theme
ZSH_THEME="typewritten"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Plugins
plugins=(git docker-compose zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

# Source config files
source $ZSH/oh-my-zsh.sh
source ~/.env.sh
# TODO add caps modifier
# source ~/.xinitrc

export PATH=$PATH:/usr/local/go/bin
export PKG_CONFIG_PATH=/usr/local/share/pkgconfig

# gopath
export PATH=$PATH:/home/$USER/go/bin
export PATH=$PATH:/home/$USER/.local/bin

# language servers
export PATH=$PATH:/home/$USER/.local/share/nvim/lsp_servers/jedi_language_server/venv/bin
export PATH=$PATH:/home/$USER/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin
export PATH=$PATH:/home/$USER/.local/share/nvim/lsp_servers/yamlls/node_modules/yaml-language-server/bin
# export PATH=$PATH:/home/$USER/.local/share/nvim/lsp_servers/yamlls/node_modules/yaml-language-server/bin
# alias luamake=/home/kingsley/Dev/other/lua-language-server/3rd/luamake/luamake

# fuzzy finder
export FZF_DEFAULT_COMMAND="fd --type f --exclude={.git,node_modules,vendor}" 

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
alias g='git'
alias dnfu="sudo dnf update -y"
alias dnfi="sudo dnf install"
alias vi=nvim # launch vi as nvim
alias vim=nvim # launch vim as nvim

# Helper functions
# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }
