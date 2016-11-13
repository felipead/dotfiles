#!/bin/bash

copy_properties_to_current_directory() {
    local plist="com.googlecode.iterm2.plist"
    local preferences_dir="${HOME}/Library/Preferences/"

    cp "${preferences_dir}/${plist}" .
    plutil -convert xml1 "./${plist}"

    echo "Copied $plist to current directory as XML 1.0 property list"
}

copy_properties_to_current_directory
