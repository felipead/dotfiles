#!/bin/bash

install_settings() {
    SUBLIME_HOME="${HOME}/Library/Application Support/Sublime Text 3"
    SOURCE_DIR=$(pwd)
    TARGET_DIR="${SUBLIME_HOME}/Packages/User"

    for ASSET in Preferences Python Ruby JavaScript
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

install_settings