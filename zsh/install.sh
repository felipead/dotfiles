#!/bin/bash

install_oh_my_zsh() {
    echo "Installing Oh My Zsh..."
    INSTALL_SCRIPT="install-oh-my-zsh.sh"
    curl -fsSL "https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh" -o ${INSTALL_SCRIPT}
    SHELL="zsh" sh ${INSTALL_SCRIPT}
    rm -f ${INSTALL_SCRIPT}
}

install_powerlevel10k() {
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

install_settings() {
    SOURCE_DIR=$(pwd)
    TARGET_DIR=~

    for ASSET in ".zshrc" ".p10k.zsh"
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
install_powerlevel10k
install_settings
make_zsh_default_shell
