SSH keys
========

- [How to generate a new SSH key](HOWTO/generate-new-ssh-key.md)
- [How to add a SSH identity](HOWTO/add-ssh-identity.md)

Setup
-----

First, generate a new SSH key or restore it from backup.

Then, copy `config.template` to `config.local`, enabling the desired entries.

The `install.sh` script will load these settings into the SSH daemon. It needs to be run inside this directory. Before running it, please pass the following environment variables:

- `KEY_NAME`: the name of the desired SSH key name located at `~/.ssh`.

Example:

```sh
KEY_NAME=id_github ./install.sh
```

⚠️ For security reasons, the `config.local` file will be deleted at the end.
