# nvx

Node.js Version eXecute - Run a command with a specific version of Node.js.

This is to _nvm_, like _vex_ is to _virtualenv_. It's a simpler tool that runs a
single command with a specific version of Node.js. The command can be anything.
If a shell is started, this provides similar functionality to _nvm_, except that
the environment exists until you exit the shell.

This is useful in situations where you don't want to change the environment,
for instance in installation scripts.

## Installation

No installation required, just copy or symlink `nvx.sh` to a directory in your system path, e.g. `~/.local/bin`.

In some situations, it might be convenient to just run it once, without installation:

```
curl -s https://raw.githubusercontent.com/ropez/nvx/master/nvx.sh | sh -s v0.10.38 npm install
```

## Usage

```
nvx.sh NODE_VERSION command...
```

Each version of Node.js is downloaded automatically the first time it's used.

### Examples

```
nvx.sh v0.10.38 npm install -g babel
nvx.sh v0.10.38 babel script.jsx
nvx.sh v0.10.38 zsh
```

## Roadmap

- Detect non-linux OS

## References

- https://github.com/creationix/nvm
- https://github.com/sashahart/vex
