#!/bin/bash

install_oh_my_zsh() {
    echo "Installing Oh My Zsh..."
    INSTALL_SCRIPT="install-oh-my-zsh.sh"
    wget -nv "https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh" -O ${INSTALL_SCRIPT}
    SHELL="zsh" sh ${INSTALL_SCRIPT}
    rm -f ${INSTALL_SCRIPT}
}

install_settings() {
    SOURCE_DIR=$(pwd)
    TARGET_DIR=~

    for ASSET in ".zshrc"
    do
        TARGET_FILE=${TARGET_DIR}/${ASSET}
        SOURCE_FILE=${SOURCE_DIR}/${ASSET}
        if [ ! -f "${SOURCE_FILE}" ]; then
            echo "${SOURCE_FILE} not found! Are you running this script inside its directory?"
            exit
        else
            rm -f "${TARGET_FILE}"
            ln -s "${SOURCE_FILE}" "${TARGET_FILE}"
            echo "Installed settings ${TARGET_FILE} from ${SOURCE_DIR}"
        fi
    done
}

install_oh_my_zsh
install_settings