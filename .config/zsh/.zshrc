# Dump the cache elsewhere
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Path to your oh-my-zsh installation.
export ZSH="/home/kingsley/.oh-my-zsh"

# Set theme
# ZSH_THEME="typewritten"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
HISTFILE=~/.config/zsh/.zsh_history

# Plugins
plugins=(git docker-compose zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

# Source config files
source ~/.env.sh
source ~/.config/zsh/.zshenv
source ~/.oh-my-zsh/oh-my-zsh.sh

# setup fzf with keybindings
source /usr/share/fzf/key-bindings.zsh

# setup tty colors
if [ "$TERM" = "linux" ]; then
	printf %b '\e[40m' '\e[8]' # set default background to color 0 'moonfly-bg'
	printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'moonfly-fg'
	printf %b '\e]P01e1e28'    # redefine 'black'          as 'moonfly-bg'
	printf %b '\e]P8575268'    # redefine 'bright-black'   as 'moonfly-comment'
	printf %b '\e]P1e38c8f'    # redefine 'red'            as 'moonfly-red'
	printf %b '\e]P9e38c8f'    # redefine 'bright-red'     as '#c49ea0'
	printf %b '\e]P2b1e3ad'    # redefine 'green'          as 'moonfly-green'
	printf %b '\e]PAb1e3ad'    # redefine 'bright-green'   as '#9ec49f'
	printf %b '\e]P3ebddaa'    # redefine 'brown'          as 'moonfly-yellow'
	printf %b '\e]PBebddaa'    # redefine 'bright-brown'   as 'moonfly-orange'
	printf %b '\e]P4a4b9ef'    # redefine 'blue'           as 'moonfly-purple'
	printf %b '\e]PCa4b9ef'    # redefine 'bright-blue'    as '#a5b4cb'
	printf %b '\e]P5e5b4e2'    # redefine 'magenta'        as 'moonfly-pink'
	printf %b '\e]PDe5b4e2'    # redefine 'bright-magenta' as '#c49ec4'
	printf %b '\e]P6bee4ed'    # redefine 'cyan'           as 'moonfly-cyan'
	printf %b '\e]PEbee4ed'    # redefine 'bright-cyan'    as '#9ec3c4'
	printf %b '\e]P7c3bac6'    # redefine 'white'          as 'moonfly-fg'
	printf %b '\e]PFdadae8'    # redefine 'bright-white'   as '#f0f0f0'
	clear
fi


# starship prompt
eval "$(starship init zsh)"

source /home/kingsley/.config/op/plugins.sh
