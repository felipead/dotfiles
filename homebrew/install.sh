#!/bin/bash

update_homebrew() {
    echo "Updating Homebrew..."
    brew update
}

install_taps() {
    for TAP in $(< 'taps.txt')
    do
        echo "Tapping $TAP..."
        brew tap "$TAP"
    done
}

install_bottles() {
    for BOTTLE in $(< 'bottles.txt')
    do
        echo "Installing $BOTTLE..."
        brew install "$BOTTLE"
    done
}

update_homebrew
install_taps
install_bottles
