# How to install GnuPG and pinentry on a Mac

This tutorial assumes you are on macOS using [Homebrew](https://brew.sh).

## Homebrew bottles

Please install the following Homebrew [bottles](../homebrew/bottles/local.txt.template):

```
brew install gnupg
brew install pinentry-mac
```

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
