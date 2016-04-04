Settings for Homebrew
=====================

The `install.sh` script will install [Homebrew](http://brew.sh) and [Homebrew Cask](https://caskroom.github.io) packages into the system.

To use it:

    $ ./install.sh

Taps
----

A tap is similar to a repository where homebrew can find more packages, called "bottles". The following files control which taps are going to be installed:

- [`taps/versioned.txt`](taps/versioned.txt) contains a list of taps to be installed. This list will also be versioned on git and shared among all machines.
- [`taps/local.txt`](taps/local.txt) contains a list of taps that should only be installed on the local machine (should not be checked in).

Bottles
-------

A bottle is Homebrew's standard package.

To search for a bottle, use:

    $ brew search <something>

To know more about a specific bottle, use:

    $ brew info <bottle>

The following files control which bottles are going to be installed:

- [`bottles/versioned.txt`](bottles/versioned.txt) contains a list to that will be installed. This list will also be versioned on git and shared among all machines.
- [`bottles/local.txt`](bottles/local.txt) contains a list of bottles that should only be installed on the local machine (should not be checked in).

Casks
-----

A cask is a special package, designed to install larger binaries and applications. It's only available through the Homebrew Cask plugin.

To search for a cask, use:

    $ brew cask search <something>

To know more about a specific cask, use:

    $ brew cask info <cask>

The following files control which casks are going to be installed:

- [`casks/versioned.txt`](casks/versioned.txt) contains a list of to will be installed. This list will also be versioned on git and shared among all machines.
- [`casks/local.txt`](casks/local.txt) contains a list of casks that should only be installed on the local machine (should not be checked in).
