# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="geoffgarside-no-name"
plugins=(git ruby rails gem cap command-not-found github)

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

gem-ack(){ ack $1 `bundle show $2` }
gem-vim(){ cd `bundle show $1` && gvim}

source ~/.bin/ssh-agent-config
