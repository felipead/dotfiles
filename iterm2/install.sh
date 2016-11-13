#!/bin/bash

install() {
    local plist="com.googlecode.iterm2.plist"
    local preferences_dir="${HOME}/Library/Preferences/"

    cp $plist $preferences_dir
    plutil -convert binary1 "${preferences_dir}/${plist}"

    echo "Installed $plist to $preferences_dir as Apple binary property list"
}

install
