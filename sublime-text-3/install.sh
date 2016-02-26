#!/bin/bash

SUBLIME_HOME="${HOME}/Library/Application Support/Sublime Text 3"

install_settings() {
    SOURCE_DIR=$(pwd)
    TARGET_DIR="${SUBLIME_HOME}/Packages/User"

    for ASSET in "Preferences" "Python" "Ruby" "JavaScript" "Package Control"
    do
        SOURCE_FILE=${SOURCE_DIR}/${ASSET}.sublime-settings
        TARGET_FILE=${TARGET_DIR}/${ASSET}.sublime-settings
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

install_package_control() {
    TARGET_DIR="${SUBLIME_HOME}/Installed Packages"
    PACKAGE="Package Control.sublime-package"
    
    curl -fsSL "https://packagecontrol.io/Package%20Control.sublime-package" -o "${PACKAGE}"
    mv "${PACKAGE}" "${TARGET_DIR}"
}

install_settings
install_package_control
