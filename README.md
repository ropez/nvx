# nvx

Node.js Version eXecute - Run a command with a specific version of Node.js.

This is to _nvm_, like _vex_ is to _virtualenv_. It's a simpler tool that runs a
single command with a specific version of Node.js. The command can be anything.
If a shell is started, this provides similar functionality to _nvm_, except that
the environment removed only by exiting the shell.

This is useful in environments where you don't want to update the shell environment,
for instance in installation scripts.

# Usage

```
nvx.sh NODE_VERSION command...
```

Each version version of Node.js is downloaded automatically the first time it's used.

# Example

```
nvx.sh v0.10.38 npm install -b babel
nvx.sh v0.10.38 babel script.jsx
```

# Roadmap

- Detect OS, currently hard-coded to `linux-x64`
- More options (home directory etc.)

# References

- https://github.com/creationix/nvm
- https://github.com/sashahart/vex
