if [ -n "$ZSH_VERSION" ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
  chruby 2.2.0
fi

# nvm - https://github.com/creationix/nvm
# sets nvm dir and loads nvm
export NVM_DIR="/Users/greg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# source: https://www.npmjs.com/package/dependency-check
npm () {
  ( [ "$1" != "publish" ] || dependency-check . ) && command npm "$@"
}

# One-liner that copies to the clipboard the previous 24-hours' worth of git-activity (in `pwd`) - Credit: Jacob Lowe (@jcblw)
alias copy-whatididtoday="git-activity --json --me | stream-json-clipboard -k message --humanize -p'- '"

alias cbf="git checkout client/web/build/"
alias dbf=cbf

# Get the numpad enter key to function correctly
# Hat Tip: https://code.google.com/p/iterm2/issues/detail?id=2000
bindkey -s "^[OM" "^M"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Custom crap
alias clear_toolbar="killall -KILL SystemUIServer"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=9

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git brew coffee common-aliases web-search node)

source $ZSH/oh-my-zsh.sh

# for syntax highlighting (installed via brew)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# for zsh-completions (installed via brew)
fpath=(/usr/local/share/zsh-completions $fpath)

# User configuration

export PATH="/Users/greg/.gem/ruby/2.1.2/bin:/Users/greg/.rubies/ruby-2.1.2/lib/ruby/gems/2.1.0/bin:/Users/greg/.rubies/ruby-2.1.2/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/Users/greg:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin/node"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/hone/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Commonly used aliases
alias l="ls -CF"
alias ls="ls -l"
alias ll="ls -alF"
alias lld="ls -d */"
