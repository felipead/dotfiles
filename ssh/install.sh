#!/bin/bash


SSH_HOME=~/.ssh
CONFIG_TEMPLATE=config.template
LOCAL_CONFIG_FILE=config.local
TARGET_CONFIG="${SSH_HOME}/config"

check_local_config() {
    if [ ! -f "${LOCAL_CONFIG_FILE}" ]
    then
        echo "${LOCAL_CONFIG_FILE} not found! Did you copy it from ${CONFIG_TEMPLATE}?"
        exit -1
    fi
}

install_ssh_config() {
    if [ -f "${TARGET_CONFIG}" ]
    then
        read -p "File ${TARGET_CONFIG} already exists. Overwrite? [y/n] " -n 1 -r
        echo

        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            echo "Aborted."
            exit -1
        fi
        rm -f "${TARGET_CONFIG}"
    fi

    LOCAL_DIR=$(pwd)
    LOCAL_CONFIG="${LOCAL_DIR}/${LOCAL_CONFIG_FILE}"

    cp "${LOCAL_CONFIG}" "${TARGET_CONFIG}"
    echo "Installed SSH settings from ${LOCAL_CONFIG} into ${TARGET_CONFIG}"

    # security hardening
    chmod 600 "${TARGET_CONFIG}"
    chmod 600 "${LOCAL_CONFIG}"
}

check_local_config
install_ssh_config
