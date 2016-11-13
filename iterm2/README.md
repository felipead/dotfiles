Settings for iTerm2
===================

Run the `install.sh` script without arguments, which will install `com.googlecode.iterm2.plist` as Apple binary property list.

Whenever you want to archive your iTerm2 settings into version control, run the `copy-properties-to-local-directory.sh` script, which will copy `com.googlecode.iterm2.plist` to the current directory and convert it to XML 1.0 document. Then, commit the changes on git.
