# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="geoffgarside-no-name"

plugins=(git ruby rails gem cap command-not-found github)

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="false"
#
source /etc/profile
source $ZSH/oh-my-zsh.sh

#alias svn-add-all-new-files='svn st|grep ^?|sed s/?//|xargs svn add $1'

alias sc='script/console'
#alias rdm='rake db:migrate'
#alias tl='tail -f log/development.log'
#alias lk='sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'

alias ack='ack-grep --type-set=haml=.haml --type-set=sass=.sass --type-set=scss=.scss'
alias cuke='bundle exec cucumber -f pretty -p'

alias b='bundle'
alias be='bundle exec'

calc(){ awk "BEGIN{ print $* }" ;}


# Customize to your needs...
export PATH=/home/leonid/bin:/opt/ruby-enterprise/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export EDITOR=/usr/bin/vim
# export TERM=xterm-256color
#
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

unsetopt auto_name_dirs
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

function git(){hub "$@"}

eval "ssh-agent" >/dev/null
