
#========== ZSH ==================================

export ZSH=~/.oh-my-zsh

ZSH_THEME="sorin"

ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="false"
UPDATE_ZSH_DAYS=30

HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

#========== Shell ================================

export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export EDITOR='subl'
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

#========== Ruby =================================

export RBENV_ROOT="/usr/local/var/rbenv"
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

export PATH="/usr/local/var/rbenv/shims:$PATH"

alias be='bundle exec'

#========== Java =================================

export JENV_ROOT="/usr/local/var/jenv"
if which jenv > /dev/null; then
    eval "$(jenv init -)"
fi

#========== Heroku ===============================

export PATH="/usr/local/heroku/bin:$PATH"

#========== Other Aliases =======================

alias g='git'
alias treel='tree -L'
