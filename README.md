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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/haitux/vim-config/refs/heads/master/install.sh)"
```
or wget:
```sh
sh -c "$(wget -qO- https://raw.githubusercontent.com/haitux/vim-config/refs/heads/master/install.sh)"
```

If you occur this error:

> ➜  .vim git:(master) make init
> xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun

then run the command:

```sh
xcode-select --install
```

The following error will be encountered during the installation process:

```plain
Error detected while processing /Users/dylan/.vimrc:
line 37:
E185: Cannot find color scheme 'ayu'.
```
This is because the 'ayu' theme has not been installed at this time. Temporarily ignore this error and press any key to continue. The 'ayu' theme will be installed during the subsequent plugin installation process.
