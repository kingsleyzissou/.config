# Source config files
source ~/.env.sh
source ~/.config/zsh/.zshenv
source "$ZINIT_HOME/zinit.zsh"

# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::1password
zinit snippet OMZP::docker-compose
zinit snippet OMZP::podman
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

# Completion styles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide:z:*' fzf-preview 'ls --color $realpath'

# Better command cycling
# https://superuser.com/a/585004
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Edit command line
# https://stackoverflow.com/a/903973
autoload edit-command-line
zle -N edit-command-line

# Keybindings
bindkey -e # emacs keybindings
bindkey '^x^e' edit-command-line
bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# History settings
HISTSIZE=5000
HYPHEN_INSENSITIVE="true"
HISTFILE=~/.config/zsh/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval "$(thefuck --alias fk)"

source /home/kingsley/.config/op/plugins.sh
source /home/kingsley/.config/fzf/plugins/fzf-git.sh/fzf-git.sh
