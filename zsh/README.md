Settings for Zsh
================

I use [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh).

This script will install Oh My Zsh (if not already installed) and then install my settings.

Pre-Requisites:

* Unix-based operating system (Mac OS X or Linux).
* [Zsh](http://www.zsh.org) should be installed (v4.3.9 or more recent). If not pre-installed (`zsh --version` to confirm), check the following instruction here: [Installing Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH).
* `curl` should be installed.
* `git` should be installed.

Setup
-----

There's a [`install.sh`](./install.sh) script in this folder. Just run it.

There are two shell configuration files to install:

- [`.zshrc`](.zshrc) - this is the main Zsh entry point and contain the global Zsh and shell settings.
- `.local.zsh` (_optional_) - if present, this file will load specific settings that only make sense for this particular machine.

The script will always install the `.zshrc` file. But it will ignore `.local.zsh` if not present in this folder.

There's a [`.local.zsh.template`](.local.zsh.template) file. You can copy it to `.local.zsh` and customize it at will.
