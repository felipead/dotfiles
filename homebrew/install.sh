#!/bin/bash

update() {
    echo "Updating Homebrew..."
    brew update
    echo "Updating Homebrew Cask..."
    brew cask update
}

install_taps() {
    for TAP in $(< 'taps.txt')
    do
        echo "Tapping $TAP..."
        brew tap "$TAP"
    done
}

install_casks() {
    for CASK in $(< 'casks.txt')
    do
        echo "Installing cask $CASK..."
        brew cask install "$CASK"
    done
}

install_bottles() {
    for BOTTLE in $(< 'bottles.txt')
    do
        echo "Installing bottle $BOTTLE..."
        brew install "$BOTTLE"
    done
}

update
install_taps
install_casks
install_bottles
