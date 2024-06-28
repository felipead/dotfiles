#!/bin/bash


SSH_HOME=~/.ssh
CONFIG_TEMPLATE=config.template
LOCAL_CONFIG=./config.local
TARGET_CONFIG="${SSH_HOME}/config"
PRIVATE_KEY_PATH="${SSH_HOME}/${KEY_NAME}"


check_environment_variables() {
    if [[ -z "${KEY_NAME}" ]]
    then
        echo "Please set the KEY_NAME environment variable with the desired SSH key name located at ${SSH_HOME}. Example: KEY_NAME=id_github"
        exit -1
    fi
}

check_local_config() {
    if [ ! -f "${LOCAL_CONFIG}" ]
    then
        echo "${LOCAL_CONFIG} not found! Did you copy it from ${CONFIG_TEMPLATE}?"
        exit -1
    fi
}

check_if_private_key_exists() {
    if [ ! -f "${PRIVATE_KEY_PATH}" ]
    then
        echo "Could not find private key at ${PRIVATE_KEY_PATH}. Please add it and run this script again."
        exit -1
    fi
}

copy_config_template_to_target() {
    if [ -f "${TARGET_CONFIG}" ]
    then
        read -p "File ${TARGET_CONFIG} already exists. Overwrite? [y/n] " -n 1 -r
        echo

        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            echo "Aborted."
            exit -1
        fi
    fi

    ln -sf "${LOCAL_CONFIG}" "${TARGET_CONFIG}"
}

add_ssh_identity() {
    ssh-add ${PRIVATE_KEY_PATH}
}

check_environment_variables
check_local_config
check_if_private_key_exists
copy_config_template_to_target
add_ssh_identity
