# VimSettings
The ultimate Vim configuration.

## Requires

- gcc
- gcc-c++
- cmake
- python
- python-devel

## Installation

```sh
cd ~ & git clone https://github.com/joywek/VimSettings.git .vim & cd .ssh & make install
```

If you occur this error:

> ➜  .vim git:(master) make init
> xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun

then run the command:

```sh
xcode-select --install
```
