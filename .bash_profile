export RBENV_VERSION=2.1.0

ORIGINAL_PATH=$PATH
PATH=""

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

eval "$(rbenv init -)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

if [ -f ~/.git-completion.sh ]; then
  source ~/.git-completion.sh
fi

# TODO: Find source for this guy
alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"

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


# Gist gem
# make private 'by default'
alias gist='gist -p'

# Commonly used aliases
alias ls='ls -l'
alias ll='ls -alF'
alias lld='ls -d */'
alias l='ls -CF'

# Prompt for confirmation when deleting
alias rm='rm -rfi'

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

# Info on Hub: http://hub.github.com/
alias git=hub

##########################################
#       Project-specific Aliases         #
##########################################

# TODO: Move these into another dotfile and source on .bash_profile load instead
# alias recpass='cd ~/development/recsolu/recpass/'
# alias remember='cd ~/development/recsolu/remember/'
# alias rectest='cd ~/development/recsolu/rectest/'
# alias rectest_api='cd ~/development/recsolu/apidev-recsolu/tests/cucumber/'
# alias apidev_recsolu='cd ~/development/recsolu/apidev-recsolu/'
# alias symptomatica='clear && echo "Project Dir: `pwd`" && echo "" && cd ~/development/panda_strike/symptomatica/ && ls -la && echo "" && git status && echo ""'
alias venyooz='cd ~/development/venyooz/'
alias rails_core='cd ~/development/other/rails/'

# Pry rails console
# TODO: Fix this
alias pryConsole='pry -r ./config/environment'

##########################################
#            Default Programs            #
##########################################

# TODO: Fix this mess below
export EDITOR="/usr/local/bin/subl -w"
export mate="/usr/local/bin/mate -w"
alias slime=subl
alias st=subl


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

# calc - simple calculator
# usage: calc <equation>
function calc() {
  echo "$*" | bc
}

# # Search function (returns the first google result)
search () {
  curl -s --get --data-urlencode "q=$*" http://ajax.googleapis.com/ajax/services/search/web?v=1.0 | \
  sed 's/"unescapedUrl":"\([^"]*\).*/\1/;s/.*GwebSearch",//'
}

# function bashtips {
# TODO: Find source for this...
# cat <<EOF
#   ----------------------------------------
#   DIRECTORIES
#   ----------------------------------------
#   ~-              Previous working directory
#   pushd tmp       Push tmp && cd tmp
#   popd            Pop && cd
#   ----------------------------------------
#   GLOBBING AND OUTPUT SUBSTITUTION
#   ----------------------------------------
#   ls a[b-dx]e     Globs abe, ace, ade, axe
#   ls a{c,bl}e     Globs ace, able
#   \$(ls)          \`ls\` (but nestable!)
#   ----------------------------------------
#   HISTORY MANIPULATION
#   ----------------------------------------
#   !!              Last command
#   !?foo           Last command containing \`foo'
#   ^foo^bar^       Last command containing \`foo',
#   but substitute \`bar'
#   !!:0            Last command word
#   !!:^            Last command's first argument
#   !\$             Last command's last argument
#   !!:*            Last command's arguments
#   !!:x-y          Arguments x to y of last command
#   C-s             search forwards in history
#   C-r             search backwards in history
#   ----------------------------------------
#   LINE EDITING
#   ----------------------------------------
#   M-d             kill to end of word
#   C-w             kill to beginning of word
#   C-k             kill to end of line
#   C-u             kill to beginning of line
#   M-r             revert all modifications
#   to current line
#   C-]             search forwards in line
#   M-C-]           search backwards in line
#   C-t             transpose characters
#   M-t             transpose words
#   M-u             uppercase word
#   M-l             lowercase word
#   M-c             capitalize word
#   ----------------------------------------
#   COMPLETION
#   ----------------------------------------
#   M-/             complete filename
#   M-~             complete user name
#   M-@             complete host name
#   M-\$            complete variable name
#   M-!             complete command name
#   M-^             complete history
# EOF
# }

# # function to make a directory and then cd into it
# function make_dir_and_cd () {
#   mkdir -p "$@" && cd $_
# }

# # function cd.. () {
#   #   for run in {1..$@}; do
#     #     # echo '../'
#     #     echo $run
#     #   done
#     # }

#     # list all of full_paths for the files in the pwd (or those specified)
#     # Ex 1: $ allFilePaths
#     # Ex 2: $ allFilePaths app/controllers
#     # TODO: functionality of Ex 2 needs work and is currently broken
#     function every_path         () {
#       shopt -s nullglob
#       for file in $(\ls "$@"); do
#         echo -n $(pwd)
#         [[ $(pwd) != "/" ]] && echo -n /
#         echo -n $@
#         [[ $(pwd) != "/" ]] && echo -n /
#         echo $file
#       done
#     }


#########################################################
#########################################################

# Custom prompt (with git status when in repo)
export PS1='\[${tBlue}\]\W\[${tReset}${tGreen}\]$(__git_ps1 "[%s]")$\[${tReset}\]⇶ '
export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

# Custom Prompt
PS1='${tBlue}[\W$(__git_ps1 " (%s)")]${tGreen}\$ ${tReset}'

# Custom Terminal Title (PWD)??
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'