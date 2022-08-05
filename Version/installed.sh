#!/bin/bash

HERE="$(pwd)"
VERSION="Version: "
VERSION_SCRIPT="$HERE/Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC2002
# shellcheck disable=SC1090
. "$VERSION_SCRIPT" && \
  RAW="$(cat /usr/local/lib/pkgconfig/"$VERSIONABLE_NAME".pc | grep "$VERSION")" && \
  echo "${RAW/$VERSION/}" | xargs