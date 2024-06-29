#!/bin/bash

TEMPLATE_GITCONFIG=".gitconfig.template"
LOCAL_GITCONFIG=".gitconfig.local"
TARGET_GITCONFIG=".gitconfig"

check_directory() {
    if [ ! -f "${TEMPLATE_GITCONFIG}" ]
    then
        echo "${TEMPLATE_GITCONFIG} not found! Are you running this script inside its directory?"
        exit -1
    fi
}

check_environment_variables() {
    if [[ -z "${GIT_NAME}" || -z "${GIT_EMAIL}" || -z "${GIT_GPG_KEY}" ]]
    then
        echo 'Please set the GIT_NAME, GIT_EMAIL and GIT_GPG_KEY environment variables with the name, e-mail and GPG key to be used in your git commit messages.'
        exit -1
    fi
}

create_gitconfig_from_template() {
    sed -e "s/__GIT_NAME__/${GIT_NAME}/g" -e "s/__GIT_EMAIL__/${GIT_EMAIL}/g" -e "s/__GIT_GPG_KEY__/${GIT_GPG_KEY}/g" ${TEMPLATE_GITCONFIG} > ${LOCAL_GITCONFIG}
}

install_gitconfig() {
    TARGET_DIR=~
    TARGET_FILE="${TARGET_DIR}/${TARGET_GITCONFIG}"

    if [ -f "${TARGET_FILE}" ]
    then
        read -p "File ${TARGET_FILE} already exists. Overwrite? [y/n] " -n 1 -r
        echo

        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            echo "Aborted."
            exit -1
        fi
        rm -f "${TARGET_FILE}"
    fi

    SOURCE_DIR=$(pwd)
    SOURCE_FILE="${SOURCE_DIR}/${LOCAL_GITCONFIG}"

    cp "${SOURCE_FILE}" "${TARGET_FILE}"
    chmod 600 "${TARGET_FILE}"
    echo "Installed settings ${TARGET_FILE} from ${SOURCE_DIR}"
}

check_directory
check_environment_variables
create_gitconfig_from_template
install_gitconfig
