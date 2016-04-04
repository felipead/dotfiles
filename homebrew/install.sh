#!/bin/bash


update_homebrew() {
    echo 'Updating Homebrew...'
    brew update
}

load_list_of() {
    local installables="$1"
    echo $(cat "$installables/versioned.txt" "$installables/local.txt")
}

is_tap_installed() {
    local tap="$1"
    [[ $(brew tap | grep "$tap") ]]
}

install_tap() {
    local tap="$1"
    if ! is_tap_installed "$tap"
    then
        echo "Tapping $tap..."
        brew tap "$tap"
    else
        echo "Already tapped: $tap"
    fi
}

install_taps() {
    for tap in $(load_list_of taps)
    do
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
    for cask in $(load_list_of casks)
    do
        echo "Installing cask $cask..."
        brew cask install "$cask"
    done
}

install_bottles() {
    for bottle in $(load_list_of bottles)
    do
        echo "Installing bottle $bottle..."
        brew install "$bottle"
    done
}

main() {
    update_homebrew
    install_taps
    install_casks
    install_bottles
}

main
