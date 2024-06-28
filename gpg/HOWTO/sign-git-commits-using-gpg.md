# How to sign Git commits using GPG

## Requirements

Please [install GnuPG and pinentry](HOWTO/install-gnupg-and-pinentry-on-mac.md).

Then, [generate a new GPG key](HOWTO/generate-and-manage-gpg-keys.md).

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

If you are using [my Git config](../git), this will be taken care of. You can skip the instructions below.

In order to explicitly enable GPG signining with Git:

```sh
git config --global gpg.program gpg
git config --global commit.gpgsign true
```

From the list of GPG keys, copy the long form of the GPG key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:

```sh
$ gpg --list-secret-keys --keyid-format=long
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Felipe Dornelas <foo@example.com>
ssb   4096R/4BB6D45482678BE3 2016-03-10
```

Then, finally register your key:

```sh
git config --global user.signingkey 3AA5C34371567BD2
```

## Verifying Git commits are signed

After you've run a signed commit, you can verify it signed with:

```sh
git log --show-signature -1
```

You should see something like:

```
gpg: Signature made Mon Jan 30 03:33:33 2023 -03
gpg:                using RSA key ************************3AA5C34371567BD2
gpg: Good signature from "Felipe Dornelas <foo@example.com>" [ultimate]
```

Lastly, please see [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits) for GitHub integration.
