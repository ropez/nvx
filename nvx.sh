#!/bin/sh -e

SCRIPT="$(basename $0)"

die() {
  echo "[$SCRIPT] $@" >&2
  exit 1
}

if [ $# -lt 2 ]; then
  die "Usage: $SCRIPT NODE_VERSION command..."
fi

VERSION="$1"
MIRROR="http://nodejs.org/dist"

if [ -z "$NVX_DIR" ]; then
  NVX_DIR="${HOME:-/tmp}/.nvx"
fi

get_os() {
  case `uname -s` in
    Linux) echo 'linux' ;;
    *) die "OS not supported" ;;
  esac
}

get_arch() {
  case `uname -m` in
    x86_64)
      echo 'x64' ;;
    i*86)
      echo 'x86' ;;
    *)
      die "ARCH not supported" ;;
  esac
}

if [ ! -e "$NVX_DIR/$VERSION" ]; then
  OS=`get_os`
  ARCH=`get_arch`
  DIRNAME="node-${VERSION}-${OS}-${ARCH}"
  TARBALL="${DIRNAME}.tar.gz"
  TARBALL_URL="$MIRROR/$VERSION/$TARBALL"

  TMP=$(mktemp --tmpdir -d nvx-XXXXXX)
  echo "[$SCRIPT] downloading $TARBALL..."
  curl -sf "$TARBALL_URL" -o "$TMP/$TARBALL" || die "$TARBALL not found"
  tar xzf "$TMP/$TARBALL" -C "$TMP"

  mkdir -p "$NVX_DIR"
  mv "$TMP/$DIRNAME" "$NVX_DIR/$VERSION"
  rm -r "$TMP"
fi

shift
exec env \
  PATH="$NVX_DIR/$VERSION/bin:$PATH" \
  NODE_PATH="$NVX_DIR/$VERSION/lib/node_modules:$NODE_PATH" \
  "$@"
