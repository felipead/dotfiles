Settings for Git
================

The `install.sh` script will install my settings for Git. It needs to be run inside this directory.

Before running it, please export the following environment variables:

- `GIT_NAME`: the name to be used in Git commit messages. Ex: "Felipe Dornelas".
- `GIT_EMAIL`: the e-mail to be used in Git commit messages. This e-mail should be preferably the e-mail associated with your GitHub account. Ex: "foo@example.com".
- `GIT_GPG_KEY`: the gpg key to be used to sign Git commit messages.

Example:

```sh
GIT_NAME="Felipe Dornelas" GIT_EMAIL=foo@example.com GIT_GPG_KEY=3AA5C34371567BD2 ./install.sh
```
