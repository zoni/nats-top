#!/bin/bash

set -e

WORKDIR=debian
VERSION="$1"
ARCH="x86_64"
MAINTAINER="Nick Groenen <nick@groenen.me>"
DESCRIPTION="Top like program monitor for NATS"
URL="https://github.com/zoni/nats-top"

if [ $# -ne 1 ]; then
	echo "Usage: makedeb.sh <version>"
	exit 1
fi
set -x

mkdir -p $WORKDIR/usr/bin
go build
cp nats-top $WORKDIR/usr/bin
fpm -t deb -s dir -C $WORKDIR --name nats-top --version "$VERSION" --architecture "$ARCH" --maintainer "$MAINTAINER" --description "$DESCRIPTION" --url "$URL" --deb-compression xz --deb-no-default-config-files -f .
