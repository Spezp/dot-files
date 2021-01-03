# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.cargo/bin:$PATH"

# Load ubuntu stuff if present
#
#if [ -f "$HOME/dot-files/.ubuntu-openbox-zshrc" ] ; then
#    source ~/dot-files/.ubuntu-openbox-zshrc
#fi

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
if [ ! -f "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" ] ; then
  echo $ZSH
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/custom/themes/spaceship-prompt" --depth=1
  ln -s "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/custom/themes/spaceship.zsh-theme" 
fi

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

SPACESHIP_CHAR_PREFIX=""
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true  
SPACESHIP_USER_PREFIX=""
SPACESHIP_DIR_PREFIX=""
SPACESHIP_GIT_BRANCH_COLOR=206
SPACESHIP_USER_SHOW="always"
SPACESHIP_HOST_SHOW="always"
SPACESHIP_CHAR_SYMBOL="👾->"
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_RPROMPT_ORDER=(
  user
  host
)
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  xcode         # Xcode section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

ZSH_THEME="spaceship"

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
[ -f "$HOME/dot-files/.fzf.zsh" ] && source ~/dot-files/.fzf.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=/home/spezp/.pyenv/versions/3.7.2/bin:$PATH

