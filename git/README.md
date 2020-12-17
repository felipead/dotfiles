Settings for Git
================

The `install.sh` script will install my settings for Git. It needs to be run inside this directory.

Before running it, please export the following environment variables:

- `GIT_NAME`: the name to be used in Git commit messages. Ex: "Felipe Dornelas".
- `GIT_EMAIL`: the e-mail to be used in Git commit messages. This e-mail should be preferably the e-mail associated with your GitHub account. Ex: "foo@example.com".
- `GIT_GPG`: the gpg key to be used to sign Git commit messages.

The script will generate `*.local` files from templates (ex: `gitconfig.local`). Do not edit those files, as the changes will be lost everyime the script is run. Instead, edit the corresponding `*.template` file (ex: `gitconfig.template`).
