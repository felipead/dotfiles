# dotfiles

Installs my development environment settings. Only OS X is supported at the moment, but most of these settings will work on Linux without any modifications.

I'm a happy [Sublime Text](http://www.sublimetext.com) user and I have no shame to admit it. A long time ago I was a heavy *GNU Emacs* user. After I started using Mac OS X I got frustrated with Emacs' lack of support for `⌘ ←`, `⌘ →`, `⌘ ↓` and `⌘ ↑` shortcuts ([Aquamacs](http://aquamacs.org) is also very ugly). I may convert to *Vim* one day.

## Usage

```
./install-settings-for <tool>
```

where `<tool>` is the name of the tool to install settings for. Currently, the following are supported:

- [git](git/)
- [homebrew](homebrew/)
- [npm](npm/)
- [sublime-text](sublime-text/)
- [zsh](zsh/)

To get more information about the settings for a specific tool, enter its directory and read its documentation.

## License

[MIT License](LICENSE)
