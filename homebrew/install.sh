#!/bin/bash


update_homebrew() {
    echo 'Updating Homebrew...'
    brew update
}

load_list_of() {
    echo $(cat "$1/versioned.txt" "$1/local.txt")
}

install_tap() {
    if [[ ! $(brew tap | grep "$1") ]]; then
        echo "Tapping $1..."
        brew tap "$1"
    else
        echo "Already tapped: $1"
    fi
}

install_taps() {
    for tap in $(load_list_of taps); do
        install_tap "$tap"
    done
}

prepare_homebrew_cask() {
    install_tap 'caskroom/cask'
    echo 'Updating Homebrew Cask...'
    brew cask update
}

install_casks() {
    prepare_homebrew_cask
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
