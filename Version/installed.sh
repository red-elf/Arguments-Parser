#!/bin/bash

VERSION="Version: "
# shellcheck disable=SC2002
RAW="$(cat /usr/local/lib/pkgconfig/argparse.pc | grep "$VERSION")"
echo "${RAW/$VERSION/}" | xargs