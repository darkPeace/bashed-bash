if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# default conda installation path
if [ -f ~/anaconda3/etc/profile.d/conda.sh ]; then
  . ~/anaconda3/etc/profile.d/conda.sh
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTIGNORE="&:ls:[bf]g:exit"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# multi-line commands are stored in the history as a single command
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

if [ "`id -u`" -eq 0 ]; then
	PS1="\[\e[0;30m\]--\[\033[m\]|\[\033[2;37m\]\t\[\033[m\]| \[\e[1;31m\]\u\[\033[1;35m\] at \[\e[1;33m\]\h\[\033[m\]:\[\e[0m\]\[\e[2;31m\][\w]\[\e[0;39m\]\n\[\e[0;30m\]==>\[\e[0;30m\] \$ \[\e[0;39m\]"
else
	PS1="\[\e[0;33m\]--\[\033[m\]|\[\033[2;34m\]\t\[\033[m\]| \[\e[1;32m\]\u\[\033[0;35m\] at \[\e[1;33m\]\h\[\033[m\]:\[\e[0m\]\[\e[2;34m\][\w]\[\e[0;39m\]\n\[\e[0;33m\]==>\[\e[0;36m\] \$ \[\e[0;39m\]"
fi

# BROWSER=/usr/bin/xdg-open
BROWSER=firefox/firefox
EDITOR=code

# import alias
if [ -f ~/.bash_alias ]; then . ~/.bash_alias; fi

# source files
if [[ -s /usr/share/git/completion/git-completion.bash ]]; then
  . /usr/share/git/completion/git-completion.bash
fi

if [[ -s /etc/profile.d/autojump.bash ]]; then
  . /etc/profile.d/autojump.bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VISUAL="nano"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64

# prompt
# coler test
# PS1='
#   \[\e[0;30m\]0
#   \[\e[0;31m\]1
#   \[\e[0;32m\]2
#   \[\e[0;33m\]3
#   \[\e[0;34m\]4
#   \[\e[0;35m\]5
#   \[\e[0;36m\]6
#   \[\e[0;37m\]7
#   \[\e[0;38m\]8
#   \[\e[0;39m\]9
#   \[\e[0;40m\]10
#   \[\e[0;41m\]11
#   \[\e[0;42m\]12
#   \[\e[0;43m\]13
#   \[\e[0;44m\]14
#   \[\e[0;45m\]15
#   \[\e[0;46m\]16
#   \[\e[0;47m\]17
#   \[\e[0;48m\]18
#   \[\e[1;30m\]0
#   \[\e[1;31m\]1
#   \[\e[1;32m\]2
#   \[\e[1;33m\]3
#   \[\e[1;34m\]4
#   \[\e[1;35m\]5
#   \[\e[1;36m\]6
#   \[\e[1;37m\]7
#   \[\e[1;38m\]8
#   \[\e[1;39m\]9
#   \[\e[1;40m\]10
#   \[\e[1;41m\]11
#   \[\e[1;42m\]12
#   \[\e[1;43m\]13
#   \[\e[1;44m\]14
#   \[\e[1;45m\]15
#   \[\e[1;46m\]16
#   \[\e[1;47m\]17
#   \[\e[1;48m\]18
#   \[\e[2;30m\]0
#   \[\e[2;31m\]1
#   \[\e[2;32m\]2
#   \[\e[2;33m\]3
#   \[\e[2;34m\]4
#   \[\e[2;35m\]5
#   \[\e[2;36m\]6
#   \[\e[2;37m\]7
#   \[\e[2;38m\]8
#   \[\e[2;39m\]9
#   \[\e[2;40m\]10
#   \[\e[2;41m\]11
#   \[\e[2;42m\]12
#   \[\e[2;43m\]13
#   \[\e[2;44m\]14
#   \[\e[2;45m\]15
#   \[\e[2;46m\]16
#   \[\e[2;47m\]17
#   \[\e[2;48m\]18
# '
# !color test