# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#=================================================

export ZSH=~/.oh-my-zsh

ZSH_THEME=powerlevel10k/powerlevel10k

ENABLE_CORRECTION=false
COMPLETION_WAITING_DOTS=false

CASE_SENSITIVE=false
HYPHEN_INSENSITIVE=true

DISABLE_AUTO_UPDATE=false
UPDATE_ZSH_DAYS=1
ZSH_DISABLE_COMPFIX=true

HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

#========== Shell ================================

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export EDITOR=subl
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"

# Use GNU sed over POSIX sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Use GNU grep over POSIX grep
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

#========== GPG ==================================

export GPG_TTY=$(tty)

if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
    echo "pinentry-program $(which pinentry-mac)" > ~/.gnupg/gpg-agent.conf
    killall gpg-agent
fi

#========== Node.js ==============================

export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
. "/usr/local/opt/nvm/nvm.sh"

#========== Python ===============================

alias python='python3'
alias pip='pip3'

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# For building psycopg2. See → https://stackoverflow.com/a/55839410/3297193
# export LDFLAGS="-L/usr/local/opt/openssl/lib"

#========== GoLang ===============================

if [ -d "$HOME/go/bin" ]; then
    export GO111MODULE=on
    export PATH="$HOME/go/bin:$PATH"
fi

#========== Ruby =================================

# if [ -d "/usr/local/opt/ruby/bin" ]; then
#   export PATH=/usr/local/opt/ruby/bin:$PATH
#   export PATH=`gem environment gemdir`/bin:$PATH
# fi

# if [ -d "/usr/local/var/rbenv" ]; then
#     export RBENV_ROOT="/usr/local/var/rbenv"
#     if which rbenv > /dev/null; then
#         eval "$(rbenv init - zsh)"
#     fi

#     export PATH="/usr/local/var/rbenv/shims:$PATH"
# fi

#========== Java =================================

# if [ -d "/usr/local/var/jenv" ]; then
#     export JENV_ROOT="/usr/local/var/jenv"
#     if which jenv > /dev/null; then
#         eval "$(jenv init -)"
#     fi
# fi

#========== Postgres =============================

# if [ -d "/usr/local/opt/postgresql@15" ]; then
#     export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
# fi

#========== Git ==================================

alias g='git'

export GIT_TERMINAL_PROMPT=1

#========== Secrets ==============================

local secrets_file="$HOME/.secrets"
if [ ! -f $secrets_file ]
then
    touch $secrets_file
    chmod 600 $secrets_file
fi

source $secrets_file

#========== Local Configuration ==================

local local_file="$HOME/.settings"
if [ ! -f $local_file ]
then
    touch $local_file
    chmod 600 $local_file
fi

source $local_file

#=================================================

# Powerlevel10k theme, see: https://github.com/romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
