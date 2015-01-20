ORIGINAL_PATH=$PATH
PATH=""

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi


if [ -n "$BASH_VERSION" ]; then
  if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    source $(brew --prefix)/share/bash-completion/bash_completion
  fi

  if [ -f $(brew --prefix)/etc/autojump.sh; then
    source $(brew --prefix)/etc/autojump.sh
  fi

  # if [ -f ~/.git-completion.sh ]; then
  #   source ~/.git-completion.sh
  # fi
fi

# source chruby scripts if running either bash or zsh shell
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
  chruby 2.2.0
fi

alias trim_whitespace="sh ~/development/dotfiles/trim_whitespace"

#### Smooth the way for DTerm and possibly other terminals that barf on tput colors:
# TODO: Find source; might not need
INTERACTIVETERM=-YES-
if [ "$TERM" == "" ]; then INTERACTIVETERM="-NO-"; TERM="vt100"; fi
  if [ "$TERM" == "dumb" ]; then INTERACTIVETERM="-NO-"; TERM="vt100"; fi
    export INTERACTIVETERM
# Set up TPUT color codes
if [ "$INTERACTIVETERM" == "-YES-" ]; then
  tReset="$(tput sgr0)"
  NORMAL=$(tput sgr0)
  tBold="$(tput bold)"
  BOLD=$(tput bold)
  BRIGHT=$(tput bold)
  tBlack="$(tput setaf 0)"
  BLACK=$(tput setaf 0)
  tRed="$(tput setaf 1)"
  RED=$(tput setaf 1)
  tGreen="$(tput setaf 2)"
  GREEN=$(tput setaf 2)
  tYellow="$(tput setaf 3)"
  YELLOW=$(tput setaf 3)
  pYELLOW="$(tput setaf 190)"
  LIME_YELLOW=$(tput setaf 190)
  tBlue="$(tput setaf 4)"
  BLUE=$(tput setaf 4)
  POWDER_BLUE=$(tput setaf 153)
  tPink="$(tput setaf 5)"
  MAGENTA=$(tput setaf 5)
  tCyan="$(tput setaf 6)"
  CYAN=$(tput setaf 6)
  tGray="$(tput setaf 7)"
  WHITE=$(tput setaf 7)
  tWhite="$(tput setaf 8)"
  TUNON="$(tput smul)"
  TUNOFF="$(tput rmul)"
  BLINK=$(tput blink)
  REVERSE=$(tput smso)
  UNDERLINE=$(tput smul)
    # tRandColor=$(tput setaf $(random /0..8/))
    # tRandColor="$(tput setaf $(( $(hostname | openssl sha1 | sed 's/.*\([0-9]\).*/\1/') % 6 + 1 )) )"
  else
    tReset=
    tBold=
    tBlack=
    tRed=
    tGreen=
    tYellow=
    tBlue=
    tPink=
    tCyan=
    tGray=
    tWhite=
    tUndOn=
    tUndOff=
    tRandColor=
    BLACK=
    RED=
    GREEN=
    YELLOW=
    BLUE=
    MAGENTA=
    CYAN=
    WHITE=
    LIME_YELLOW=
    POWDER_BLUE=
    BRIGHT=
    NORMAL=
    BLINK=
    REVERSE=
    UNDERLINE=
    BOLD=
  fi

# Add color to terminal output
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# Show dirty state when GIT status is fucked up
GIT_PS1_SHOWDIRTYSTATE=1 #... untagged(*) and staged(+) changes
GIT_PS1_SHOWSTASHSTATE=1 #... if something is stashed($)
GIT_PS1_SHOWUNTRACKEDFILES=1 #... untracked files(%)
GIT_PS1_SHOWUPSTREAM="auto"  #... 'verbose' .. others avaliable


# Gist gem: make private by default
alias gist='gist -p'

# Colorized output of: list of git branches, ordered by most recent commit
# via @estani (from: http://stackoverflow.com/a/18310499)
alias glist='for ref in $(git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads/ refs/remotes ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset%n" | cat ; done | awk '"'! a["'$0'"]++'"

# Commonly used aliases
alias l='ls -CF'
alias ls='ls -l'
alias ll='ls -alF'
alias lld='ls -d */'

# Prompt for confirmation when deleting
alias rm='rm -i'

# Show command history, sorted by most-used command(s)
# Not sure where I found this one
alias history_ranking="sed '/^#/d' ~/.bash_history | awk '{print \$1}' | sort | uniq -c | sort -nr | head -20 | cat -n"

##########################################
#              Bundle Aliases            #
##########################################

alias  b='bundle'
alias be='b exec'
# Run bundle using Gemfile.local
alias belocal='be --gemfile Gemfile.local'


##########################################
#       Project-specific Aliases         #
##########################################

# Pry rails console
alias pryConsole='pry -r ./config/environment'

##########################################
#            Default Programs            #
##########################################

# TODO: Fix this mess below
# export EDITOR="/usr/local/bin/atom -w"
export EDITOR="/usr/local/bin/subl -w"
export mate="/usr/local/bin/mate"
alias slime=subl


# Source ~/.bash_profile in shell
alias reloadProfile='export PATH=$ORIGINAL_PATH && source ~/.bash_profile && echo "SUCCESS: ~/.bash_profile reloaded!"'

# Flush Mac OSX DNS cache
alias flush_dns_cache='dscacheutil -flushcache'

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT='%F %T '
HISTIGNORE="&:[ ]*:exit"

# So that bash doesn't overwrite history on exit
# append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands to the history as one command
shopt -s cmdhist

# Enable the new features of Bash 4.0
# Bash 4.0
if [ $BASH_VERSINFO -ge 4 ]; then
    # Completion, ** expands recursively
    shopt -s globstar
    # If set, a command name that is the name of a directory is executed as if it were the argument to the cd command. This option is only used by interactive shells.
    shopt -s autocd
    # If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
    shopt -s dirspell
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make directory commands see only directories
complete -d pushd

# Resets <CTRL>-S from being scroll stop so that bash can forward search
# Required in OS X
# TODO: Find source
stty stop ""

# Some kind of magical autocomplete thing I read somewhere
# TODO: research this shit. possibly delete. yeah. good times.
complete -o default -o nospace -F _git g

# Move this to git config instead.  Duh.
# Via: https://coderwall.com/p/euwpig
alias pretty-log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# # Search function (returns the first google result)
search () {
  curl -s --get --data-urlencode "q=$*" http://ajax.googleapis.com/ajax/services/search/web?v=1.0 | \
  sed 's/"unescapedUrl":"\([^"]*\).*/\1/;s/.*GwebSearch",//'
}

# # function to make a directory and then cd into it
# function make_dir_and_cd () {
#   mkdir -p "$@" && cd $_
# }

# Custom prompt (with git status when in repo)
export PS1='\[${tBlue}\]\W\[${tReset}${tGreen}\]$(__git_ps1 "[%s]")$\[${tReset}\]⇶ '
export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

# Custom Prompt
PS1='${tBlue}[\W$(__git_ps1 " (%s)")]${tGreen}\$ ${tReset}'

# Custom Terminal Title (PWD)??
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
