#!/bin/bash

SSH_HOME=~/.ssh
PRIVATE_KEY="${SSH_HOME}/id_rsa"
CONFIG_TARGET="${SSH_HOME}/config"
CONFIG_TEMPLATE=config.template

check_directory() {
    if [ ! -f "${CONFIG_TEMPLATE}" ]
    then
        echo "${CONFIG_TEMPLATE} not found! Are you running this script inside its directory?"
        exit -1
    fi
}

check_if_private_key_exists() {
    if [ ! -f "${PRIVATE_KEY}" ]
    then
        echo "Could not find private key at ${PRIVATE_KEY}. Please add it and run this script again."
        exit -1
    fi
}

copy_config_template_to_target() {
    if [ -f "${CONFIG_TARGET}" ]
    then

        read -p "File ${CONFIG_TARGET} already exists. Overwrite? [y/n] " -n 1 -r
        echo

        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            echo "Aborted."
            exit -1
        fi
    fi

    cp "${CONFIG_TEMPLATE}" "${CONFIG_TARGET}"
}

add_ssh_identity() {
    ssh-add -K ${PRIVATE_KEY}
}

check_directory
check_if_private_key_exists
copy_config_template_to_target
add_ssh_identity
