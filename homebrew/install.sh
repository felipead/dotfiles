#!/bin/bash

update_homebrew() {
    echo "Updating Homebrew..."
    brew update
}

install_packages() {
    for PACKAGE in $(< 'packages.txt')
    do
        echo "Installing $PACKAGE..."
        brew install "$PACKAGE"
    done
}

update_homebrew
install_packages
