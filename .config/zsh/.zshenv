# aliases
alias c='clear'
alias vi=nvim # launch vi as nvim
alias vim=nvim # launch vim as nvim
alias s="kitty +kitten ssh" # launch ssh in kitty
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # alias for dotfiles
alias nnn='nnn -a -c -e -P p'
alias ls="ls --color"

# bat is installed with homebrew on mac
[[ $(uname) == "Linux" ]] && alias cat="/usr/bin/bat"
[[ $(uname) == "Darwin" ]] && alias cat="$(brew --prefix)/bin/bat"

# yay
alias ys="yay -S"
alias yr="yay -R"
alias yq="yay -Q"

# suffix aliases
alias -s md=nvim
alias -s gmi=nvim
alias -s png=imv
alias -s jpg=imv

# WLR cursors thing
[[ $(uname) == "Linux" ]] && export WLR_NO_HARDWARE_CURSORS=1

# Dump the cache elsewhere
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# user environment variables
# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# set gtk theme early
export GTK_THEME=Catppuccin-Macchiato-Standard-Teal-Dark

# set tty for gpg
export GPG_TTY=$(tty)
export PIN_ENTRY_DATA="curses"

# pkg-config path
export PKG_CONFIG_PATH=/usr/local/share/pkgconfig

# brew path
[[ $(uname) == "Darwin" ]] && export PATH=$PATH:/opt/homebrew/bin

# export go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin

# prepend local scripts to path
# so that we can use scripts that
# override /usr/bin
export PATH="$HOME/.scripts:$PATH"

# export podman socket
export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
if [[ $(uname) == "Darwin" ]]; then
  export CONTAINER_MACHINE_PROVIDER='applehv'
  export DOCKER_HOST='unix://'
fi

# pfetch information
export PF_INFO="ascii title os kernel uptime pkgs memory editor palette"

# gpgkey
export GPG_TTY=$(tty)

# language servers
export PATH=$PATH:$HOME/.local/share/nvim/lsp_servers/jedi_language_server/venv/bin
export PATH=$PATH:$HOME/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin
export PATH=$PATH:$HOME/.local/share/nvim/lsp_servers/yamlls/node_modules/yaml-language-server/bin

# fuzzy finder
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude=.git"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color always --line-range :500 {}'"

export FZF_ALT_T_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude=.git"
export FZF_ALT_T_OPTS="--preview 'ls --color {} | head -200'"

# export starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# man settings
export MANPAGER="zsh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# use nvim
export EDITOR="nvim"

# fix locale
# https://superuser.com/a/1672196
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# https://github.com/warpdotdev/Warp/issues/1271#issuecomment-1463001540
unset LC_CTYPE

# keychain
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"

# bootstrap plugin manager
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
