# Path to your oh-my-zsh installation.
export ZSH=/home/anes/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="wezm+"
# ZSH_THEME="miloshadzic"
ZSH_THEME="sorin"
# ZSH_THEME="wedisagree"
# ZSH_THEME="ys"
# ZSH_THEME="af-magic"
# ZSH_THEME="clean"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker history jsontools node osx sudo knife)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# go 
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# misc
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM="xterm-color"
export EDITOR="vim"

# aliases
alias lol='ssh root@loltrip.com'
alias gogit='cd ~/git;clear;ls -lah;pwd'
alias gogo='cd ~/go/src/github.com/aneshas;clear;ls -lah;pwd'
alias a='ssh anes@goblin-ci.com'
alias h='htop'
alias cdev="ssh anes@77.243.225.251"
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

# You can use whatever you want as an alias, like for Mondays:
alias FUCK='fuck'
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# tmux
alias tmux="TERM=xterm-256color tmux"

# vim
alias vi="TERM=screen-256color vi"

#google app engine sdk
# export PATH=$PATH:/home/anes/go_appengine
alias avim="export GOPATH=$GOPATH:$HOME/go_appengine/goroot"
alias appvi="GOPATH=$GOPATH:$HOME/go_appengine/goroot vi"

# rust
export PATH=$PATH:~/.cargo/bin

# history log
# export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'
# precmd() { eval "$PROMPT_COMMAND" }

# gitsome
autoload bashcompinit
bashcompinit
source /home/anes/gh_complete.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f /home/anes/google-cloud-sdk/path.zsh.inc ]; then
  source '/home/anes/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /home/anes/google-cloud-sdk/completion.zsh.inc ]; then
  source '/home/anes/google-cloud-sdk/completion.zsh.inc'
fi

# gcloud remove these two lines
export PATH=$PATH:/home/anes/google-cloud-sdk/bin:/home/anes/google-cloud-sdk/platform/google_appengine

# zmq
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# protoc
export PATH=$PATH:/home/anes/protoc-3.1.0/bin

# cabal
export PATH=$PATH:/home/anes/.cabal/bin

# stack
export PATH=$PATH:/home/anes/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

