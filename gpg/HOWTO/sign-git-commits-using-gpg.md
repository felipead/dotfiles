# How to sign Git commits using GPG

From [here](https://stackoverflow.com/a/40066889).

## Requirements

This tutorial assumes you are on macOS using [Homebrew](https://brew.sh).

Please install the following Homebrew [bottles](https://github.com/felipead/dotfiles/blob/master/homebrew/bottles/local.template):

- `gnupg`
- `pinentry-mac`


## Configuration

First ensure `pinentry-mac` is correctly installed and added to your `$PATH`:

```sh
which pinentry-mac
```

Then, link `pinentry-mac` to `gpg-agent.conf`:

```sh
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
```

Restart the `gpg-agent` for changes to make effect:

```sh
killall gpg-agent
```

## Testing

Testing the GPG agent:

```sh
echo "test" | gpg --clearsign
```

You should see something like

```
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

test
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkgeJ7iMBhaWhoI3g/THxE8c9ICcFAmZ+NwAACgkQ/THxE8c9
ICcd0g//Zmn3e2vjoNSm8cUnxrxj/dCUPWNxCzgJ8FmqfvudTDHj7v+kfcvYPRrS
09XiWQnfACV999zs2IPzH1MulT0x3Ua8WGKbDwktTq722+uEPKfZfkJknJ0nG5wI
I5XnJdc+t8Ln8gfH+Oj1lPM/DMEIiDhKkWFjR6WQPCz8NRVFJQVfWjBoGKlUlc92
j5AocvH0Y6l58GcxD/Oc6SMhUC9k7f7hiBlgeifzyvTKdMosWpJ5zCNjphReAEJA
ey+AYJcN0QbsI2kK+OnF/UXSy2We89QdvBLAbLZbfHSnMGHjyU9wqH7z9+TmzES5
LwYSwAJKQbP7ikn6PQlhOnJd82LpGoQtfXzSFoixlOIxyVfRgqDeDvMzkF1xmj6r
oEBmdF28HEFicr0pEqXRHp35nZQj3UkrOu6mb35B7862n0+L+ZAiaVBQemmzxMBb
NGGnu7ZLMnMi/qu7MBzgPMUvMUxBnTELhCH0IojVCmrKidTOsRPU+5zsAfjr7hQ8
vq+B/bA5XSvs7t3Untqw4EZhvsoshmBmJsnjd1xEv+Z5nwUyDSnbDbbIfk0gF5+t
sQN1Gq8HG7gUjHFecy8RzRRrROCyv0LbETOD2TksrFlbxD0oFt/SoRsIz8fzAGZG
d3euMdHF6fLWAQ3ypcM1IAZaEmDL12LrC071rpxIjB8yESJTzoU=
=L3jx
-----END PGP SIGNATURE-----
```

## Git integration

If you are using [my Git config](https://github.com/felipead/dotfiles/blob/master/git), this will be taken care of. You can skip the instructions below.

In order to explicitly enable GPG signining with Git:

```sh
git config --global gpg.program gpg
git config --global commit.gpgsign true
```

Lastly, register your key:

```sh
git config --global user.signingkey YOUR_GPG_SIGNING_KEY
```
