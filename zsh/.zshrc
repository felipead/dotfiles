export ZSH=~/.oh-my-zsh

ZSH_THEME="sorin"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="false"
UPDATE_ZSH_DAYS=30

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export EDITOR='subl'

export RBENV_ROOT="/usr/local/var/rbenv"
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/var/rbenv/shims:$PATH"
