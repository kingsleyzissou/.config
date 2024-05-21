# Source config files
source ~/.env.sh
source ~/.config/zsh/.zshenv
source "$ZINIT_HOME/zinit.zsh"

# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zhs-history-substring-search
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

# Completion styles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide:z:*' fzf-preview 'ls --color $realpath'

# Keybindings
bindkey -e # emacs keybindings
# only cycle through commands with matching prefix
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

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
