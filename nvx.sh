#!/bin/sh -e

VERSION="$1"
MIRROR="http://nodejs.org/dist"

if [ -z "$NVXDIR" ]; then
  NVXDIR="${HOME:-/tmp}/.nvx"
fi

# TODO detect OS
OS="linux-x64"

DIRNAME="node-${VERSION}-${OS}"
TARBALL="$MIRROR/$VERSION/${DIRNAME}.tar.gz"

if [ ! -e "$NVXDIR/$DIRNAME" ]; then
  mkdir -p "$NVXDIR"
  curl -s "$TARBALL" | tar xz -C "$NVXDIR"
fi

shift
exec env PATH="$NVXDIR/$DIRNAME/bin:$PATH" NODE_PATH="$NVXDIR/$DIRNAME/lib/node_modules:$NODE_PATH" "$@"
