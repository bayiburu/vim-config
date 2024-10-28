# vim-config
The ultimate Vim configuration.

## Requires

- gcc
- gcc-c++
- cmake
- python
- python-devel

## Installation

This script should be run via curl:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/bayiburu/vim-config/refs/heads/master/install.sh)"
```
or wget:
```sh
sh -c "$(wget -qO- https://raw.githubusercontent.com/bayiburu/vim-config/refs/heads/master/install.sh)"
```

If you occur this error:

> ➜  .vim git:(master) make init
> xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun

then run the command:

```sh
xcode-select --install
```
