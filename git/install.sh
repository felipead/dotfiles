#!/bin/bash

GITCONFIG_TEMPLATE_FILE="gitconfig.template"
LOCAL_GITCONFIG_FILE="gitconfig.local"
INSTALLED_GITCONFIG_FILE=".gitconfig"

check_directory() {
    if [ ! -f "${GITCONFIG_TEMPLATE_FILE}" ]
    then
        echo "${GITCONFIG_TEMPLATE_FILE} not found! Are you running this script inside its directory?"
        exit -1
    fi
}

check_environment_variables() {
    if [ -z "${GIT_NAME}" ] || [ -z "${GIT_EMAIL}" ]
    then
        echo 'Please set the GIT_NAME and GIT_EMAIL environment variables with the name and e-mail to be used in your git commit messages.'
        exit -1
    fi
}

create_gitconfig_from_template() {
    sed -e "s/__GIT_NAME__/${GIT_NAME}/g" -e "s/__GIT_EMAIL__/${GIT_EMAIL}/g" ${GITCONFIG_TEMPLATE_FILE} > ${LOCAL_GITCONFIG_FILE}
}

install_gitconfig() {
    SOURCE_DIR=$(pwd)
    TARGET_DIR=~
    SOURCE_FILE="${SOURCE_DIR}/${LOCAL_GITCONFIG_FILE}"
    TARGET_FILE="${TARGET_DIR}/${INSTALLED_GITCONFIG_FILE}"
    ln -sf "${SOURCE_FILE}" "${TARGET_FILE}"
    echo "Installed settings ${TARGET_FILE} from ${SOURCE_DIR}"
}

check_directory
check_environment_variables
create_gitconfig_from_template
install_gitconfig
