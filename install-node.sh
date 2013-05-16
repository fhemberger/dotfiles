#!/bin/sh

CURRENT=$(node -v)
VERSION=$(curl -L -s http://nodejs.org/dist/latest/ \
    | egrep -o '[0-9]+\.[0-9]+\.[0-9]+' \
    | \tail -n1)
PLATFORM=darwin
ARCH=x64
PREFIX="/usr/local"

if test "v$VERSION" != "$CURRENT"; then
    echo "Installing node v$VERSION ..."
    curl -# -L http://nodejs.org/dist/v$VERSION/node-v$VERSION-$PLATFORM-$ARCH.tar.gz \
      | tar xzvf - --strip-components=1 -C "$PREFIX"
else
    echo "Latest stable version of node already installed."
fi
