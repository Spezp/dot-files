# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.cargo/bin:$PATH"

# Load ubuntu stuff if present
#
if [ -f "$HOME/dotfiles/.ubuntu-openbox-zshrc" ] ; then
    source ~/dotfiles/.ubuntu-openbox-zshrc
fi

PATH="$HOME/.local/kitty.app/bin:$PATH"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/spezp/.oh-my-zsh"

# ZSH theme
ZSH_THEME="bira"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node npm)

autoload -Uz compinit
compinit

source $ZSH/oh-my-zsh.sh


# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# alias zshconfig="mate ~/.zshrc"
#
[ -f ~/dotfiles/.fzf.zsh ] && source ~/dotfiles/.fzf.zsh
export PATH=/home/spezp/.pyenv/versions/3.7.2/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
