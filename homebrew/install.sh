#!/bin/bash

CASK_TAP='caskroom/cask'

update_homebrew() {
    echo 'Updating Homebrew...'
    brew update
}

ensure_homebrew_cask_is_tapped() {
    if [[ ! $(brew tap | grep "$CASK_TAP") ]]; then
        echo 'Tapping Homebrew Cask...'
        brew tap "$CASK_TAP"
    fi
}

update_homebrew_cask() {
    echo 'Updating Homebrew Cask...'
    brew cask update
}

load_list_of() {
    echo $(cat "$1/versioned.txt" "$1/local.txt")
}

install_taps() {
    for tap in $(load_list_of taps); do
        echo "Tapping $tap..."
        brew tap "$tap"
    done
}

install_casks() {
    ensure_homebrew_cask_is_tapped
    update_homebrew_cask
    for cask in $(load_list_of casks); do
        echo "Installing cask $cask..."
        brew cask install "$cask"
    done
}

install_bottles() {
    for bottle in $(load_list_of bottles); do
        echo "Installing bottle $bottle..."
        brew install "$bottle"
    done
}

update_homebrew
install_taps
install_casks
install_bottles
