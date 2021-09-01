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

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git node npm aws)

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
  haskell       # Haskell Stack section
  docker        # Docker section
  aws           # Amazon Web Services section
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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

alias cdh="cd ~/gradient/hangar-bay"
alias cdhh="cd ~/gradient/hangar-bay/packages/hammer-head"
alias cdh2="cd ~/gradient/hangar-bay-2"
alias cdh2h="cd ~/gradient/hangar-bay-2/packages/hammer-head"
alias lsl="ls -1a"
alias yubi=". ${HOME}/scripts/yubi.bash"
alias encryptfs-verify=". ${HOME}/encryptfs-verify"
alias devkit="kitty -o allow_remote_control=yes --listen-on unix:/tmp/mykitty --detach --session ~/dot-files/kitty/development.session.conf"
[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"
[ -f "$HOME/dot-files/.fzf.zsh" ] && source ~/dot-files/.fzf.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=/home/spezp/.pyenv/versions/3.7.2/bin:$PATH

export HUSKY_SKIP_HOOKS=1
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
