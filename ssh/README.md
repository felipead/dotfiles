Settings for SSH
================

First, generate a new SSH key or restore it from backup.

Then, copy `config.template` to `config.local`, enabling the desired entries.

The `install.sh` script will load these settings into the SSH daemon. It needs to be run inside this directory. Before running it , please export the following environment variables:

- `KEY_NAME`: the name of the desired SSH key name located at `~/.ssh`.

Example:

    KEY_NAME=id_github ./install.sh
