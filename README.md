# Developer Environment as Code

Builds and installs my development environment, synchronizing settings across machines. Only Mac OS X is fully supported at the moment.

## Usage

```
./install-settings-for <tool>
```

where `<tool>` is the name of the tool to install settings for. Currently, the following are supported:

- [homebrew](homebrew/)
- [zsh](zsh/)
- [git](git/)
- [ssh](ssh/)
- [sublime-text](sublime-text/)
- [npm](npm/) - Node.js
- [pip](pip/) - Python 3

To get more information about the settings for a specific tool, enter its directory and read its documentation.

This script is idempotent, i.e., running it once or several times should produce the same outcome. If the settings are already installed, it will update them with the latest version.

## Disclaimer

I'm a happy [Sublime Text](http://www.sublimetext.com) user and I have no shame to admit it. A long time ago I was a heavy *GNU Emacs* user. After I started using Mac OS X I got frustrated with Emacs' lack of support for `⌘ ←`, `⌘ →`, `⌘ ↓` and `⌘ ↑` shortcuts ([Aquamacs](http://aquamacs.org) is also very ugly). I may convert to *Vim* one day.

## License

[MIT](LICENSE)
