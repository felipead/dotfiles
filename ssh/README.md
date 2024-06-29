SSH keys
========

- [How to generate a new SSH key](HOWTO/generate-new-ssh-key.md)
- [How to add a SSH identity](HOWTO/add-ssh-identity.md)

Setup
-----

Copy `config.template` to `config.local`, enabling the desired entries:

```sh
cp config.template config.local
```

The `install.sh` script will load these settings into the SSH daemon. It needs to be run inside this directory.

⚠️ For security reasons, the script will delte `config.local` at the end.
