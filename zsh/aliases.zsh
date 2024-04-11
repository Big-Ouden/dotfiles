### Aliases ###
#alias l='colorls --group-directories-first --almost-all'
#alias ll='colorls --group-directories-first --almost-all --long' # detailed list view
#alias lt='colorls --group-directories-first --almost-all --tree=2' # detailed list view




#terminal
alias c="clear"
alias q="exit"

#history
alias h="history -10"
alias hc="history -c"
alias hg="history | grep"

#alias
alias ag="alias | grep"

#htop
alias t="htop"

#editeur de code
alias nano="nvim"
alias vim="nvim"


#git
alias gco="git checkout"
alias gct="git commit "
alias gst="git status" 
alias gsh="git show"
alias ga="git add"
alias gaa="git add -A"
alias gm="git merge"
alias gms="git merge --squash"
alias glog="git log --graph"
alias gf="git fetch"
alias gdf="git diff"
alias gpl="git pull"
alias gplr="git pull --rebase"
alias gps="git push"
alias gb='git branch'
alias gba='git branch -a'

# Common shell functions
alias l="ls -a"
alias ll="ls -la"
alias less='less -r'
alias tf='tail -f'
alias le='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# vim: ts=4 sw=4
GREP_OPTS='--color=auto --exclude-dir={.git,.hg,.svn}'
alias grep="grep $GREP_OPTS"
alias egrep="egrep $GREP_OPTS"
alias fgrep="fgrep $GREP_OPTS"
unset GREP_OPTS

alias ..='cd ..'
alias ...='cd ../..'


#type hub > /dev/null && alias git='hub'
#alias dmesg='dmesg --color --reltime'
#
#alias alf='autoload -Uz'
#
## Gentoo specific
#alias euses='euses -c'
#
## Use a decent httpie style
#alias http='http --style=solarized'
