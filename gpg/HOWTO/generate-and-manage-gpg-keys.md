# How to generate and manage GPG keys

## Generate a new GPG key pair

This will generate a new GPG key pair and register it into your system ([source](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key)):

```sh
gpg --full-generate-key
```

## List all secret keys

In order to list all installed secret keys

```sh
gpg --list-secret-keys --keyid-format LONG
```

## Export the keys

You will need to [export your keys](https://unix.stackexchange.com/questions/481939/how-to-export-a-gpg-private-key-and-public-key-to-a-filenewreg=f4e6ed2de5ad4fd0b35352bd63e304a3) for backup purposes, or for registering the public key into an application (eg: GitHub or encrypted email).

Exporting the public key:

```sh
gpg --output public.pgp --armor --export foo@example.com
```

Exporting the private key:

```sh
gpg --output private.pgp --armor --export-secret-key foo@example.com
```

## Importing the keys

Importing the keys is useful if you are restoring them from a backup, for example:

```sh
gpg --import private.pgp
gpg --import public.gpg
```
