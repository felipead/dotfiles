#!/bin/bash


update_homebrew() {
    echo 'Updating Homebrew...'
    brew update
}

load_list_of() {
    local installables=$1
    echo $(cat "$installables/versioned.txt" "$installables/local.txt")
}

is_tap_installed() {
    local tap=$1
    [[ $(brew tap | grep "$tap") ]]
}

install_tap() {
    local tap=$1
    if ! is_tap_installed "$tap"
    then
        echo "Tapping $tap..."
        brew tap "$tap"
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

is_cask_installed() {
    local cask=$1
    [[ -z $(brew cask info "$cask" | grep -i 'not installed') ]]
}

install_cask() {
    local cask=$1
    if ! is_cask_installed "$cask"
    then
        echo "Installing cask $cask..."
        brew cask install "$cask"
    fi
}

install_casks() {
    prepare_homebrew_cask
    for cask in $(load_list_of casks)
    do
        install_cask "$cask"
    done
}

is_bottle_installed() {
    local bottle=$1
    [[ -z $(brew info "$bottle" | grep -i 'not installed') ]]
}

install_bottle() {
    local bottle=$1
    if ! is_bottle_installed "$bottle"
    then
        brew install "$bottle"
    fi
}

install_bottles() {
    for bottle in $(load_list_of bottles)
    do
        install_bottle "$bottle"
    done
}

main() {
    update_homebrew
    install_taps
    install_casks
    install_bottles
}

main
