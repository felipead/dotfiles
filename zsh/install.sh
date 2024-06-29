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

    for ASSET in ".zshrc" ".local.zsh"
    do
        TARGET_FILE="${TARGET_DIR}/${ASSET}"
        SOURCE_FILE="${SOURCE_DIR}/${ASSET}"

        if [ -f "${SOURCE_FILE}" ]
        then
            if [ -f "${TARGET_FILE}" ]
            then
                read -p "File ${TARGET_FILE} already exists. Overwrite? [y/n] " -n 1 -r
                echo

                if [[ ! $REPLY =~ ^[Yy]$ ]]
                then
                    echo "Skipped ${ASSET}"
                    continue
                fi
                rm -f "${TARGET_FILE}"
            fi

            cp "${SOURCE_FILE}" "${TARGET_FILE}"
            chmod 600 "${TARGET_FILE}"
            echo "Installed settings ${TARGET_FILE} from ${SOURCE_DIR}"
        else
            echo "Did not install ${ASSET} because it was not found."
        fi
    done
}

make_zsh_default_shell() {
    chsh -s $(which zsh)
}

install_oh_my_zsh
install_settings
make_zsh_default_shell
