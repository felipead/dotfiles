export ZSH=~/.oh-my-zsh

ZSH_THEME=agnoster
DEFAULT_USER=`whoami`

ENABLE_CORRECTION=false
COMPLETION_WAITING_DOTS=false

CASE_SENSITIVE=false
HYPHEN_INSENSITIVE=true

DISABLE_AUTO_UPDATE=false
UPDATE_ZSH_DAYS=1
ZSH_DISABLE_COMPFIX=false

HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

#========== Shell ================================

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch $(uname -m)"
export EDITOR=subl
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin/:/usr/sbin:/sbin"

#========== Homebrew =============================

if [ -f /opt/homebrew/bin/brew ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#========== Git ==================================

alias g='git'

export GIT_TERMINAL_PROMPT=1

#========== GPG ==================================

export GPG_TTY=$(tty)

if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
    mkdir -p ~/.gnupg
    echo "pinentry-program $(which pinentry-mac)" > ~/.gnupg/gpg-agent.conf
    killall gpg-agent
fi

#========== Local Settings =======================

local local_file="$HOME/.local.zsh"
if [ -f $local_file ]
then
    source $local_file
fi

#========== Local Environment ====================

#
# WARNING: you should not store secrets or sensitive information in this
# `.zshrc` file or any plaintext files.
#
# But just in case you absolutely need to, even in a temporary capacity,
# it is better to use a separate env file than this `.zshrc` or any versioned
# files.
#
local env_file="$HOME/.local-env"
if [ ! -f $env_file ]
then
    touch $env_file
fi
chmod 600 $env_file

source $env_file
