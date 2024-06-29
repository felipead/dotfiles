#!/bin/bash

install_oh_my_zsh() {
    echo "Installing Oh My Zsh..."
    INSTALL_SCRIPT="install-oh-my-zsh.sh"
    curl -fsSL "https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh" -o ${INSTALL_SCRIPT}
    SHELL=zsh RUNZSH=no ZSH=  sh ${INSTALL_SCRIPT}
    rm -f ${INSTALL_SCRIPT}
}

install_settings() {
    SOURCE_DIR=$(pwd)
    TARGET_DIR=~

    for ASSET in ".zshrc"
    do
        TARGET_FILE="${TARGET_DIR}/${ASSET}"
        SOURCE_FILE="${SOURCE_DIR}/${ASSET}"
        if [ ! -f "${SOURCE_FILE}" ]; then
            echo "${SOURCE_FILE} not found! Are you running this script inside its directory?"
            exit
        else
            ln -sf "${SOURCE_FILE}" "${TARGET_FILE}"
            echo "Installed settings ${TARGET_FILE} from ${SOURCE_DIR}"
        fi
    done
}

make_zsh_default_shell() {
    chsh -s $(which zsh)
}

install_oh_my_zsh
install_settings
make_zsh_default_shell
