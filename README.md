# toroulette
Run a random version of tor

## Usage

Build specific versions of `tor` using the makefile rule:

```
make bin/tor-0.2.9.12
```

The `toroulette` script will select from the binaries under `bin`. So for
example

```bash
$ ls bin/
tor-0.2.4.27  tor-0.2.5.14  tor-0.2.8.9  tor-0.2.9.10  tor-0.2.9.11  tor-0.2.9.12  tor-0.3.0.10  tor-0.3.1.7  tor-0.3.1.8
$ ./toroulette --version
Tor version 0.2.8.9.
$ ./toroulette --version
Tor version 0.2.9.11 (git-aa8950022562be76).
$ ./toroulette --version
Tor version 0.3.1.8 (git-ad5027f7dc790624).
$ ./toroulette --version
Tor version 0.3.1.8 (git-ad5027f7dc790624).
$ ./toroulette --version
Tor version 0.2.8.9.
```

Note that all arguments passed to `toroulette` are given directly to the
chosen binary.

To use with the chutney testing tool set the environment variables:

```bash
export CHUTNEY_TOR="/path/to/toroulette"
export CHUTNEY_TOR_GENCERT="/path/to/standard/tor-gencert"
```
