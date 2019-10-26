#!/bin/bash

# Gets rid of the annoying "application downloaded from the internet" message when running apps installed using Homebrew Cask
# https://apple.stackexchange.com/questions/337320/how-to-get-rid-of-application-downloaded-from-the-internet-message-when-instal

APPLICATIONS=(
    Dropbox.app
    AppCleaner.app
    Authy\ Desktop.app
    Caption.app
    CleanMyMac\ X.app
    Docker.app
    Dropbox.app
    Firefox.app
    Google\ Chrome.app
    Grammarly.app
    Intellij\ IDEA\ CE.app
    iTerm.app
    Kaleidoscope.app
    Name\ Mangler.app
    Paw.app
    Postman.app
    PyCharm\ CE.app
    Sequel\ Pro.app
    Sip.app
    SoapUI-5.5.0.app
    SoundCleod.app
    Spectacle.app
    Spotify.app
    Sublime\ Text.app
    The\ Unarchiver.app
    Transmission.app
    Viscosity.app
    VLC.app
    WhatsApp.app
    zoom.us.app
)

for app in "${APPLICATIONS[@]}"
do
    sudo xattr -r -d com.apple.quarantine "/Applications/${app}"
done
