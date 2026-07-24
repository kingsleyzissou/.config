# aliases
alias c='clear'
alias vi=nvim # launch vi as nvim
alias vim=nvim # launch vim as nvim
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # alias for dotfiles
alias ls="ls --color"

# bat is installed with homebrew on mac
[[ $(uname) == "Linux" ]] && alias cat="/usr/bin/bat"
[[ $(uname) == "Darwin" ]] && alias cat="$(brew --prefix)/bin/bat"

# suffix aliases
alias -s md=nvim
alias -s gmi=nvim

# WLR cursors thing
[[ $(uname) == "Linux" ]] && export WLR_NO_HARDWARE_CURSORS=1

# Dump the cache elsewhere
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump-$HOST"

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

# set pi config directory
export PI_CODING_AGENT_DIR="$HOME/.pi/agent"

# pkg-config path
export PKG_CONFIG_PATH=/usr/local/share/pkgconfig

# brew path
[[ $(uname) == "Darwin" ]] && export PATH=$PATH:/opt/homebrew/bin

# export go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin

# export node path
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# export python bin
export PYTHON_PATH="$(python3 -c 'import sysconfig; print(sysconfig.get_path("scripts"))')"
export PATH=$PATH:$PYTHON_PATH

# add ~/bin to the path if it exists
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

# export podman socket
export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
if [[ $(uname) == "Darwin" ]]; then
  export CONTAINER_MACHINE_PROVIDER='applehv'
  export DOCKER_HOST='unix://'
fi

# Always use side-by-side view for git diffs
export DFT_DISPLAY=inline
export DFT_COLOR=always

# fuzzy finder
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude=.git"
export FZF_DEFAULT_OPTS=" \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color always --line-range :500 {}'"

export FZF_ALT_T_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude=.git"
export FZF_ALT_T_OPTS="--preview 'ls --color {} | head -200'"

# export starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# man settings
export MANPAGER="zsh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export MANPATH="$MANPATH:$HOME/.local/share/man"

# add bun to path
export PATH=$PATH:$HOME/.bun/bin
export PATH=$PATH:$HOME/.cache/.bun/bin

# use nvim
export EDITOR="nvim"

# fix locale
# https://superuser.com/a/1672196
export LANG=C.UTF-8
export LC_ALL=C.UTF-8

# https://github.com/warpdotdev/Warp/issues/1271#issuecomment-1463001540
unset LC_CTYPE

# set terminfo
export TERM=xterm-256color

# google sdk stuff for using gemini models
GCLOUD_SDK_PATH="$HOME/.local/lib/google-cloud-sdk"
[[ -f "$GCLOUD_SDK_PATH/path.zsh.inc" ]] && source "$GCLOUD_SDK_PATH/path.zsh.inc"
[[ -f "$GCLOUD_SDK_PATH/completion.zsh.inc" ]] && source "$GCLOUD_SDK_PATH/completion.zsh.inc"

# ip address for ollama host
[[ $(uname) == "Linux" ]] && [[ ! "$CONTAINER_ID" ]] && export OLLAMA_HOST="$(tailscale ip -4 mac-mini)"
[[ $(uname) == "Darwin" ]] && export OLLAMA_HOST="127.0.0.1"

# keychain
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"

# bootstrap plugin manager
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
