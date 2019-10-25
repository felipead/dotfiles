
#========== ZSH ==================================

export ZSH=~/.oh-my-zsh

ZSH_THEME=norm

ENABLE_CORRECTION=false
COMPLETION_WAITING_DOTS=false

CASE_SENSITIVE=false
HYPHEN_INSENSITIVE=true

DISABLE_AUTO_UPDATE=false
UPDATE_ZSH_DAYS=30
ZSH_DISABLE_COMPFIX=true

HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

#========== Shell ================================

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export EDITOR=subl
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

#========== Python ================================

# A hack to make the Python "cryptography" package to work
# Works in conjunction with `brew install openssl`
# See: https://github.com/pyca/cryptography/issues/2692
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

#========== Ruby =================================

export RBENV_ROOT="/usr/local/var/rbenv"
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

export PATH="/usr/local/var/rbenv/shims:$PATH"

alias be='bundle exec'

#========== Node.js ==============================

export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
. "/usr/local/opt/nvm/nvm.sh"

#========== Java =================================

export JENV_ROOT="/usr/local/var/jenv"
if which jenv > /dev/null; then
    eval "$(jenv init -)"
fi

#========== Secrets and Sensitive Information ====

local secrets_file="$HOME/.secrets"
if [ ! -f $secrets_file ]
then
    touch $secrets_file
    chmod 600 $secrets_file
fi

source $secrets_file

#========== Other Aliases =======================

alias g='git'
alias pjson='python -m json.tool'

#========== direnv ==============================

eval "$(direnv hook zsh)"
