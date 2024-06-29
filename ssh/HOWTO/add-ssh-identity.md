# How to add a SSH identity

After a new SSH key was generated or restored from backup, it needs to be registered with the SSH daemon.

To do this, you can use:

```sh
ssh-add ~/.ssh/id_your_key
```

where `id_your_key` is your key ID.

If you want to store and load the passphrase from macOS Keychain, you can use:

```sh
ssh-add -K ~/.ssh/id_your_key
```

Please keep in mind though that the macOS Keychain might not be the most secure location to store your SSH passphrase.
