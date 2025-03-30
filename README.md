# c-project-template
 project template with mconfig

## Prerequisites

```bash
# Install the required build tools
brew install automake autoconf libtool

# You might also need these dependencies
brew install gperf flex bison ncurses

# Then try the bootstrap again
cd kconfig-frontends
./bootstrap
CFLAGS="-Wno-error=format-security" ./configure
make
make install
```


## Generating header
```makefile
kconfig-mconf Kconfig
./scripts/genconfig.sh
```
