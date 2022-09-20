#!/bin/bash

HERE="$(pwd)"
VERSION="Version: "
VERSION_SCRIPT="$HERE/Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC1090
. "$VERSION_SCRIPT"

PC_FILE="/usr/local/lib/pkgconfig/$VERSIONABLE_NAME.pc"
if ! test -e "$PC_FILE"; then

  PC_FILE="/usr/local/lib64/pkgconfig/$VERSIONABLE_NAME.pc"
fi

# shellcheck disable=SC2002
RAW="$(test -e "$PC_FILE" && cat "$PC_FILE" | grep "$VERSION")" && \
  echo "${RAW/$VERSION/}" | xargs