#!/bin/bash

sublime_home="${HOME}/Library/Application Support/Sublime Text 2"

source_dir=`pwd`
target_dir="${sublime_home}/Packages/User"


for i in Preferences Python Ruby
do
    rm -f "${target_dir}/${i}.sublime-settings"
    ln -s "${source_dir}/${i}.sublime-settings" "${target_dir}/${i}.sublime-settings"
done
