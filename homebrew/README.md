Homebrew
========

The `install.sh` script will install [Homebrew](http://brew.sh) and [Homebrew Cask](https://caskroom.github.io) packages into the system.

To use it:

    $ ./install.sh

Bottles
-------

A bottle is Homebrew's standard package.

To search for a bottle, use:

    $ brew search <something>

To know more about a specific bottle, use:

    $ brew info <bottle>

The following files control which bottles are going to be installed:

- [`bottles/versioned.txt`](bottles/versioned.txt) contains a list of bottles to be installed. This list will also be versioned on git and shared among all machines.
- `bottles/local.txt`, if present, is expected to contain a list of bottles that should be installed only on the local machine (they are not supposed to be checked-in under version control). A template is available at [`bottles/local.txt.template`](bottles/local.txt.template).

Casks
-----

A cask is a special package, designed to install larger binaries and applications. It's only available through the Homebrew Cask plugin.

To search for a cask, use:

    $ brew cask search <something>

To know more about a specific cask, use:

    $ brew cask info <cask>

The following files control which casks are going to be installed:

- [`casks/versioned.txt`](casks/versioned.txt) contains a list of casks to be installed. This list will also be versioned on git and shared among all machines.
- `casks/local.txt`, if present, is expected to contain a list of casks that should be installed only on the local machine (they are not supposed to be checked-in under version control). A template is available at [`casks/local.txt.template`](casks/local.txt.template).

Taps
----

A tap is similar to a repository where homebrew can find more packages, called "bottles". The following files control which taps are going to be installed:

- [`taps/versioned.txt`](taps/versioned.txt) contains a list of taps to be installed. This list will also be versioned on git and shared among all machines.
- `taps/local.txt`, if present, is expected to contain a list of taps that should be installed only on the local machine (they are not supposed to be checked-in under version control). A template is available at [`taps/local.txt.template`](taps/local.txt.template).
