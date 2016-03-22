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

# Custom aliases

alias g='git'
alias g='git'
